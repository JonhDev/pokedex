import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image_lib;

Future<Color> getImagePrimaryColorFromUrl(String url) async {
  final bytes = await getImageBytesFromUrl(url);
  final colors = extractPixelsColors(bytes);
  return sortColors(colors).first;
}

Future<Uint8List> getImageBytesFromUrl(String url) async {
  final image = await NetworkAssetBundle(Uri.parse(url)).load(url);
  return image.buffer.asUint8List();
}

List<Color> extractPixelsColors(Uint8List? bytes) {
  const noOfPixelsPerAxis = 2;
  List<Color> colors = [];

  List<int> values = bytes!.buffer.asUint8List();
  image_lib.Image? image = image_lib.decodeImage(values);

  List<int?> pixels = [];

  int? width = image?.width;
  int? height = image?.height;

  int xChunk = width! ~/ (noOfPixelsPerAxis + 1);
  int yChunk = height! ~/ (noOfPixelsPerAxis + 1);

  for (int j = 1; j < noOfPixelsPerAxis + 1; j++) {
    for (int i = 1; i < noOfPixelsPerAxis + 1; i++) {
      int? pixel = image?.getPixel(xChunk * i, yChunk * j);
      pixels.add(pixel);
      colors.add(_abgrToColor(pixel!));
    }
  }

  return colors;
}

List<Color> sortColors(List<Color> colors) {
  List<Color> sorted = [];

  sorted.addAll(colors);
  sorted.sort((a, b) => b.computeLuminance().compareTo(a.computeLuminance()));

  return sorted;
}

Color getAverageColor(List<Color> colors) {
  int r = 0, g = 0, b = 0;

  for (int i = 0; i < colors.length; i++) {
    r += colors[i].red;
    g += colors[i].green;
    b += colors[i].blue;
  }

  r = r ~/ colors.length;
  g = g ~/ colors.length;
  b = b ~/ colors.length;

  return Color.fromRGBO(r, g, b, 1);
}

Color _abgrToColor(int argbColor) {
  int r = (argbColor >> 16) & 0xFF;
  int b = argbColor & 0xFF;
  int hex = (argbColor & 0xFF00FF00) | (b << 16) | r;
  return Color(hex);
}

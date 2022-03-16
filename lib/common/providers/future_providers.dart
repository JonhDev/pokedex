import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/color_generator.dart';

final imagePrimaryColorProvider =
    FutureProvider.family<Color, String>(((ref, url) async {
  return await getImagePrimaryColorFromUrl(url);
}));

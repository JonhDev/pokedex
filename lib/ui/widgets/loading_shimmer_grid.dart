import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerGrid extends StatelessWidget {
  const LoadingShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220,
            crossAxisSpacing: 16,
            mainAxisSpacing: 10,
            crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[500]!);
        });
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 198, 197, 197),
      highlightColor: const Color.fromARGB(255, 249, 249, 249),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }
}

class ItemShimmer extends StatelessWidget {
  final Size screenSize;
  final bool isBooks; 
  final bool isAuthors;
  const ItemShimmer({super.key, required this.screenSize,required this.isBooks,required this.isAuthors}); 
  @override
  Widget build(BuildContext context) {
    return isBooks ? GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(height: screenSize.height/4,width: screenSize.width/2.1,),
            Skeleton(height: screenSize.height/100,width: screenSize.width/2.1,),
            Skeleton(height: screenSize.height/100,width: screenSize.width/3.3,),
            Skeleton(height: screenSize.height/100,width: screenSize.width/4,),
          ],
        );
      },
    ) :
    isAuthors ?
    ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(screenSize.width / 100),
          child: Skeleton(height: screenSize.height/13,),
        );
      },
    )
    : const SizedBox.shrink();
  }
}
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CostumCard extends StatelessWidget {
  final Color? color;
  final Widget? chlidCard;
  final double? height;

  final String? image;
  const CostumCard({
    this.chlidCard,
    this.height,
    this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color,
      ),
      child: Stack(
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image!,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
        image: DecorationImage(
          image: NetworkImage(
            image.toString(),
          ),
        ),
      ),
    );
  }
}

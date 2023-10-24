import 'package:flutter/material.dart';

class LoadAssetImage extends StatelessWidget{
  const LoadAssetImage(this.image,{
    super.key,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.color
  });

  final String image;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context){
    return Image.asset(
      'images/$image.png',
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,
      excludeFromSemantics: true,
    );
  }
}
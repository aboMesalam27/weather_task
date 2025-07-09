import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImageView extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomImageView({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.isEmpty) {
      return errorWidget ?? const Icon(Icons.broken_image);
    }

    final isNetwork = imagePath!.startsWith('http');
    final isFile = imagePath!.startsWith('/');

    debugPrint("imagePath: $imagePath");
    debugPrint("isNetwork: $isNetwork");
    debugPrint("isFile: $isFile");

    Widget imageWidget;

    if (isFile) {
      imageWidget = Image.file(
        File(imagePath!),
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? const Icon(Icons.error),
      );
    } else if (isNetwork) {
      imageWidget = CachedNetworkImage(
        imageUrl: imagePath!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
            placeholder ??
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
        errorWidget: (context, url, error) =>
            errorWidget ?? const Icon(Icons.error),
      );
    } else {
      imageWidget = Image.asset(
        imagePath!,
        width: width,
        height: height,
        fit: fit,
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: imageWidget,
    );
  }
}

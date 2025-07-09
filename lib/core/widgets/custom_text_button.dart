import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.style,
    this.onTap,
  });
  final String text;
  final TextStyle? style;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Text(
        text,
        style:
            style ??
            Theme.of(context).textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

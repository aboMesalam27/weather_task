import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../values/values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.text,
    this.buttonColor,
    required this.onTap,
    this.isLoading,
  });

  final Widget? child;
  final String? text;
  final Color? buttonColor;
  final void Function()? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Values.baseAppRadius),
          color: buttonColor ?? primaryColor,
        ),
        child: Center(
          child: isLoading == true
              ? const CircularProgressIndicator(color: Colors.white)
              : child ??
                    Text(
                      text ?? "",
                      style: Theme.of(context).textTheme.displaySmall
                          ?.copyWith(color: whiteColor)
                          .copyWith(fontSize: 20),
                    ),
        ),
      ),
    );
  }
}

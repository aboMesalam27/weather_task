import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.textFormFieldLabel,
    required this.controller,
    this.hintText,
  });

  final String textFormFieldLabel;
  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textFormFieldLabel, style: Theme.of(context).textTheme.bodySmall),
        SizedBox(height: 4),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.teal),
              ),
              hintText: hintText ?? '',
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,

              ),
            ),
          ),
        ),
      ],
    );
  }
}

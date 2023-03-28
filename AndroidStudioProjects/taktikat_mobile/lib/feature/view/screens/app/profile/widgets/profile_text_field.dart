import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.icon,
    this.style,
    this.hint = '',
    this.labelText = '',
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  });

  final TextStyle? style;
  final Widget icon;
  final String? hint;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: const UnderlineInputBorder(),
        prefixIcon: icon,
        labelStyle: style ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/color/color_manager.dart';
import '../../core/theme/size/app_size.dart';
import '../../model/enums/border_types.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key,
    required this.hint,
    required this.borderType,
    this.icon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.inputType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.isHaveError = false,
    this.isInputFormatters = false,
    this.borderRadius = 10,
    this.borderColor,
    this.controller,
    this.keyboardType,
    this.filled = false,
    this.hintStyle,
    this.contentPadding,
    this.textStyle,
    this.backgroundColor,
    this.textAlign,
    this.labelText,
    this.isMaxCharTwo = false,
    this.maxLength,
    this.inputFormatters,
  }) : super(key: key);

  final String hint;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final String? Function(String?)? onChanged;
  final Color? borderColor;
  final double borderRadius;
  final bool filled;
  final bool isHaveError, isInputFormatters;
  final BorderTypes borderType;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final String? labelText;
  final bool isMaxCharTwo;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      decoration: ShapeDecoration(
        color: filled ? ColorManager.instance.white : null,
        shape: BeveledRectangleBorder(
            borderRadius:
                BorderRadius.circular(filled ? AppSize.r16 : AppSize.r8)),
      ),
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        controller: controller,
        obscureText:
            keyboardType == TextInputType.visiblePassword ? true : false,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: inputType,
        textInputAction: textInputAction ?? TextInputAction.newline,
        decoration: InputDecoration(
          counterText: '',
          fillColor: backgroundColor,
          labelText: labelText,
          hintText: hint,
          prefixIcon: icon,
          prefixIconConstraints: const BoxConstraints(maxWidth: 30),
          prefix: const SizedBox(width: 5),
          filled: filled,
          enabledBorder: borderType.value == BorderTypes.underlineInput.value
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? ColorManager.instance.textFiledBorder,
                  ),
                )
              : borderType.value == BorderTypes.outline.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                        color: borderColor ??
                            ColorManager.instance.textFiledBorder,
                      ),
                    )
                  : InputBorder.none,
          focusedBorder: borderType.value == BorderTypes.underlineInput.value
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? ColorManager.instance.textFiledBorder,
                  ),
                )
              : borderType.value == BorderTypes.outline.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                        color: borderColor ??
                            ColorManager.instance.textFiledBorder,
                      ),
                    )
                  : InputBorder.none,
          isCollapsed: true,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.instance.textBorderColor,
                  ),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                  vertical: AppSize.h12, horizontal: AppSize.w12),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        onChanged: onChanged,
        style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        inputFormatters: inputFormatters ??
            (isMaxCharTwo
                ? [LengthLimitingTextInputFormatter(2)]
                : isInputFormatters
                    ? [
                        FilteringTextInputFormatter.digitsOnly,
                        CustomInputFormatter()
                      ]
                    : []),
      ),
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            ' '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    final string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

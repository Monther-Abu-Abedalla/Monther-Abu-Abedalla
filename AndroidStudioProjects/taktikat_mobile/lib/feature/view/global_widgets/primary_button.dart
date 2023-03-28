import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

import '../../../utils/utils/utils.dart';
import 'three_size_dot.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.colorBtn,
    this.colorText,
    this.width,
    this.height,
    this.fontSize,
    this.padding,
  }) : super(key: key);
  final String text;
  final void Function() onPressed;
  final bool isLoading;
  final Color? colorBtn, colorText;
  final double? width, height, fontSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          padding ??
              EdgeInsets.symmetric(
                  horizontal: width ?? 10, vertical: height ?? 4),
        ),
        backgroundColor: MaterialStateProperty.all(
          colorBtn ?? Theme.of(context).primaryColor,
        ),
        foregroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.background,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.r12,
            ),
          ),
        ),
      ),
      onPressed: !isLoading
          ? () {
              onPressed();
            }
          : () {},
      child: isLoading
          ? const ThreeSizeDot()
          : Text(
              text,
              textAlign: TextAlign.center,
              style: Utils.instance.getTextTheme.bodyLarge?.copyWith(
                color: colorText ?? ColorManager.instance.white,
                fontSize: fontSize ?? FontSize.fontSize14,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}

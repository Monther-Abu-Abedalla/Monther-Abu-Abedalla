import 'package:flutter/material.dart';
import 'package:taktikat/feature/view/global_widgets/three_size_dot.dart';

import '../../../utils/utils/utils.dart';
import '../../core/theme/color/color_manager.dart';
import '../../core/theme/size/app_size.dart';
import '../../core/theme/text_theme/text_font_size.dart';

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon({
    Key? key,
    required this.icon,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.colorBtn,
    this.colorText,
    this.width,
    this.height,
    this.fontSize,
    this.isExpanded = false,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final void Function() onPressed;
  final bool? isExpanded;
  final bool isLoading;
  final Color? colorBtn, colorText;
  final double? width, height, fontSize;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          Utils.instance.isArabic() ? TextDirection.ltr : TextDirection.rtl,
      child: TextButton.icon(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 12,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            colorBtn ?? Theme.of(context).primaryColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.r12),
            ),
          ),
        ),
        onPressed: !isLoading
            ? () {
                onPressed();
              }
            : () {},
        icon: isLoading ? const SizedBox.shrink() : icon,
        label: isLoading
            ? const ThreeSizeDot()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Utils.instance.getTextTheme.titleLarge?.copyWith(
                  color: colorText ?? ColorManager.instance.white,
                  fontSize: fontSize ?? FontSize.fontSize14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
    // child: isLoading
    //     ? const ThreeSizeDot()
    //     : Row(
    //         textDirection: TextDirection.ltr,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    // Text(text,
    //     textAlign: TextAlign.center,
    //     style: Utils.instance.getTextTheme.titleLarge?.copyWith(
    //       color: colorText ?? ColorManager.instance.white,
    //       fontSize: fontSize ?? FontSize.fontSize14,
    //       fontWeight: FontWeight.w500,
    //     )),
    //           const SizedBox(width: 8),
    // SvgPicture.asset(
    //   ConstSvg.arrow,
    //   height: AppSize.h8,
    //   width: AppSize.w8,
    // ),
    //         ],
    //       ));
  }
}

import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view/global_widgets/my_network_image.dart';

class LineupSwitcher extends StatelessWidget {
  const LineupSwitcher({
    super.key,
    required this.formation,
    required this.teamImage,
    required this.isSelected,
    required this.onChanged,
  });

  final String? formation;
  final String? teamImage;
  final bool isSelected;
  final Function(bool newValue) onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(AppSize.r10),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.r10),
        onTap: () {
          onChanged(!isSelected);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 4),
              Text(
                formation ?? '',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color:
                          !isSelected ? ColorManager.instance.dashColor : null,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 4),
              MyNetworkImage(
                url: teamImage,
                width: AppSize.w20,
                height: AppSize.h20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

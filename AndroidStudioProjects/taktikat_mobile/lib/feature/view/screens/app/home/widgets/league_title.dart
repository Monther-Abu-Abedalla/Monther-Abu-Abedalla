import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';


import '../../../../global_widgets/my_network_image.dart';

class LeagueTitle extends StatelessWidget {
  final String? logo;
  final String? title;

  const LeagueTitle({
    super.key,
    this.logo,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(AppSize.r8),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSize.r8),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                MyNetworkImage(
                  url: logo,
                  width: AppSize.w34,
                  height: AppSize.h34,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text('$title',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: FontSize.fontSize13,
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

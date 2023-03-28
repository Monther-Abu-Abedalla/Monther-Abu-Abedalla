import 'package:flutter/material.dart';
import 'package:taktikat/feature/model/models/home/search_models/search_result.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../global_widgets/my_network_image.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    super.key,
    required this.searchResult,
    required this.onTap,
  });

  final SearchResult searchResult;
  final Function(SearchResult searchResult) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSize.r10),
      onTap: () => onTap(searchResult),
      child: Row(
        children: [
          MyNetworkImage(
            url: searchResult.image,
            width: AppSize.w45,
            height: AppSize.h45,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              searchResult.title ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorManager.instance.secondary,
                    fontSize: FontSize.fontSize12,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

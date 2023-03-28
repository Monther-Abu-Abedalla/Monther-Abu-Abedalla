import 'package:flutter/material.dart';
import 'package:taktikat/feature/model/models/home/search_models/search_result.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/search/serach_result_item.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.title,
    this.searchItems = const [],
    required this.onTap,
  });

  final String title;
  final List<SearchResult> searchItems;
  final Function(SearchResult searchResult) onTap;

  @override
  Widget build(BuildContext context) {
    if (searchItems.isEmpty) {
      return const SizedBox.shrink();
    }
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: ColorManager.instance.dividerColor,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorManager.instance.white,
                  fontSize: FontSize.fontSize11,
                ),
          ),
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: searchItems.length > 4 ? 4 : searchItems.length,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            return SearchResultItem(
              searchResult: searchItems[index],
              onTap: (searchResult) => onTap(searchResult),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

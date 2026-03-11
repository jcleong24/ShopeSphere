import 'package:flutter/material.dart';
import '../models/category_card_data.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryCardData> categories;
  final void Function(CategoryCardData category)? onCategoryTap;

  const CategorySection({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: categories
              .take(4)
              .map(
                (category) => CategoryCard(
                  category: category,
                  onTap: () => onCategoryTap?.call(category),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

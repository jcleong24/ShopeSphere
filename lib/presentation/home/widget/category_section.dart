import 'package:flutter/material.dart';
import '../models/category_card_data.dart';
import 'category_card.dart';
import 'home_header_sub.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryCardData> categories;

  const CategorySection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeHeaderSub(title: 'Categories'),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final crossAxisCount = width >= 600 ? 4 : 2;
            const spacing = 12.0;

            final itemWidth =
                (width - (spacing * (crossAxisCount - 1))) / crossAxisCount;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: categories
                  .map(
                    (category) => SizedBox(
                      width: itemWidth,
                      child: CategoryCard(category: category),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';


class CategoryFilterWidget extends StatefulWidget {
  const CategoryFilterWidget({super.key});

  @override
  _CategoryFilterWidgetState createState() => _CategoryFilterWidgetState();
}

class _CategoryFilterWidgetState extends State<CategoryFilterWidget> {
  List<String> categories = ["الكل", "سيارات", "إلكترونيات", "عقارات", "ملابس", "أثاث", "أجهزة منزلية"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ChoiceChip(
                label: Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                checkmarkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side:  BorderSide(
                    color: selectedIndex == index
                        ? ColorsManager.primary
                        : ColorsManager.primary,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                selected: selectedIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedColor: ColorsManager.primary,
                backgroundColor: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

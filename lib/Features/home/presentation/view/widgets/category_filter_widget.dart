import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class CategoryFilterWidget extends StatefulWidget {
  const CategoryFilterWidget({super.key});

  @override
  _CategoryFilterWidgetState createState() => _CategoryFilterWidgetState();
}

class _CategoryFilterWidgetState extends State<CategoryFilterWidget> {
  List<String> categories = [
    "الكل",
    "سيارات",
    "إلكترونيات",
    "عقارات",
    "ملابس",
    "أثاث",
    "أجهزة منزلية"
  ];
  int selectedIndex = 0;
  bool showAll = false;
  bool _isTapped = false; // For tap animation

  final Map<String, IconData> categoryIcons = {
    "الكل": FluentIcons.grid_24_regular,
    "سيارات": FluentIcons.vehicle_car_24_regular,
    "إلكترونيات": FluentIcons.device_eq_24_regular,
    "عقارات": FluentIcons.building_home_24_regular,
    "ملابس": FluentIcons.person_tag_24_regular,
    "أثاث": FluentIcons.couch_24_regular,
    "أجهزة منزلية": FluentIcons.lightbulb_24_regular,
  };

  @override
  Widget build(BuildContext context) {
    List<String> visibleCategories =
    showAll ? categories : categories.take(4).toList();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الفئات',
            style: TextStyles.extraBold_18.copyWith(color: ColorsManager.primary),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: visibleCategories.length + (showAll ? 0 : 1),
              itemBuilder: (context, index) {
                if (!showAll && index == visibleCategories.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTapDown: (_) => setState(() => _isTapped = true),
                      onTapUp: (_) {
                        setState(() {
                          _isTapped = false;
                          showAll = true;
                        });
                      },
                      onTapCancel: () => setState(() => _isTapped = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        transform: Matrix4.identity()
                          ..scale(_isTapped ? 0.95 : 1.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorsManager.primary,
                              ColorsManager.primary.withOpacity(0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FluentIcons.arrow_circle_right_24_regular,
                              size: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'عرض المزيد',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                final category = visibleCategories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ChoiceChip(
                    avatar: Icon(
                      categoryIcons[category],
                      color: selectedIndex == categories.indexOf(category)
                          ? Colors.white
                          : Colors.black,
                      size: 20,
                    ),
                    label: Text(
                      category,
                      style: TextStyle(
                        color: selectedIndex == categories.indexOf(category)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: ColorsManager.primary),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    selected: selectedIndex == categories.indexOf(category),
                    onSelected: (_) {
                      setState(() {
                        selectedIndex = categories.indexOf(category);
                      });
                    },
                    selectedColor: ColorsManager.primary,
                    backgroundColor: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
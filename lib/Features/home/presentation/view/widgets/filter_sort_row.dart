import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/home_bottom_sheet.dart';

import '../../../../../core/theme/colors.dart';

class FilterSortRow extends StatefulWidget {
  const FilterSortRow({super.key});

  @override
  State<FilterSortRow> createState() => _FilterSortRowState();
}

class _FilterSortRowState extends State<FilterSortRow> {
  String selectedSort = 'الأحدث';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedSort,
                items: const [
                  DropdownMenuItem(
                    value: 'الأحدث',
                    child: Text('الأحدث'),
                  ),
                  DropdownMenuItem(
                    value: 'الأقدم',
                    child: Text('الأقدم'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedSort = value;
                    });
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const HomeBottomSheet(),
              );

            },
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.primary,
              ),
              child: Icon(
                FluentIcons.filter_24_regular,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


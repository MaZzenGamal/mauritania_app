import 'package:flutter/material.dart';
import 'package:mauritania/Features/orders/presentation/views/widgets/orders_list_view_item.dart';

import '../../../../core/theme/styles.dart';

class OrdersScreenBody extends StatelessWidget {
  const OrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'طلباتي',
                style: TextStyles.bold_20,
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const OrdersListViewItem();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}

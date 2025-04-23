import 'package:flutter/material.dart';
import 'package:mauritania/Features/orders/presentation/views/widgets/orders_list_view_item.dart';

class OrdersScreenBody extends StatelessWidget {
  const OrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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

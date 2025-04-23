import 'package:flutter/material.dart';
import 'package:mauritania/Features/orders/presentation/views/orders_screen_body.dart';

import '../../../../core/theme/styles.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('طلباتي', style: TextStyles.bold_20,),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(child: OrdersScreenBody()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mauritania/Features/orders/presentation/views/orders_screen_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrdersScreenBody()),
    );
  }
}

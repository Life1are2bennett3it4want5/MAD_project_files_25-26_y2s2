import 'package:flutter/material.dart';
import 'orderingservice.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),

      body: Column(
        children: [
          Text(OrderingService.tappedMain),
        ],
      )
    );
  }
}
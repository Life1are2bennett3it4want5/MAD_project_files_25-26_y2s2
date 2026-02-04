import 'package:flutter/material.dart';
// cloud_firestore also has a type named "Order", so we hide it to avoid a name clash with our own Order class.
import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'orderingservice.dart';

class OrderSummaries extends StatefulWidget {
  const OrderSummaries({super.key});

  @override
  State<OrderSummaries> createState() => _OrderSummariesState();
}

class _OrderSummariesState extends State<OrderSummaries> {
  // Reads the "orders" list from Firestore and converts it into List<Order>.
  List<Order> _ordersFromFirestore(dynamic raw) {
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((m) => Order.fromMap(Map<String, dynamic>.from(m)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      // Staff view: live list of bills that still need payment/closing.
      body: StreamBuilder<QuerySnapshot>(
        stream: OrderingService.orderData
            .where('status', whereIn: ['unpaid', 'payment_requested'])
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final docs = snapshot.data?.docs ?? const [];
          if (docs.isEmpty) {
            return const Center(child: Text("No unpaid bills"));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>?;

              final batchId = (data?['batchId'] ?? doc.id).toString();
              final table = (data?['table'] ?? '').toString();
              final status = (data?['status'] ?? '').toString();
              final orders = _ordersFromFirestore(data?['orders']);

              return ExpansionTile(
                title: Text(
                  "Batch: $batchId",
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  [
                    if (table.isNotEmpty) "Table: $table",
                    if (status.isNotEmpty) "Status: $status",
                  ].join(" • "),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: status == 'payment_requested'
                        ? Colors.orange
                        : Colors.black87,
                  ),
                ),
                children: [
                  // Show items on the bill.
                  ...orders.map(
                    (order) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Main: ${order.main}"),
                          Text("Appetizers: ${order.appetizers}"),
                          Text("Sides: ${order.sides}"),
                          Text("Drinks: ${order.drinks}"),
                          Text("Dessert: ${order.dessert}"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                // Staff confirms payment and closes the bill.
                                // BillPage is streaming this doc and will hide the bill immediately.
                                await OrderingService.markBillPaid(batchId);
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Bill marked as paid."),
                                  ),
                                );
                              } catch (e) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Error updating bill: $e"),
                                  ),
                                );
                              }
                            },
                            child: const Text("Mark Paid & Close"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

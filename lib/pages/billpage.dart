import 'package:flutter/material.dart';
// cloud_firestore also has a type named "Order", so we hide it to avoid a name clash with our own Order class.
import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'servicefile.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  // This page shows the *current bill*.
  // We do NOT read from the local cart list anymore.
  // Instead, we stream the bill document from Firestore so it updates instantly.

  // Clears the active bill id (so UI shows "No active bill") and optionally shows a message.
  void _clearActiveBillAfterFrame({String? message}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (OrderingService.activeBillBatchId.value != null) {
        OrderingService.activeBillBatchId.value = null;
      }
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    });
  }

  // Reads the "orders" list from Firestore and converts it into List<Order>.
  List<Order> _ordersFromFirestore(dynamic raw) {
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((m) => Order.fromMap(Map<String, dynamic>.from(m)))
        .toList();
  }

  double _calcOrderCost(order) {
    double total = 0;
    total += OrderingService.menuPrices[order.main] ?? 0.0;
    total += OrderingService.menuPrices[order.appetizers] ?? 0.0;
    total += OrderingService.menuPrices[order.sides] ?? 0.0;
    total += OrderingService.menuPrices[order.drinks] ?? 0.0;
    total += OrderingService.menuPrices[order.dessert] ?? 0.0;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Bill"),
      ),
      // Listen to which bill is currently active for this user session.
      body: ValueListenableBuilder<String?>(
        valueListenable: OrderingService.activeBillBatchId,
        builder: (context, batchId, _) {
          if (batchId == null) {
            return const Center(
              child: Text("No active bill"),
            );
          }

          // Listen to the bill document in Firestore in real-time.
          return StreamBuilder<DocumentSnapshot>(
            stream: OrderingService.orderData.doc(batchId).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              final doc = snapshot.data;
              if (doc == null || !doc.exists) {
                // If the doc disappears (or never existed), treat it like the bill is closed.
                _clearActiveBillAfterFrame(
                  message: "Bill closed.",
                );
                return const Center(child: Text("Bill closed."));
              }

              final data = doc.data() as Map<String, dynamic>?;
              final status = (data?['status'] ?? '').toString();
              final table = (data?['table'] ?? '').toString();
              final orders = _ordersFromFirestore(data?['orders']);

              if (status == 'paid' || status == 'cancelled') {
                // IMPORTANT: As soon as staff marks this bill as paid, we hide it from the user.
                _clearActiveBillAfterFrame(
                  message: "Payment received. Bill closed.",
                );
                return const Center(child: Text("Payment received. Bill closed."));
              }

              final totalBill = orders.fold(
                0.0,
                (runningTotal, order) => runningTotal + _calcOrderCost(order),
              );

              return Column(
                children: [
                  if (table.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Table: $table",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: orders.isEmpty
                        ? const Center(child: Text("No items on this bill"))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              final order = orders[index];
                              double orderTotal = _calcOrderCost(order);
                              return Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Order #${index + 1}"),
                                        Text("Main: ${order.main}"),
                                        Text("Appetizers: ${order.appetizers}"),
                                        Text("Sides: ${order.sides}"),
                                        Text("Drinks: ${order.drinks}"),
                                        Text("Dessert: ${order.dessert}"),
                                        Text(
                                            "Order Total: \$${orderTotal.toStringAsFixed(2)}"),
                                      ]),
                                ),
                              );
                            },
                          ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total: \$${totalBill.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          onPressed: status == 'payment_requested'
                              ? null
                              : () async {
                                  try {
                                    // Customer is just requesting payment here.
                                    // Staff will confirm payment later by setting status to "paid".
                                    await OrderingService.requestBillPayment(
                                      batchId,
                                    );
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Payment requested. A staff member will close your bill after payment.",
                                        ),
                                      ),
                                    );
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Error requesting payment: $e"),
                                      ),
                                    );
                                  }
                                },
                          child: Text(
                            status == 'payment_requested'
                                ? "Payment Requested"
                                : "Request Payment",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

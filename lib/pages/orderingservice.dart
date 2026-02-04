import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Order {
  String main = "",
      appetizers = "",
      sides = "",
      drinks = "",
      dessert = "",
      table = "";

  Order(this.main, this.appetizers, this.sides, this.drinks, this.dessert,
      this.table);

  // Turn Firestore data back into an Order object.
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      (map['main'] ?? '').toString(),
      (map['appetizers'] ?? '').toString(),
      (map['sides'] ?? '').toString(),
      (map['drinks'] ?? '').toString(),
      (map['dessert'] ?? '').toString(),
      (map['table'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'main': main,
      'appetizers': appetizers,
      'sides': sides,
      'drinks': drinks,
      'dessert': dessert,
      'table': table,
    };
  }
}

class OrderingService {
  //detect the tapped order
  static String tappedMain = "";
  static String tappedAppetizers = "";
  static String tappedSides = "";
  static String tappedDrinks = "";
  static String tappedDessert = "";
  static String tappedTable = "";

  // In-memory "cart" (orders the user is building right now).
  static List<Order> z = [];

  // Old/local-only archived orders (kept for your staff page before Firestore streaming).
  // Note: staff view now streams Firestore instead, but this is left as-is.
  static Map<String, List<Order>> orders = {};
  static int orderBatchCounter = 1;

  // Old notifier used to refresh bill UI when "z" changed.
  static ValueNotifier<int> notifyBill = ValueNotifier(0);
  // Stores the Firestore document id for the "current active bill" (so BillPage can listen to it).
  static ValueNotifier<String?> activeBillBatchId = ValueNotifier(null);
  static String currentTable = '';

  static CollectionReference orderData =
      FirebaseFirestore.instance.collection("orderDetails");
  
  static Map<String, double> menuPrices = {
    "Spagetti Carbonara": 20.0,
    "Angus Beef Burger": 18.0,
    "Calamari Rings": 8.0,
    "Oyster Fry": 9.0,
    "Fries": 5.0,
    "Salad": 4.0,
    "Onion Rings": 6.0,
    "Ginger Ale": 3.0,
    "Fizzy Peach": 3.5,
    "Pudding": 7.0,
    "Vanilla ice cream": 6.0,
    "None": 0.0,
  };

  static int getCount() {
    return (z.length);
  }

  static void addOrder({
    required String main,
    required String appetizers,
    required String sides,
    required String drinks,
    required String dessert,
    required String table,
  }) {
    z.add(Order(main, appetizers, sides, drinks, dessert, table));
    notifyBill.value++;
  }

  // Creates a new bill document in Firestore for the current cart and returns its batchId.
  static Future<String> pushCurrentCartToFirebase() async {
    final now = DateTime.now();
    String datePart =
        "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";
    String timePart =
        "${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}";

    // Combine into a single unique batchId
    String batchId = "${datePart}_${timePart}_dineIn";
    final table = z.isNotEmpty ? z.first.table : currentTable;

    // Save the bill to Firestore so both user + staff can see the same bill.
    await orderData.doc(batchId).set({
      'batchId': batchId,
      'table': table,
      // Bill "lifecycle" state:
      // unpaid -> payment_requested -> paid (staff sets paid after customer payment)
      'status': 'unpaid',
      'paymentRequestedAt': null,
      'paidAt': null,
      'orders': z.map((order) => order.toMap()).toList(),
      'timestamp': FieldValue.serverTimestamp(),
    });

    // BillPage will use this id to stream the bill in real-time.
    activeBillBatchId.value = batchId;

    // After checkout, we clear the cart so the user can start a new order.
    archiveCurrentCart();
    return batchId;
  }

  // Customer taps "Request Payment" so staff knows they are ready to pay.
  static Future<void> requestBillPayment(String batchId) async {
    // Only changes the status; it does NOT charge money (real payments need Stripe/etc).
    await orderData.doc(batchId).update({
      'status': 'payment_requested',
      'paymentRequestedAt': FieldValue.serverTimestamp(),
    });
  }

  // Staff calls this after payment is received; BillPage auto-hides the bill when status becomes "paid".
  static Future<void> markBillPaid(String batchId) async {
    // This is the key action that "closes" the bill for the customer.
    await orderData.doc(batchId).update({
      'status': 'paid',
      'paidAt': FieldValue.serverTimestamp(),
    });
  }

  static void setTable(String table) {
    currentTable = table;
  }

  static Order getOrderAt(int index) {
    return (z[index]);
  }

  static void archiveCurrentCart(){
    //snapshot the orders in map index
    orders[orderBatchCounter.toString()] = [...z];
    orderBatchCounter++;
    z.clear();
  }
  static void updateOrderByMainDish(String mainDish, String newAppetizers,
      String newSides, String newDrinks, String newDessert, String newTable) {
    for (int i = 0; i < z.length; i++) {
      if (z[i].main == mainDish) {
        z[i].appetizers = newAppetizers;
        z[i].sides = newSides;
        z[i].drinks = newDrinks;
        z[i].dessert = newDessert;
        z[i].table = newTable;
      }
    }
  }

  static void deleteOrder(int index) {
    z.removeAt(index);
  }

  static void deleteOrderByObject(Order order) {

  }
}

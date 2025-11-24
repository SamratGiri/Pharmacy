import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/homepage.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 207, 130),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .orderBy("timestamp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final orders = snapshot.data!.docs;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Text("Order Page", style: AppWidget.fredokabold(40.0)),
                ),
                SizedBox(height: 25),

                Expanded(
                  child: orders.isEmpty
                      ? Center(
                          child: Text(
                            "No orders placed yet.",
                            style: AppWidget.fredokabold(20),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = orders[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFE29F),
                                    Color(0xFFFFD47F),
                                    Color(0xFFFFC85C),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 6,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/images/another_onoe.png",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds["name"] ?? "",
                                          style: AppWidget.fredokamedium(22),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Quantity: ${ds["quantity"]}",
                                          style: AppWidget.fredokamedium(20),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Total Price: \$${(ds["totalPrice"] ?? 0).toStringAsFixed(2)}",
                                          style: AppWidget.fredokamedium(20),
                                        ),
                                        SizedBox(height: 6),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

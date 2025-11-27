import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/bottom_nav.dart';

import 'package:pharmacy/services/database.dart';
import 'package:pharmacy/widgets/support_widget.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String name, description, price;
  DetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  double basePrice = 0;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    basePrice = double.tryParse(widget.price) ?? 0;
    totalPrice = basePrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 207, 130),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNav()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),

                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/Cough.png",
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(14),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 255, 225, 147),
                border: Border.all(
                  color: Color.fromARGB(255, 114, 76, 152),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            style: AppWidget.whiteLineText(21.0),
                          ),
                          SizedBox(width: 5),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 206, 179),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                        totalPrice = basePrice * quantity;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  quantity.toString(),
                                  style: AppWidget.boldLineText(20.0),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                      totalPrice = basePrice * quantity;
                                    });
                                  },
                                  child: Icon(Icons.add, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text("Description ", style: AppWidget.lightLineText(18.0)),
                  SizedBox(height: 10),

                  Text(widget.description, style: AppWidget.lightLineText(13)),
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 208, 142),
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: AppWidget.lightLineText(22),
                            ),
                            Text(
                              "\$${totalPrice.toStringAsFixed(2)}",
                              style: AppWidget.boldLineText(21),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            Map<String, dynamic> orderData = {
                              "name": widget.name,
                              "quantity": quantity,
                              "price": double.tryParse(widget.price) ?? 0,

                              "totalPrice":
                                  quantity *
                                  (double.tryParse(widget.price) ?? 0),
                              "timestamp": FieldValue.serverTimestamp(),
                            };
                            await DatabaseMethod().addOrder(orderData);
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 300,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    228,
                                    207,
                                    130,
                                  ),
                                  title: Text(
                                    "Order Placed",
                                    style: AppWidget.boldLineText(22),
                                  ),
                                  content: Text(
                                    "Your order has been placed successfully!",
                                    style: AppWidget.lightLineText(18),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: AppWidget.boldLineText(18),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 180,
                            child: Center(
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

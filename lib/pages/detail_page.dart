import 'package:flutter/material.dart';
import 'package:pharmacy/pages/homepage.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                        MaterialPageRoute(builder: (context) => HomePage()),
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
                            "Cough Syrup",
                            style: AppWidget.whiteLineText(22.0),
                          ),
                          SizedBox(width: 40),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 206, 179),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.remove, color: Colors.black),
                                SizedBox(width: 10),

                                Text("1", style: AppWidget.boldLineText(20.0)),
                                SizedBox(width: 10),

                                Icon(Icons.add, color: Colors.black),
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

                  Text(
                    "Cold medicines are a group of medications taken individually or in combination as a treatment for the symptoms of the common cold and similar conditions of the upper respiratory tract. The term encompasses a broad array of drugs, including analgesics, antihistamines and decongestants, among many others. ",
                    style: AppWidget.lightLineText(13),
                  ),
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
                            Text("\$100.00", style: AppWidget.boldLineText(21)),
                          ],
                        ),
                        Container(
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

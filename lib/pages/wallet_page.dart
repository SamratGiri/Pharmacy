import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 207, 130),
      appBar: AppBar(
        title: Text("Wallet Page", style: AppWidget.fredokabold(40)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 120,
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE29F),
                    Color(0xFFFFD47F),
                    Color(0xFFFFC85C),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/walletone.png",
                    height: 80,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 50),
                  Center(
                    child: Column(
                      children: [
                        Text("My wallet", style: AppWidget.boldLineText(25)),
                        SizedBox(height: 8),
                        Text("\$200", style: AppWidget.boldLineText(25)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 134, 156, 221),
                    elevation: 3,
                    shadowColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(18),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("\$100", style: AppWidget.fredokawhitelight(25)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 134, 156, 221),
                    elevation: 3,
                    shadowColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(18),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("\$300", style: AppWidget.fredokawhitelight(25)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 134, 156, 221),
                    elevation: 3,
                    shadowColor: const Color.fromARGB(255, 139, 166, 213),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(18),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("\$500", style: AppWidget.fredokawhitelight(25)),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                backgroundColor: Color(0xFFFFE29F),
                elevation: 5,

                shadowColor: const Color.fromARGB(255, 139, 166, 213),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(18),
                ),
              ),
              onPressed: () {},
              child: Text("Add Money", style: AppWidget.fredokamedium(25)),
            ),
            SizedBox(height: 40),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFE29F),
                      Color(0xFFFFD47F),
                      Color(0xFFFFC85C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text("Your Transcation", style: AppWidget.fredokabold(25)),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      height: 90,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/walletone.png",
                              height: 50,
                              width: 50,
                            ),
                            Text("\$200", style: AppWidget.fredokabold(22)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    18,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "CREDIT",
                                style: AppWidget.fredokamedium(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      height: 90,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/walletone.png",
                              height: 50,
                              width: 50,
                            ),
                            Text("\$200", style: AppWidget.fredokabold(22)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    18,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "DEBIT",
                                style: AppWidget.fredokamedium(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

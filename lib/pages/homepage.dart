import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 97, 211),
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(60),
              child: Image.asset(
                "assets/images/picture.jpg",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text("Your Trusted", style: AppWidget.boldLineText(22.0)),
            Text("Online Pharmacy", style: AppWidget.lightLineText(22.0)),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color.fromARGB(255, 241, 239, 239),
                          width: 2.9,
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 20.0, top: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Message",
                          hintStyle: AppWidget.lightLineText(15.0),

                          suffixIcon: Container(
                            margin: EdgeInsets.all(5),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
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
    );
  }
}

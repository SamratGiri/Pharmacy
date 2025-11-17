import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool allmedicines = true,
      suppliment = false,
      herbal = false,
      vitamins = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 207, 130),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 60),
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
            SizedBox(height: 40),

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
            SizedBox(height: 30),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  allmedicines
                      ? AppWidget.selectedCategory("All medicines")
                      : GestureDetector(
                          onTap: () {
                            allmedicines = true;
                            herbal = false;
                            suppliment = false;
                            vitamins = false;
                            setState(() {});
                          },

                          child: Center(
                            child: Text(
                              "All medicines",
                              style: AppWidget.lightLineText(18.0),
                            ),
                          ),
                        ),
                  SizedBox(width: 30),
                  herbal
                      ? AppWidget.selectedCategory("Herbal")
                      : GestureDetector(
                          onTap: () {
                            allmedicines = false;
                            herbal = true;
                            suppliment = false;
                            vitamins = false;
                            setState(() {});
                          },

                          child: Center(
                            child: Text(
                              "Herbal",
                              style: AppWidget.lightLineText(18.0),
                            ),
                          ),
                        ),
                  SizedBox(width: 30),

                  suppliment
                      ? AppWidget.selectedCategory("Suppliments")
                      : GestureDetector(
                          onTap: () {
                            allmedicines = false;
                            herbal = false;
                            suppliment = true;
                            vitamins = false;
                            setState(() {});
                          },

                          child: Center(
                            child: Text(
                              "Suppliments",

                              style: AppWidget.lightLineText(18.0),
                            ),
                          ),
                        ),
                  SizedBox(width: 30),

                  vitamins
                      ? AppWidget.selectedCategory("Vitamins")
                      : GestureDetector(
                          onTap: () {
                            allmedicines = false;
                            herbal = false;
                            suppliment = false;
                            vitamins = true;
                            setState(() {});
                          },

                          child: Center(
                            child: Text(
                              "Vitamins",

                              style: AppWidget.lightLineText(18.0),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE29F),
                    Color(0xFFFFD47F),
                    Color(0xFFFFC85C),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/another_onoe.png",
                    height: 300,
                    fit: BoxFit.cover,
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

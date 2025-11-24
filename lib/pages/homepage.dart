import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/detail_page.dart';
import 'package:pharmacy/services/database.dart';
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

  Stream? productStream;

  Future getontheload() async {
    productStream = await DatabaseMethod().getallProduct();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allProducts() {
    return StreamBuilder(
      stream: productStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            name: ds["Name"],
                            description: ds["Description"],
                            price: ds["Price"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                          Center(
                            child: Image.asset(
                              "assets/images/another_onoe.png",
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 330,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 225, 147),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.6,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ds["Name"],
                                            style: AppWidget.fredokamedium(20),
                                          ),
                                          Text(
                                            // ignore: prefer_interpolation_to_compose_strings
                                            "\$" + ds["Price"],
                                            style: AppWidget.fredokamedium(20),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        ds["CompanyName"],
                                        style: AppWidget.fredokamedium(20),
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
                },
              )
            : Container();
      },
    );
  }

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
            SizedBox(height: 20),

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
                          hintText: "Search Medicine ",
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
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  allmedicines
                      ? AppWidget.selectedCategory("All medicines")
                      : GestureDetector(
                          onTap: () async {
                            allmedicines = true;
                            herbal = false;
                            suppliment = false;
                            vitamins = false;

                            productStream = await DatabaseMethod()
                                .getallProduct();
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
                          onTap: () async {
                            allmedicines = false;
                            herbal = true;
                            suppliment = false;
                            vitamins = false;
                            productStream = await DatabaseMethod()
                                .getallProducts("Herbal");
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
                          onTap: () async {
                            allmedicines = false;
                            herbal = false;
                            suppliment = true;
                            vitamins = false;
                            productStream = await DatabaseMethod()
                                .getallProducts("Suppliments");
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
                          onTap: () async {
                            allmedicines = false;
                            herbal = false;
                            suppliment = false;
                            vitamins = true;
                            productStream = await DatabaseMethod()
                                .getallProducts("Vitamins");
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
            Expanded(child: allProducts()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pharmacy/services/database.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productname = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController productprice = TextEditingController();
  TextEditingController productdescription = TextEditingController();

  List<String> categories = ["Herbal", "Vitamins", "Medicines", "Suppliment"];
  String? selectedCategory;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(65),
                  bottomRight: Radius.circular(65),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text("Add Product ", style: AppWidget.fredokabold(45)),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.33,
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 6,
                left: 20.0,
                right: 20.0,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 247, 234),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text("Product Name", style: AppWidget.fredokabold(20)),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: const Color.fromARGB(125, 32, 32, 32),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: productname,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Product name",
                          hintStyle: AppWidget.fredokalight(15),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(" Product Category", style: AppWidget.fredokabold(20)),

                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: const Color.fromARGB(126, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        hint: Text("Select Category"),
                        style: AppWidget.fredokalight(15),

                        isExpanded: true,
                        items: categories
                            .map(
                              (cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Text("Product Price", style: AppWidget.fredokabold(20)),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: const Color.fromARGB(126, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: productprice,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Product Price ",
                          hintStyle: AppWidget.fredokalight(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Company Name", style: AppWidget.fredokabold(20)),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: const Color.fromARGB(126, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: companyname,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Company name ",
                          hintStyle: AppWidget.fredokalight(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: AppWidget.fredokabold(20)),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color.fromARGB(126, 0, 0, 0),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: productdescription,
                        maxLines: 5,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: AppWidget.fredokalight(15),
                          hintText: "Write something about the product.. ",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  GestureDetector(
                    onTap: () async {
                      if (productname.text != "" &&
                          productdescription.text != "" &&
                          productprice.text != "" &&
                          companyname.text != "") {
                        Map<String, dynamic> addProduct = {
                          "Name": productname.text,
                          "Price": productprice.text,
                          "Category": selectedCategory,
                          "CompanyName": companyname.text,
                          "Description": productdescription.text,
                        };
                        await DatabaseMethod().addProductInfo(addProduct);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Product Added Sucessfully",
                              style: AppWidget.whiteLineText(19),
                            ),
                          ),
                        );
                        setState(() {
                          productname.clear();
                          productdescription.clear();
                          productprice.clear();
                          companyname.clear();
                          selectedCategory = null;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Complete all the fields",
                              style: AppWidget.whiteLineText(18),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Center(
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                "Add Product",
                                style: AppWidget.fredokabold(20),
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

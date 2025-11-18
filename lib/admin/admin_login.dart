import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
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
                  Text("Hello", style: AppWidget.fredokabold(45)),

                  Text("Welcome Back!", style: AppWidget.fredokalight(35)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 4,
                left: 20.0,
                right: 20.0,
                bottom: MediaQuery.of(context).size.height / 4,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 247, 234),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Admin Account",
                      style: AppWidget.fredokabold(35),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Username", style: AppWidget.fredokabold(25)),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: const Color.fromARGB(126, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Password", style: AppWidget.fredokabold(25)),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: const Color.fromARGB(126, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password ",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.5),

                  SizedBox(height: 40),

                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Center(
                      child: Text(
                        "Login Account ",
                        style: AppWidget.fredokabold(20),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != usernameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Wrong  username ",
                style: AppWidget.whiteLineText(18),
              ),
            ),
          );
        } else if (result.data()['id'] != passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Wrong  password ",
                style: AppWidget.whiteLineText(18),
              ),
            ),
          );
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>))
        }
      });
    });
  }
}

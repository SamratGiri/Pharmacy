import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/support_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                bottom: 70,
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
                      "Login Account",
                      style: AppWidget.fredokabold(35),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email Address", style: AppWidget.fredokabold(25)),
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
                          hintText: "Email address",
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password ",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forget Password ?",
                        style: AppWidget.fredokalight(18),
                      ),
                    ],
                  ),

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

                  Center(
                    child: Text(
                      "Create New Account ?",
                      style: AppWidget.fredokalight(18),
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

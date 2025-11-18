// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/homepage.dart';
import 'package:pharmacy/pages/loginpage.dart';
import 'package:pharmacy/services/database.dart';
import 'package:pharmacy/services/shared_pref.dart';
import 'package:pharmacy/widgets/support_widget.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? name, email, password;
  bool loading = false;

  registration() async {
    setState(() {
      loading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      String id = randomAlphaNumeric(10);
      Map<String, dynamic> userInfoMap = {
        "Name": nameController.text,
        "Email": emailController.text,
        "Id": id,
      };
      await SharedPreferenceHelper().saveUserId(id);
      await SharedPreferenceHelper().saveUserEmail(email!);
      await SharedPreferenceHelper().saveUserName(name!);
      await DatabaseMethod().addUserInfo(userInfoMap, id);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Registration Sucessful",
            style: AppWidget.whiteLineText(18),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Password is too weak",
              style: AppWidget.whiteLineText(18),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Account already exists",
              style: AppWidget.whiteLineText(18),
            ),
          ),
        );
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3,
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
                bottom: 50,
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
                      "Personal Information",
                      style: AppWidget.fredokabold(30),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Full Name ", style: AppWidget.fredokabold(20)),
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
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your name",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email Address", style: AppWidget.fredokabold(20)),
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
                        controller: emailController,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email address",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Password", style: AppWidget.fredokabold(20)),
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
                        controller: passwordController,

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
                      child: GestureDetector(
                        onTap: () {
                          if (nameController.text != "" &&
                              emailController.text != "" &&
                              passwordController.text != "") {
                            setState(() {
                              name = nameController.text;
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            registration();
                          }
                        },
                        child: loading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                "Create Account ",
                                style: AppWidget.fredokabold(20),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.only(left: 15),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: AppWidget.fredokalight(18),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "SignUp?",
                            style: AppWidget.fredokabold(18),
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

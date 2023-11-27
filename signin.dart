import 'package:flutter/material.dart';
import 'package:flutter_project/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    90.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        height: 3,
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Login to your Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 2.0,
                    ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 5.0,
                        ),
                        height: MediaQuery.of(context).size.height / 2.1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black87,
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail_outlined,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black87,
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.password_rounded,
                                    color: Colors.blueAccent,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible =
                                        !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !isPasswordVisible,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 60),
                            Center(
                              child: Container(
                                width: 70,
                                child: Material(
                                  elevation: 9.0,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "SignIn",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to SignUp page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up Now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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

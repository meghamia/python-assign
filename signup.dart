import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/database.dart';
import 'package:flutter_project/home.dart';
import 'package:flutter_project/shared_pref.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "", confirmPassword = "";

  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  registration() async {
    if (password != null && password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String Id = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "E-mail": mailcontroller.text,
          "username": mailcontroller.text.replaceAll("@gmail.com", ""),
          "Photo":
              "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a",
          "Id": Id,
        };
        await DatabaseMethods().addUserDetails(userInfoMap, Id);
        await SharedPreferenceHelper().saveUserId(Id);
        await SharedPreferenceHelper().saveUserDisplayName(namecontroller.text);
        await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
        await SharedPreferenceHelper().saveUserPic(
            'https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&tok');
        await SharedPreferenceHelper()
            .saveUserName(mailcontroller.text.replaceAll("@gmail.com", ""));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      MediaQuery.of(context).size.width, 90.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          height: 3,
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 5.0),
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black87),
                                ),
                                child: TextFormField(
                                  controller: namecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.blueAccent,
                                      )),
                                ),
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black87),
                                ),
                                child: TextField(
                                  controller: mailcontroller,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.mail_outlined,
                                        color: Colors.blueAccent,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black87),
                                ),
                                child: TextFormField(
                                  controller: passwordcontroller,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "Confirm Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black87),
                                ),
                                child: TextFormField(
                                  controller: confirmPasswordcontroller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.password_rounded,
                                      color: Colors.blueAccent,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isConfirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.blueAccent,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isConfirmPasswordVisible =
                                              !isConfirmPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: !isConfirmPasswordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Confirm Password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        email = mailcontroller.text;
                                        name = namecontroller.text;
                                        password = passwordcontroller.text;
                                        confirmPassword =
                                            confirmPasswordcontroller.text;
                                      });
                                    }
                                    await registration();
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    width: 70,
                                    child: Material(
                                      elevation: 9.0,
                                      child: Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
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
                          "Sign In Now",
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

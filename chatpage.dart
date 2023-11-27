import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "shivam gupta",
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2,

                      ),
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Hello, how are you?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 3,
                      ),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "I am doing good, Thank you ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Spacer(),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration:
                                InputDecoration(border: InputBorder.none,
                                hintText: "Type a message"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Icon(Icons.send,)))
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



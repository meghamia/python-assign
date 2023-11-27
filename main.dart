// //import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/login.dart';
//
//
// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //
//   // );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text("click here"),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }



//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_project/chatpage.dart';
// import 'package:flutter_project/signin.dart';
// import 'package:flutter_project/signup.dart';
// import 'package:get/get.dart';
//
//
//
// void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    //await Firebase.initializeApp();
//   await initServices(); // Initialize your services if needed
//   runApp(MyApp());
// }
//
// Future<void> initServices() async {
//   // Initialize your services here if needed
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Login Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:    HomePage(),
//       //home: SignUp(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown,
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               child: Text("click here"),
//               onPressed:
//                   ()=> Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignIn()),
//               ),
//             ),
//             ElevatedButton(
//               child: Text("click here"),
//               onPressed:
//                   ()=> Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignUp()),
//               ),
//             ),
//             ElevatedButton(
//               child: Text("click here"),
//               onPressed:
//                   ()=> Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => ChatPage()),
//               ),
//             ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     Get.to(LoginPage());
//             //   },
//             //   child: Text('Go to Login Page'),
//             // ),
//           ],
//         ),
//
//       ),
//     );
//   }
// }






import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/chatpage.dart';
import 'package:flutter_project/home.dart';
//import 'package:flutter_project/login.dart';
import 'package:flutter_project/signin.dart';
import 'package:flutter_project/signup.dart';
import 'package:get/get.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await initServices(); // Initialize your services if needed
  runApp(MyApp());
}

Future<void> initServices() async {
  // Initialize your services here if needed
}



class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'Flutter Login Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SignUp(),
          );
        }

        return CircularProgressIndicator(); // or any loading widget
      },
    );
  }
}



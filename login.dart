// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'login_controller.dart';
//
//
// class LoginPage extends GetView<LoginController> {
//   final LoginController _loginController = Get.put(LoginController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               controller: controller.emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: controller.passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 32.0),
//             ElevatedButton(
//               onPressed: controller.handleLogin,
//               child: Text('Login'),
//             ),
//             TextButton(
//               onPressed: controller.handleSignup,
//               child: Text('Don\'t have an account? Sign up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

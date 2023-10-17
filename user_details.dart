import 'package:flutter/material.dart';
import 'series7user.dart'; // Import your model class

class UserDetailsPage extends StatelessWidget {
  final Data userData;

  UserDetailsPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(

              width: 100,
              height: 100,
              child: Image.network(userData.avatar),


            ),
            Text('ID: ${userData.id}'),
            Text('Email: ${userData.email}'),
            Text('Name: ${userData.firstName} ${userData.lastName}'),


          ],


        ),
      ),
    );
  }
}

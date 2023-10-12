/*import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/series7user.dart';

Future<GetUserModel> fetchGetUserModel() async {
  final response = await http
      .get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GetUserModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// class GetUserModel {
//   final int userId;
//   final int id;
//   final String title;
//
//   const GetUserModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//
//   factory GetUserModel.fromJson(Map<String, dynamic> json) {
//     return GetUserModel(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }


class SwagerUser extends StatefulWidget {
  const SwagerUser({super.key});

  @override
  State<SwagerUser> createState() => _SwagerUserState();
}

class _SwagerUserState extends State<SwagerUser> {
  late Future<GetUserModel> futureGetUserModel;

  @override
  void initState() {
    super.initState();
    futureGetUserModel = fetchGetUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<GetUserModel>(
            future: futureGetUserModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.page.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}*/



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test1/series7user.dart';

Future<GetUserModel> fetchGetUserModel() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    return GetUserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class SwagerUser extends StatefulWidget {
  const SwagerUser({Key? key}) : super(key: key);

  @override
  State<SwagerUser> createState() => _SwagerUserState();
}

class _SwagerUserState extends State<SwagerUser> {
  late Future<GetUserModel> futureGetUserModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureGetUserModel = fetchGetUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: FutureBuilder<GetUserModel>(
          future: futureGetUserModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final userModel = snapshot.data!;
              return ListView(
                children: [
                  ListTile(
                    title: Text('Page: ${userModel.page}'),
                  ),
                  ListTile(
                    title: Text('PerPage: ${userModel.perPage}'),
                  ),
                  ListTile(
                    title: Text('Total: ${userModel.total}'),
                  ),
                  ListTile(
                    title: Text('Total Pages: ${userModel.totalPages}'),
                  ),
                  // Access and display data and support properties within ListTile
                  if (userModel.data != null)
                    ListTile(
                      title: Text('Data: ${userModel.data}'),
                    ),

                ],
              );
            } else {
              return  Text('No data available');
            }
          },
        ),
      ),
    );
  }
}

















/*
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/series7user.dart';

class SwagerUser extends StatefulWidget {
  const SwagerUser({Key? key}) : super(key: key);

  @override
  _SwagerUserState createState() => _SwagerUserState();
}

class _SwagerUserState extends State<SwagerUser> {
  List<GetUserModel> userList = [];

  Future<List<GetUserModel>> getUserApi() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> users = data['data'];

      for (var i in users) {
        userList.add(GetUserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<GetUserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                } else  {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      //final user = snapshot.data![index];
                      return Card(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                          // Text('id'),
                             // Text(snapshot.data![index].perPage!..toString()),

                           ],
                         ),
                       ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
// class ReusableRow extends StatelessWidget {
//   String url,text;
//    ReusableRow({Key? key, required this.url , required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(url),
//         Text(text),
//
//
//       ],
//     );
//   }
// }
*/






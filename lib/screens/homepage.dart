import 'dart:convert';

import 'package:exactus_task/screens/addemploy.dart';
import 'package:exactus_task/screens/editpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../common/url.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getData() async {
    var response = await get(Uri.parse('${url}userview.php'));
    return jsonDecode(response.body);
    print(response.body);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPage(
                                      id: snapshot.data![index]['id'],
                                      name: snapshot.data![index]['name'],
                                      address: snapshot.data![index]['address'],
                                      email: snapshot.data![index]['email'],
                                      country: snapshot.data![index]['country'],
                                      phonenumber: snapshot.data![index]
                                          ['number'],
                                    )));
                      },
                      child: ListTile(
                        title: Text(snapshot.data![index]['name']),
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEmployee()));
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}

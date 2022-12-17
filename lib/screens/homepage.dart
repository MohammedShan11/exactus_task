import 'dart:convert';

import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/common/textstyles.dart';
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
    print(response.body);
    print(response.statusCode);
    return jsonDecode(response.body);
  }

  Future<void> delData() async {
    var data = {"id": dataindex};
    var response = await post(Uri.parse('${url}delete.php'), body: data);
    print(response.body);
    print(response.statusCode);
    print(dataindex);
  }

  var dataindex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 8, bottom: 8),
                              child: Card(
                                child: Column(children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                        'https://cdn1.iconfinder.com/data/icons/business-office-41/64/x-09-512.png'),
                                  ),
                                  Text(
                                    snapshot.data![index]['name'],
                                    style: empname,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditPage(
                                                        id: snapshot
                                                            .data![index]['id'],
                                                        name: snapshot
                                                                .data![index]
                                                            ['name'],
                                                        address: snapshot
                                                                .data![index]
                                                            ['address'],
                                                        email: snapshot
                                                                .data![index]
                                                            ['email'],
                                                        country: snapshot
                                                                .data![index]
                                                            ['country'],
                                                        phonenumber: snapshot
                                                                .data![index]
                                                            ['number'],
                                                        index: index,
                                                      )));
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration:
                                              BoxDecoration(color: goldcolor),
                                          child: Center(child: Text("Edit")),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          dataindex =
                                              snapshot.data![index]['id'];
                                          setState(() {
                                            delData();
                                          });
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration:
                                              BoxDecoration(color: redcolor),
                                          child: Icon(Icons.delete),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            );
                            // return InkWell(
                            //   onTap: () {

                            //   },
                            //   child: ListTile(
                            //     title: Text(snapshot.data![index]['name']),
                            //   ),
                            // );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          },
          child: Icon(Icons.person_add),
        ),
      ),
    );
  }
}

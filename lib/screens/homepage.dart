import 'dart:convert';

import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/common/sizedbox.dart';
import 'package:exactus_task/common/textstyles.dart';
import 'package:exactus_task/screens/addemploy.dart';
import 'package:exactus_task/screens/auth/loginpage.dart';
import 'package:exactus_task/screens/editpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../connect/url.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getData() async {
    var response = await get(Uri.parse('${url}userview.php'));
    //print(response.body);
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
          backgroundColor: Color.fromARGB(255, 36, 97, 211),
          title: Text(
            "HomePage",
            style: acme,
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: Icon(Icons.logout),
                  tooltip: "Logout",
                ))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: lightlinear,
          ),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                shadowColor: Color.fromARGB(255, 58, 54, 44),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    // gradient: lightlinear,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 120,
                                          child: Image.network(
                                            'https://cdn1.iconfinder.com/data/icons/business-office-41/64/x-09-512.png',
                                            color:
                                                Color.fromARGB(255, 97, 78, 20),
                                          ),
                                        ),
                                        sbw15,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            sbh10,
                                            Text(
                                              snapshot.data![index]['name'],
                                              style: poppins,
                                            ),
                                            sbh5,
                                            Text(
                                              snapshot.data![index]['address'],
                                              style: address,
                                            ),
                                            sbh5,
                                            Row(
                                              children: [
                                                Icon(Icons.mail_outline),
                                                sbw5,
                                                Text(
                                                  snapshot.data![index]
                                                      ['email'],
                                                  style: detail,
                                                ),
                                              ],
                                            ),
                                            sbh5,
                                            SingleChildScrollView(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: redcolor,
                                                  ),
                                                  sbw5,
                                                  Text(
                                                    snapshot.data![index]
                                                        ['country'],
                                                    // style: detail,
                                                  ),
                                                  sbw25,
                                                  Icon(
                                                    Icons.phone,
                                                    color: bluecolor,
                                                  ),
                                                  sbw5,
                                                  Text(
                                                    snapshot.data![index]
                                                        ['number'],
                                                  )
                                                ],
                                              ),
                                            ),
                                            sbh5,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    EditPage(
                                                                      id: snapshot
                                                                              .data![index]
                                                                          [
                                                                          'id'],
                                                                      name: snapshot
                                                                              .data![index]
                                                                          [
                                                                          'name'],
                                                                      address: snapshot
                                                                              .data![index]
                                                                          [
                                                                          'address'],
                                                                      email: snapshot
                                                                              .data![index]
                                                                          [
                                                                          'email'],
                                                                      country: snapshot
                                                                              .data![index]
                                                                          [
                                                                          'country'],
                                                                      phonenumber:
                                                                          snapshot.data![index]
                                                                              [
                                                                              'number'],
                                                                      index:
                                                                          index,
                                                                    )));
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        gradient: cyanlinear),
                                                    child: Center(
                                                        child: Text(
                                                      "Edit",
                                                      style: edit,
                                                    )),
                                                  ),
                                                ),
                                                sbw10,
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      dataindex = snapshot
                                                          .data![index]['id'];
                                                      delData();
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        gradient: cyanlinear),
                                                    child: Icon(
                                                      Icons.delete_outline,
                                                      color: redcolor,
                                                      size: 30,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            sbh15,
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: bluecolor,
                        )),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appbar,
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

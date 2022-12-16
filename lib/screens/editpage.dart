import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  var id;
  var name;
  var address;
  var email;
  var country;
  var phonenumber;
  EditPage(
      {super.key,
      this.id,
      this.name,
      this.address,
      this.country,
      this.email,
      this.phonenumber});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';

class Validate {
  static String? emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return "Email is Invalid";
    } else {
      return null;
    }
  }

  static String? numberValidator(String value) {
    if (value.length < 10 || num.tryParse(value) == null) {
      return 'Phone number should contain atleast 10 digits';
    } else {
      return null;
    }
  }

  static String? nameValidator(String value) {
    if (value.toString() == "") {
      return " Name is Invalid ";
    } else {
      return null;
    }
  }

  static String? addressValidator(String value) {
    if (value.toString() == "") {
      return " Please Input Address ";
    } else {
      return null;
    }
  }

  static String? countryValidator(String value) {
    if (value.toString() == "") {
      return " Please Input Country ";
    } else {
      return null;
    }
  }
}

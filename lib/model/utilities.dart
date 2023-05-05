import 'dart:convert';

import 'package:thflutter/model/products.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/strings.dart';

class Utilities {
  String url = "http://10.0.2.2:3000/api/foods";
  static Utilities? _instance;
  List<Products> data = [];

  factory Utilities() {
    _instance ??= Utilities._internal();
    return _instance!;
  }

  Utilities._internal();

  Utilities._();

  Future<List<Products>> getProducts() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var content = res.body;
      var arr = json.decode(content)['food'] as List;

      return arr.map((e) => _fromJson(e)).toList();
    }
    return [];
  }

  void addProduct(Products product) {
    data.add(product);
  }

  Products _fromJson(Map<String, dynamic> item) {
    return Products(
        id: item['_id'],
        title: item['title'],
        description: item['description'],
        image: item['image'],
        price: double.parse(item['price']));
  }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    // Pattern pattern = (r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    }
    return 'Email suitable';
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password should be more than 8 characters';
    }
    return 'Password suitable';
  }

  static String confirmPassword(String value1, String value2) {
    if (!equalsIgnoreCase(value1, value2)) {
      return 'Confirm password invalid';
    }
    return 'Confirm success';
  }
}

import 'dart:convert';
import 'package:thflutter/model/products.dart';
import 'package:convert/convert.dart';
import 'package:quiver/strings.dart';
import 'package:http/http.dart' as http;

class Utilities{
  String url = 'http://192.168.0.100:3000/api/food';

  static List<Products> data = [];

  Future<List<Products>> getProducts() async{
    var res = await http.get(url as Uri);
    if(res.statusCode ==200){
      var content = res.body;
      print(content.toString());
      var arr = json.decode(content)['food'] as List;

      return arr.map((e) => _fromJson(e)).toList();
    }
    return <Products>[];
  }

  Products _fromJson(Map<String, dynamic> item){
    return Products(
      description: item['description'],
      title: item['title'],
      image: item['image'],
      price: double.parse(item['price']), id: item['id']
    );
  }

  static String validateEmail(String value){
    if(value.isEmpty){
      return 'Please enter mail';
    }
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern.toString());
    if(!regExp.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return "";
    }
  }

  static String validatePassword(String value){
    if(value.isEmpty){
      return 'Please enter password';
    }
    if(value.length<8){
      return 'Password should be more than 8 characters';
    }
    return "";
  }

  static String conformPassword(String value, String value2){
    if(!equalsIgnoreCase(value, value2)) {
      return "Conform password invalid";
    } else {
      return "";
    }
  }

}
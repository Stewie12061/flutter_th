import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'components/body.dart';

class CartPage extends StatelessWidget{
  static String routeName = "/carts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Cart Detail"),
      ),
      body: Body(),
    );
  }

}
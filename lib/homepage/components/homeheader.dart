import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/cart/cartpage.dart';

class HomeHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        const Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)
              ),
            ),
        ),
        GestureDetector(
          onTap: (){
            // Navigator.pushNamed(context, CartPage.routeName);
          },
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.shopping_cart_outlined)
          ),
        )
      ],
    );
  }
}
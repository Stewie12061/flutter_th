import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/cart/components/checkoutcart.dart';
import 'package:thflutter/model/carts.dart';
import 'package:thflutter/model/prodcts.dart';

class Body extends StatefulWidget{
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>{

  List<Products> catedetails = Cart().getCart();
  double sum =0.0;

  @override
  void initState(){
    super.initState();
    catedetails.forEach((product) { sum = sum + product.price; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: catedetails.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    GestureDetector(
                      child: CartItem(product: catedetails[index]),
                    ),
                  ],
                )
              },
            ),
          )
        ],
      ),
    )
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/carts.dart';
import '../../model/products.dart';
import 'checkoutcart.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Products> cartdetails = Cart().getCart();
  double sum = 0.0;
  @override
  void initState() {
    super.initState();
    cartdetails.forEach((product) {
      sum += product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: cartdetails.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    child: CartItem(product: cartdetails[index]),
                    onTap: () {
                      setState(() {
                        cartdetails.removeAt(index);
                        sum = 0.0;
                        cartdetails.forEach((product) {
                          sum += product.price;
                        });
                      });
                    },
                  ),
                  Divider()
                ],
              );
            }),
        CheckOutCart(
          sum: sum,
        )
      ]),
    );
  }
}

class CartItem extends StatelessWidget {
  Products product;

  CartItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.network(product.image),
        ),
        Expanded(child: Text(product.title)),
        Expanded(child: Text(product.price.toString())),
        Icon(Icons.delete_outlined)
      ]),
    );
  }
}

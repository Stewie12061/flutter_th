import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/products.dart';
import 'addtocart.dart';

class Body extends StatelessWidget {
  Products product;
  Body({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
     
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /2,
              child: Image.network(product.image),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text("Description: ${product.description}"),
              flex: 1,
            ),
            AddProductToCart(
              product: product,
            ),
          ],
        ),
      
    );
  }
}

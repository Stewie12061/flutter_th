import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import '../../../detail/productpage.dart';
import '../../../model/products.dart';
import '../../../model/utilities.dart';

class ProductPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                'See more',
                style: TextStyle(fontSize: 16, color: Colors.lightGreen),
              ),
            ],
          ),
          SizedBox(height: 10),
          FutureBuilder<List<Products>>(
            future: Utilities().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return ProductItem(product: snapshot.data![index]);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Products product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    String imageUrl = product.image ?? '';

    // check if the imageUrl is a URL or not
    if (!RegExp('^(http|https)://.*').hasMatch(imageUrl)) {
      // extract the URL from the string
      imageUrl = RegExp(
          r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
          .stringMatch(imageUrl) ?? '';
    }
    return GestureDetector(
      onTap: () {
        Utilities utilities = Utilities();
        utilities.addProduct(product);
        Navigator.pushNamed(context, ProductPage.routeName,
            arguments: ProductDetailsArguments(product: product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.image != null)
            Image.network(
              imageUrl,
              height: 100,
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

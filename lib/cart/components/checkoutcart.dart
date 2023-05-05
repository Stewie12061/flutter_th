import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CheckOutCart extends StatelessWidget {
  double sum;
  CheckOutCart({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.green),
          ),
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Text(
          'Sum: ${sum}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.green,
          ),
        ),
      )),
       Expanded(
          child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.green),
          ),
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Text(
          'Check out'.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.green,
          ),
        ),
      ))
    ]);
  }
}

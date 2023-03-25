import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CheckOutCart extends StatelessWidget{
  double sum;
  CheckOutCart({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget> [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: const BorderSide(color: Colors.green)
              ),
              backgroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.green),
            ),
            onPressed: (){

            },
            child: Text(
              "Sum:${sum}",
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(color: Colors.green)
              ),
              backgroundColor: Colors.white,
              textStyle: const TextStyle(color: Colors.green),
            ),
            onPressed: (){

            },
            child: Text(
              "Check out".toUpperCase(),
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        )
      ],
    );
  }}
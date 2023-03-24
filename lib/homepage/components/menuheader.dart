import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.green
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(child: Text(
              "Account info",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
              color: Colors.white),
            )),
            GestureDetector(
              onTap: (){

              },
              child: const Text("Save",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            )
          ],
        ),
      ),

    );
  }

}
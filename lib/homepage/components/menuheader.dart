import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: Colors.green),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text('Account info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),)),
            GestureDetector(
              onTap: (){

              },
              child: Text('Save', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}


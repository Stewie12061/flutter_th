import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.yellow),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Expanded(child: Text('Account info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),)),
            GestureDetector(
              onTap: (){

              },
              child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
            )
          ],
        ),
      ),
    );
  }
}


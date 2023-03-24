import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AccountDetail extends StatefulWidget{
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail>{
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            emailTextFormField(),
            SizedBox(height: 30,),
            passwordTextFormField(),
            SizedBox(height: 30,),
            conformTextFormField(),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, email.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                child: const Text('Continute',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white
                ),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField(){
    return TextFormField(
      controller: email,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined)
      ),
    );
  }
  TextFormField conformTextFormField(){
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }
  TextFormField passwordTextFormField(){
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }


}
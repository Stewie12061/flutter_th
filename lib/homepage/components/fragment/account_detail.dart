import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            emailTextFormField(),
            const SizedBox(height: 30,),
            passwordTextFormField(),
            const SizedBox(height: 30,),
            conformTextFormField(),
            const SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,email.text);
                },
                style:ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
                child:const Text("Log out",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),

            const SizedBox(height: 30,),
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

  TextFormField passwordTextFormField(){
    return  TextFormField(
      decoration: const InputDecoration(
          border:  OutlineInputBorder(),
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }
  TextFormField conformTextFormField(){
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/model/user.dart';
import 'package:thflutter/model/utilities.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiver/strings.dart';

class SignUpForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>{

  var email = TextEditingController();
  final password = TextEditingController();
  final conform = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
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
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.pop(context, User(username: email.text, password: conform.text));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              child: const Text("Continute", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset("assets/icons/google-icon.svg"),
                ),
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset("assets/icons/twitter.svg"),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  TextFormField emailTextFormField(){
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined)
      ),
      validator: (CurrentValue){
        Utilities.validateEmail(CurrentValue.toString());
      },
      onSaved: (value){
        setState(() {
          email.text = value!;
        });
      },
    );
  }

  TextFormField passwordTextFormField(){
    return TextFormField(
      key: _passKey,
      controller: password,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
      validator: (passwordKey){
        return Utilities.validatePassword(passwordKey!);
      }
    );
  }

  TextFormField conformTextFormField(){
    return TextFormField(
      controller: conform,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
      validator: (conformPassword){
        var pass = _passKey.currentState?.value;
        return Utilities.conformPassword(conformPassword!, pass);
      },
      onSaved: (value){
        setState(() {
          conform.text = value!;
        });
      },
    );
  }
}
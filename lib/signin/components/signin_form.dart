import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thflutter/signup/signuppage.dart';

import '../../homepage/homepage.dart';
import '../../model/user.dart';
import '../../model/utilities.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.getString('username').isEmpty) {
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Food Now',
                    style: TextStyle(
                        fontSize: 32, color: Colors.yellow,
                        fontWeight: FontWeight.bold)
                  ),Text(
                    'Sign in with your email and password \nor continue with social media',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,)
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value){
                        return Utilities.validateEmail(value!);
                      },
                      onSaved: (_value){
                        setState(() {
                          username.text = _value!;
                        });
                      },
                      controller: username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.mail_outline)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    TextFormField(
                      validator: (value){
                        return Utilities.validatePassword(value!);
                      },
                      controller: password,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline_rounded)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //       value: _value ?? true,
                    //       onChanged: (value) {
                    //         print(_value.toString());
                    //         setState((){
                    //           _value = value!;
                    //         });
                    //       },
                    //     ),
                    //     const Text(
                    //       "Remember me",
                    //       style: TextStyle(color: Colors.green, fontSize: 16),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_value){
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', username.text);
                            prefs.setString('password', password.text);
                            prefs.setBool('check',_value);
                          } else {
                            prefs.remove('check');
                          }
                          Navigator.pushNamed(context, HomePage.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.yellow,
                        ),
                        child: const Text('Continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final result = await Navigator.pushNamed(context, SignUpPage.routeName);
                            User user = result as User;
                            username.text = user.username;
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Colors.redAccent, fontSize: 14),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

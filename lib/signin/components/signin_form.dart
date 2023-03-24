import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thflutter/homepage/homepage.dart';
import 'package:thflutter/model/user.dart';
import 'package:thflutter/model/utilities.dart';
import 'package:thflutter/signup/signup_page.dart';

// import '../../signup/signupscreen.dart/';

class SignInForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>{
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();

  late FToast fToast;
  @override
  void initState(){
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getData();
  }
  _getData() async{
    prefs = await SharedPreferences.getInstance();
    if(!prefs.getString('username').isEmpty){
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');
    }
  }

  @override
  Widget build(BuildContext context){
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Food Now", style: TextStyle(fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold),),
                  Text(
                    "Sign in with your email and password \nor continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value){
                        return Utilities.validatePassword(value!);
                      },
                      onSaved: (_value){
                        setState(() {
                          username.text = _value!;
                        });
                      },
                      controller: username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Username",
                        prefixIcon: Icon(Icons.local_mall_outlined)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: ()async{
                          if(_value){
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', username.text);
                            prefs.setString('password', password.text);
                            prefs.setBool('check',_value);
                          }
                          else{
                            prefs.remove('check');
                          }
                          Navigator.pushNamed(context, HomePage.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Continute", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),

                      ),
                    ),
                    const SizedBox(height: 5,),
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
                            child: SvgPicture.asset("assets/icons/google-icon.svg"),
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
                            child: SvgPicture.asset("assets/icons/google-icon.svg"),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(color: Colors.green, fontSize: 14),),
                        GestureDetector(
                          onTap: ()async{
                            final result = await Navigator.pushNamed(context, SignUpPage.routeName);
                            User? user = result as User?;
                            username.text = user!.username;
                          },
                          child: const Text("Sign up",style: TextStyle(color: Colors.redAccent,fontSize: 14),)
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
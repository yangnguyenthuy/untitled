import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/api_connection/api_connection.dart';
import 'package:untitled/signup/signuppage.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/model/Utilities.dart';
import 'package:untitled/homepage/homepage.dart';
import 'package:untitled/model/routes.dart';
import 'package:http/http.dart' as http;

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();

  //FToast fToast;
  @override
  void initState() {
  // TODO: implement initState
  super.initState();
  var fToast = FToast();
  fToast.init(context);
  _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if(!prefs.getString('username').isEmpty){
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');   
    }
  }

  Future<void> signIn() async {
    //var url = "http://172.20.78.178:81/food_app_api/user/signin.php";
    try
    {
      var res = await http.post(
        Uri.parse(API.signIn),
        body: {
          "username": username.text,
          "password": password.text,
        },
      );

      if(res.statusCode == 200)
      {
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp == "Success")
        {
          Fluttertoast.showToast(msg: "SignIn Success");
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
        }
        else
        {
          Fluttertoast.showToast(msg: "SignIn Failed");
        }
      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery. of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Food Now", style: TextStyle(fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold),),
                  Text(
                    "Sign in with your email and password \nor continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
            )),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value) {
                        return Utilities.validatePassword(value.toString());
                      },
                      onSaved: (_value) {
                        setState(() {
                          username.text = _value.toString();
                        });
                      },
                      controller: username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Username",
                        prefixIcon: Icon(Icons.mail_outline),
                      ),),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: password,
                        validator: (value){
                          return Utilities.validatePassword(value.toString());
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline_rounded)
                      ),),
                      SizedBox(height: 5,),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () {
                            signIn();
                          },

                          shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(10)),
                          color: Colors.green,
                          child: Text("Continue", style: TextStyle(fontSize: 18, fontWeight: FontWeight. bold, color: Colors. white),),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle,
                              ),
                              //child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle,
                              ),
                              //child: SvgPicture.asset("assets/icons/google-icon.svg"),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle
                              ),
                              //child: SvgPicture.asset("assets/icons/twitter.svg"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have a account", style: TextStyle(color: Colors.green, fontSize: 14),),
                          GestureDetector(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpPage()));
                            },
                            child: Text("SignUp", style: TextStyle(color: Colors.redAccent, fontSize: 14),),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }



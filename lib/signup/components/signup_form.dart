import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/model/Utilities.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiver/strings.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/api_connection/api_connection.dart';

class SignUpForm extends StatefulWidget {

@override
_SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  var email = TextEditingController();
  final password = TextEditingController();
  final conform = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                child: RaisedButton(
                  onPressed: () => { registerAndSaveUser(),
                    /*if (_formKey.currentState!.validate()) {
                      Navigator.pop(context,
                          User(username: email.text, password: conform.text));
                    }*/
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  color: Colors.green,
                  child: Text("Continue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.white),),
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
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        shape: BoxShape.circle
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
                        shape: BoxShape.circle
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
TextFormField emailTextFormField() {
  return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
      //validator: Utilities.validateEmail(),
      onSaved:(value){
        setState(() {
            email.text = value.toString();
        });
      },
  );
}

TextFormField passwordTextFormField() {
  return TextFormField(
      key: _passKey,
      controller: password,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
      border: OutlineInputBorder(),
        hintText:"Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline)
      ),
      validator: (passwordKey){
        return Utilities.validatePassword(passwordKey.toString());
      }
  );
}

TextFormField conformTextFormField() {
  return TextFormField(
    controller: conform,
    obscureText: true,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline)
    ),
    validator: (conformPassword) {
      var pass = _passKey.currentState?.value;
      return Utilities.conformPassword(conformPassword!, pass);
    },
    onSaved: (value){
      setState((){
        conform.text = value.toString();
      });

    },

  );
}
  registerAndSaveUser() async {
    User userModel = User(username: email.text, password: password.text);
    try
    {
      Fluttertoast.showToast(msg: userModel.password);
      var res = await http.post(
          Uri.parse(API.signUp),
          body: userModel.toJson(),
      );

      if(res.statusCode == 200)
      {
        Fluttertoast.showToast(msg: "SignUp ");
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['success'] == true)
        {
          Fluttertoast.showToast(msg: "SignUp Success");
        }
        else
        {
          Fluttertoast.showToast(msg: "SignUp Failed");
        }
      }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}
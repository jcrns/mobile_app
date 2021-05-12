import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1010_flutter/models/user.dart';
import 'package:project1010_flutter/fintness_app_theme.dart';
import 'package:project1010_flutter/ui_view/card_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {

  
  @override
 _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;



  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  List<Politicians> politicianList;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async{
                  print(usernameController.text);
                  print(passwordController.text);

                  // Creating user obj
                  user = User();

                  // Assinging text field values to object
                  user.username = usernameController.text;
                  user.password = passwordController.text;

                  // Running api login function
                  var newToken = await user.loginUser();

                  // changing gloabl token
                  globalToken = newToken;

                  // Returning to Home Screen with success message
                  Navigator.pop(context, "success");
                  print("done");
                  print(globalToken);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
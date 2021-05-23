import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1010_flutter/models/user.dart';
import 'package:project1010_flutter/fintness_app_theme.dart';
import 'package:project1010_flutter/ui_view/card_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AddBusinessScreen extends StatefulWidget {

  
  @override
 _AddBusinessScreenState createState() => _AddBusinessScreenState();
}

class _AddBusinessScreenState extends State<AddBusinessScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;



  TextEditingController businessNameController = new TextEditingController();
  TextEditingController businessDescriptionController = new TextEditingController();
  TextEditingController businessAddressController = new TextEditingController();
  TextEditingController businessCityController = new TextEditingController();
  TextEditingController businessStateController = new TextEditingController();
  TextEditingController businessWebsiteController = new TextEditingController();
  TextEditingController businessPhoneController = new TextEditingController();
  TextEditingController typeOfBusinessController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Business"),
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
                controller: businessNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Name',
                    hintText: 'Enter username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: businessDescriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Description',
                    hintText: 'Enter Business Description'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: businessAddressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Addresss',
                    hintText: 'Enter Business Addresss'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: businessCityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business City',
                    hintText: 'Enter Business City'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: businessStateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business State',
                    hintText: 'Enter Business State'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: businessWebsiteController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Website',
                    hintText: 'Enter Business'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: businessPhoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Phone',
                    hintText: 'Enter Phone'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: typeOfBusinessController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type Of Business',
                    hintText: 'Enter Type Of Business'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async{
                  // print(usernameController.text);
                  // print(passwordController.text);

                  // // Creating user obj
                  // user = User();

                  // // Assinging text field values to object
                  // user.username = usernameController.text;
                  // user.password = passwordController.text;

                  // // Running api login function
                  // var newToken = await user.loginUser();

                  // // changing gloabl token
                  // globalToken = newToken;

                  // // Returning to Home Screen with success message
                  // Navigator.pop(context, "success");
                  // print("done");
                  // print(globalToken);
                },
                child: Text(
                  'Submit',
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
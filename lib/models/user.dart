import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Creating api hostname as global variable
String hostname = 'http://127.0.0.1:8000';

// ID Token
String globalToken = "";

// Storing user class
var user = User();

// Adding read write to session and save capabilities
class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString(key));
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}


// Getting general data
Future<User> getDataApi() async {
  String postBody = '{ "token" : "$globalToken" }';
  var jsonBody = jsonDecode(postBody);
  print("starting");
  final response = await http.post(
    Uri.encodeFull(hostname + "/get_basic_info/"),
    headers: {
      "Accept": "application/json",
      "Start": "application/json",
      "Authorization" : "Token " + globalToken.toString(),
    },
    body: jsonBody
  );

  if (response.statusCode == 200) {
    
    print("response.body");
    print(response.body);
    // Map<String, dynamic> map = json.decode(response.body);
    // String jsonReturned = jsonEncode(response.body); // jsonEncode != .toString()
    // print(jsonReturned); // out

    // Saving session
    // SharedPref sharedPref = SharedPref();
    // await sharedPref.save("general_data", map);
    // print("map");
    // print(map);
    return User.fromJson(jsonDecode(response.body));
  }
}

class User {
  String email;
  String username;
  String password;
  String token;
  String result;

  User();

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        username = json['username'],
        password = json['password'],
        token = json['token'],
        result = json['result'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
        'token': token,
        'result': result,
      };


   // User Registration
  Future<String> registerUser() async {
    var postBody = { "username" : username, "email" : email, "password" : password };
    var response = await http.post(
      Uri.encodeFull(hostname + "/register/"),
      headers: {
        "Accept": "application/json",
      },
      body: postBody
    );
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    print("map");
    print(map);
    var newToken = map["token"];

    
    print("token login");
    print(newToken);
    if(newToken == '' ||  newToken == null){
      result = 'failed';
      token = '';

    } else {

      // Saving user login data
      token = newToken;

    }
    print(token);
    return token; 
  }

  Future<String> loginUser() async {
    print("beginning login");
    var postBody = { "username" : username, "password" : password };
    var response = await http.post(
      Uri.encodeFull(hostname + "/login/"),
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      },
      body: postBody
    );
    print(response.body);
    print(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    print("map");
    print(map);
    var newToken = map["token"];
    map["username"] = username;
    print("token login");
    print(newToken);
    var result = 'success';
    if(newToken == '' ||  newToken == null){
      result = 'failed';
    } else {

      // Saving user login data
      globalToken = newToken;
      token = newToken;
      
      var _newUser = User();
      _newUser.username = username; 
      
      user = _newUser;
      result = token;
    }
    globalToken = token;
    print("token goedgwstgnwrjitghojirhtn");
    print(token);
    return result;
  }
}
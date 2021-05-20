import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

// Getting general data
Future<Organization> getNearbyMeApi() async {
  String postBody = '{ "token" : "$globalToken" }';
  var jsonBody = jsonDecode(postBody);
  print("starting");
  final response = await http.post(
    Uri.encodeFull(hostname + "/get_organization_data/"),
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
    return Organization.fromJson(jsonDecode(response.body));
  }
}

class Organization {
  String name;
  String description;
  String address;
  String city;
  String state;
  String website;
  int phoneNumber;
  String typeOfBusiness;
  bool workerCooperative;
  bool socialEnterprise;
  String image;

  Organization(
      {this.name,
      this.description,
      this.address,
      this.city,
      this.state,
      this.website,
      this.phoneNumber,
      this.typeOfBusiness,
      this.workerCooperative,
      this.socialEnterprise,
      this.image});

  Organization.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    website = json['website'];
    phoneNumber = json['phone_number'];
    typeOfBusiness = json['type_of_business'];
    workerCooperative = json['worker_cooperative'];
    socialEnterprise = json['social_enterprise'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['website'] = this.website;
    data['phone_number'] = this.phoneNumber;
    data['type_of_business'] = this.typeOfBusiness;
    data['worker_cooperative'] = this.workerCooperative;
    data['social_enterprise'] = this.socialEnterprise;
    data['image'] = this.image;
    return data;
  }


  Future<String> addBusiness() async {
    var postBody = {
      "name" : name,
      "description" : description, 
      "address" : address, 
      "city" : city, 
      "state" : state, 
      "website" : website, 
      "phone_number" : phoneNumber, 
      "type_of_business" : typeOfBusiness, 
      "worker_cooperative" : workerCooperative, 
      "social_enterprise" : socialEnterprise, 
      "image" : image, 
    };
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
    var returnedName = map["name"];
    var result;
    
    
    // print("token login");
    // print(newToken);
    if(returnedName == '' ||  returnedName == null){
      result = 'failed';

    } else {

      // Success
      print("success");
      
    }
    return result; 
  }
}
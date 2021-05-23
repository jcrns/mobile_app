import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

// Start and number
int requestStart = 1;
int numberStart = 7;

// Getting general data
Future<Organizations> getOrganizationsApi() async {
  print("starting");
  final response = await http.get(
    Uri.encodeFull(hostname + "/get_organization_data/"),
    headers: {
      "Accept": "application/json",
      "Authorization" : "Token " + globalToken.toString(),
      "Start" : requestStart.toString(),
      "Number" : numberStart.toString(),
    },
  );

  if (response.statusCode == 200) {
    
    print("response.body");
    print(response.body);
    // List<Organization> returned = List<Organization>.from(json.decode(response.body).map((model)=> Organization.fromJson(model)));

    return Organizations.fromJson(jsonDecode(response.body));
  }
}

class Organizations {
  List<Organization> organizations;

  Organizations({this.organizations});

  Organizations.fromJson(Map<String, dynamic> json) {
    if (json['organizations'] != null) {
      organizations = new List<Organization>();
      json['organizations'].forEach((v) {
        organizations.add(new Organization.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.organizations != null) {
      data['organizations'] = this.organizations.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Future<String> getPoliticianData() async {
  //   print('Getting user data\n\n\n');
  //   print(globalToken);
  //   print('Getting user data');
  //   try {
  //     var response = await http.get(
  //       Uri.encodeFull(hostname + "/get_politician_data/"),
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization" : "Token " + globalToken.toString(),
  //         "Start" : requestStart.toString(),
  //         "Number" : numberStart.toString(),
  //       },
  //     );
  //     print(response.body);
  //     Map<String, dynamic> map = json.decode(response.body);
  //     var encodedJson = json.encode(response.body);
  //     var requestResults = map["details"];
  //     print("encodedJson");
  //     var jsonString = response.body.toString();
  //     print("jsonString");
  //     print(jsonString);
  //     print("jsonString");
  //     // if(requestResults == '' || requestResults == null){
  //     SharedPref sharedPref = SharedPref();
  //     await sharedPref.save("politicians", jsonString);
      
  //     // }
  //     return jsonString;
  //   } catch(_) {
  //     print("never");
  //     return 'failed';
  //   }
  // }

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
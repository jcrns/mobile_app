import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1010_flutter/models/user.dart';
import 'package:project1010_flutter/models/organizations.dart';
import 'package:project1010_flutter/fintness_app_theme.dart';
import 'package:project1010_flutter/ui_view/card_view.dart';
import 'package:flutter/material.dart';
import 'pages/filter/filters_screen.dart';
import 'pages/filter/hotel_app_theme.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/addbusiness.dart';
import 'dart:convert';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var categories = [
  "marketing",
  "restraunts",
  "argriculture",
  "technology",
  "clothing",
  "design",
  "accessories",
  "media",
  "medical",
  "cosmetics",
  "travel",
  // "other",
];

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  // AnimationController animationController;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  // Politician count
  int politicianCount = 0;

  // If loadedState is true update function won't load on page 
  bool loadedState = false;

  // Defining list views
  List<Widget> nearbyMeListView = <Widget>[];

  // Nearby Me Organization Count
  int nearbyMeOrganizationCount = 0;

  // Getting future user data
  Future<User> futureData = getDataApi();

  // Getting list of businesses
  Future<Organizations> futureOrganizations;

  @override
  void initState() {
    // if(loadedState == false) {
    // _update();
    //   loadedState = true;
    // }
    
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }

      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){

        // Changing number var to ask for more results
        // numberStart += numberStart;

        // Running update function
        // getHotelViewList();
        // print(politician.politicians.length);
        // print(politician.politicians.length);
      }
    });
    super.initState();
    user = User();
    futureData = getDataApi();
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }


  void addAllListData() {
    const int count = 9;
    // listViews.add(
    //   // getSearchBarUI(),
    // );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    if(loadedState == false) {
      addAllListData();
      loadedState = true;
      // getHotelViewList();
      print("Adding Lists");
    }
    return true;
  }
  Future<bool> updateDataNearbyMe() async{
    Organizations futureOrganizations = await getOrganizationsApi();
    addNearbyMeListData(futureOrganizations);
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Worker Cooperatives", 
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search");
              },
            ),
          ],

        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30)
              ),
              ListTile(
                title: Text('Add My Business'),
                onTap: () async{
                  // Update the state of the app.
                  // ...
                  String results = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddBusinessScreen())
                  );
                },
              ),
              FutureBuilder<User>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.result == 'success') {
                      print("snapshot.damn");
                      print(snapshot.data.username);
                      return ListTile(
                        title: Text('Log Out'),
                        onTap: () {
                          Navigator.pop(context, true);
                          print(globalToken);
                          globalToken = "";
                          print("globalToken");
                          print(globalToken);
                          setState(() {
                            futureData = getDataApi();
                          });
                        },
                      );
                    } else {
                      print("damn");
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('Sign Up'),
                            onTap: () async{
                              
                              Navigator.pop(context);

                              // Assinging result to signup screen navigation
                              String results = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUpScreen())
                              );

                              // Checking if result is success
                              if (results == 'success'){

                                // Reloading App
                                setState(() {
                                  futureData = getDataApi();
                                });
                              }
                            },
                          ),
                          ListTile(
                            title: Text('Login'),
                            onTap: () async{
                              Navigator.pop(context);

                              // Assinging result to login screen navigation
                              String results = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginScreen())
                              );

                              // Checking if result is success
                              if (results == 'success'){

                                // Reloading App
                                setState(() {
                                  futureData = getDataApi();
                                });
                              }
                            },
                          ),
                        ],
                      );
                    }
                  } else {
                    return Container();
                  }
                  // By default, show a loading spinner.
                  // return CircularProgressIndicator();
                },
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            scrollControlUI(),
          ],
        ),
      ),
    );
  }
Widget yourFavoritesSectionUI(){
  return FutureBuilder<User>(
    future: futureData,
    builder: (context, snapshot) {
      print("snapshot.hasData");
      print(snapshot.hasData);
      if (snapshot.connectionState != ConnectionState.done) {
          return Container();
      } else if (snapshot.hasData) {
        if (snapshot.data?.result == 'success') {
          print("snapshot.data");
          print(snapshot.data.username);
          return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 0, top: 8, bottom: 8),
              child: Text(
                'Your Favorites',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                        child: Center(child: Text('Dummy Card Text $index')),
                      ),
                ),
              ),
            ),
          ],
        );
        } else {
          return Container();
        }
      } else if (snapshot.hasError) {
        return Container();
      }
      // By default, show a loading spinner.
      return Container();

    },
  );

}

Widget welcomeSectionUI(){
  print("welcome");
  // user = User();
  // var data =  user.getData();
  // // var dataDecoded = jsonDecode(data);
  // print(data);
  // print("done");
  // print(data[]);


  // user.getData().then((value) {
  //   print(value);
  //   var dataDecoded = jsonDecode(value);
  // });

  return FutureBuilder<User>(
    future: futureData,
    builder: (context, snapshot) {
      print("snapshot.hasData");
      print(snapshot.hasData);
      if (snapshot.connectionState != ConnectionState.done) {
          return Container();
      } else if (snapshot.hasData) {
        if (snapshot.data?.result == 'success') {
          print("snapshot.data");
          print(snapshot.data.username);
          return Row(
            children: [
              Text("Welcome, ${snapshot.data.username}")
            ],
          );
        } else {
          return Container();
        }
      } else if (snapshot.hasError) {
        return Container();
      }
      // By default, show a loading spinner.
      return Container();

    },
  );
}

// Home Page Scroll Widget
Widget scrollControlUI(){
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        welcomeSectionUI(),
        yourFavoritesSectionUI(),
        nearbyBusinessesSectionUI(),
        categoriesSectionUI(),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 0, top: 25, bottom: 0),
          child: Text( 
            'Blogs',
            style: TextStyle(
              fontSize: 24,
            ),
              textAlign: TextAlign.left,
          ),
        ),


        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
        Card(
          child: ListTile(title: Text('Motivation $int'), subtitle: Text('this is a description of the motivation')),
        ),
      ],
    ),
  );
}

  // Categories Section
  Widget nearbyBusinessesSectionUI(){
    return FutureBuilder<bool>(
      future: updateDataNearbyMe(),
      builder: (context, snapshot) {
        print("snapshot.hasData");
        print(snapshot.hasData);
        if (snapshot.connectionState != ConnectionState.done) {
            return Container();
        } else if (snapshot.hasData) {
          print("Loading Nearby Screen");
          // print(snapshot.data[1].address);
          // for (int g = 0; g < snapshot.data.length; g++) {
            
          // }
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 0, top: 8, bottom: 8),
                child: Text(
                  'Nearby You',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listViews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listViews[index];
                    }
                  ),
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Container();
        }
        // By default, show a loading spinner.
        return Container();

      },
    );
  }

  addNearbyMeListData(Organizations organizations){
    // print(organizations.organizations.length);
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nnearbyMeOrganizationCount");
    print(nearbyMeOrganizationCount);
    for (int g = 0; g < organizations.organizations.length; g++) {
      int i = g + nearbyMeOrganizationCount;
        listViews.add(
          OrganizationListView(
            callback: () {},
            organizationData: organizations.organizations[i],
          ),
        ); 
    }
    nearbyMeOrganizationCount += numberStart;
  }

  Widget categoriesSectionUI(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) => Card(
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/category_images/${categories[index]}.jpeg'),
                      )
                      
                      // Text(
                      //   'Dummy Card Text $index'
                      // )
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget blackOwnedBusinessesSectionUI(){

  }

    Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  // color: HotelAppTheme.buildLightTheme().backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (String txt) {},
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    // cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Kamala Harris',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // color: HotelAppTheme.buildLightTheme().primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(FontAwesomeIcons.search,
                      size: 20,
                      color: HotelAppTheme.buildLightTheme().backgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FintnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FintnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 0),
                        child: Row(
                          children: <Widget>[
                            // Expanded(
                            //   child: FlatButton(
                            //     child: Text('Open Drawer'),
                            //     onPressed: (){
                            //       print("opened");
                            //       Scaffold.of(context).openDrawer();
                            //     },
                            //   ),
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Worker Cooperatives',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FintnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '530 politicians found',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.grey.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) => FiltersScreen(),
                                          fullscreenDialog: true),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Filter',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.sort,
                                              color: Colors.blue
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

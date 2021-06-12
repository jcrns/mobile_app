import 'package:project1010_flutter/pages/filter/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:project1010_flutter/models/user.dart';
import 'package:project1010_flutter/models/organizations.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrganizationListView extends StatelessWidget {
    const OrganizationListView(
      {Key key,
      this.organizationData,
      this.loggedIn,
      this.callback})
      : super(key: key);
  final VoidCallback callback;
  final Organization organizationData;
  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    double text_width = MediaQuery.of(context).size.width*0.5;
    double img_width = MediaQuery.of(context).size.width*0.3;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Center(
              child: Image.network(
                'http://127.0.0.1:8000/media/${organizationData.image}',
                height: 200,
                ),
            ),
          ),
          Expanded(
            child: Text(
              "${organizationData.name}",
              style: TextStyle(fontSize: 12)
              
            )
          )
        ],
      ),
    );
    Card(
      child: Center(
        child: Image.network('http://127.0.0.1:8000/media/${organizationData.image}'),
      ),
    );
    
    
    Card(
      child: Center(
        child: Image.network('http://127.0.0.1:8000/media/${organizationData.image}'),
        
        // Text(
        //   'Dummy Card Text $index'
        // )
      ),
    );


    // return Card(
    //   child: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         Container(
    //           height: 200,
    //           width: 200,
    //           child: Padding(
    //             padding: EdgeInsets.all(20),
    //             child: SizedBox(
    //               // height: 200,
    //               child: Image.network('http://127.0.0.1:8000/media/${organizationData.image}'),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.all(20),
    //           child: Text('${organizationData.name}'),
    //         ),
    //       ]
    //     )
    //   ),
    // );
  }
}
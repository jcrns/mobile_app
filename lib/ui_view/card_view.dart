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
    return Card(
      child: Center(
        child: Text('Dummy Card Text ')
      ),
    );
  }
}
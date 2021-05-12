import 'package:project1010_flutter/pages/filter/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:project1010_flutter/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PoliticianListView extends StatelessWidget {
  const PoliticianListView(
      {Key key,
      this.politicianData,
      this.animationController,
      this.animation,
      this.loggedIn,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Politicians politicianData;
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    double text_width = MediaQuery.of(context).size.width*0.5;
    double img_width = MediaQuery.of(context).size.width*0.3;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  callback();
                },
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  //   boxShadow: <BoxShadow>[
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.6),
                  //       offset: const Offset(4, 4),
                  //       blurRadius: 16,
                  //     ),
                  //   ],
                  // ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: CachedNetworkImage(
                                    width: img_width,
                                    imageUrl: hostname + politicianData.image,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        politicianData.location,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        politicianData.name,
                                        style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        politicianData.position,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: politicianData?.similarViews?.map((similarView) => SimilarViewsText(similarView : similarView))?.toList() ?? [],

                            //   items: ["City Council", 'Mayor', "Congress", "Senate", "Governor", "President"].map(
                            //   (val) {
                            //     return DropdownMenuItem<String>(
                            //       value: val,
                            //       child: Text(val),
                            //     );
                            //   },
                            // ).toList(),
                            ),
                          ],
                        ),
                      ),
                      onTap: () async{
                        print(politicianData);
                        // await Navigator.of(context).pushNamed('/politician-page', arguments: politicianData);
                        print('sfsff');
                      },
                    )
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SimilarViewsText extends StatelessWidget {
  final similarView;
  
  SimilarViewsText({
    this.similarView,
  });

  @override
  Widget build(BuildContext context) {
    print(similarView);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "You have similar views on " + similarView
      ),
    );
  }
}

class EventListView extends StatelessWidget {
  const EventListView(
      {Key key,
      this.eventData,
      this.animationController,
      this.animation,
      this.loggedIn,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Events eventData;
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    double text_width = MediaQuery.of(context).size.width*0.5;
    double img_width = MediaQuery.of(context).size.width*0.3;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  callback();
                },
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  //   boxShadow: <BoxShadow>[
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.6),
                  //       offset: const Offset(4, 4),
                  //       blurRadius: 16,
                  //     ),
                  //   ],
                  // ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: CachedNetworkImage(
                                    width: img_width,
                                    imageUrl: hostname + eventData.image,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        eventData.address,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        eventData.title,
                                        style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        eventData.organizer,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () async{
                        print(eventData);
                        // await Navigator.of(context).pushNamed('/politician-page', arguments: politicianData);
                        print('sfsff');
                      },
                    )
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovementListView extends StatelessWidget {
  const MovementListView(
      {Key key,
      this.movementData,
      this.animationController,
      this.animation,
      this.loggedIn,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Movements movementData;
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    double text_width = MediaQuery.of(context).size.width*0.5;
    double img_width = MediaQuery.of(context).size.width*0.3;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  callback();
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: CachedNetworkImage(
                                    width: img_width,
                                    imageUrl: hostname + movementData.image,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        movementData.name,
                                        style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: text_width,
                                      child: Text(
                                        movementData.mission,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () async{
                        print(movementData);
                        // await Navigator.of(context).pushNamed('/politician-page', arguments: politicianData);
                        print('sfsff');
                      },
                    )
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:parentive/screens/login_main_1.dart';
import 'package:parentive/screens/singup_info.dart';
import 'package:parentive/utils/customExitAppDialog.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _current = 0;
  List imageList = [
    'https://www.mindbodyhealthassociates.com/wp-content/uploads/2014/02/parenting-icon.png',
    'https://sites.google.com/site/youeducateme/_/rsrc/1416773622372/teacher-page/grants/icon_parenting_centers.png',
    'https://media.idownloadblog.com/wp-content/uploads/2016/06/parent_icon.png',
  ];
  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context, builder: (context) => CustomExitAppDialog())) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.green,
                    // height: MediaQuery.of(context).size.height * 0.4,
                    // width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.only(
                    //   top: 92,
                    //   right: 92,
                    //   left: 92,
                    //   bottom: 0,
                    // ),
                    child: CarouselSlider(
                      // items: imageList,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                          initialPage: 0,
                          disableCenter: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          // viewportFraction: 0.8,
                          reverse: false,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: imageList.map((e) {
                        return Builder(builder: (context) {
                          return Container(
                            // height: MediaQuery.of(context).size.height * 9,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 7),
                                    child: CachedNetworkImage(
                                      height: 100,
                                      width: 80,
                                      imageUrl: e,
                                      fit: BoxFit.fill,
                                      placeholder: (context, e) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "Eveidence base data approach.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "Autism, or autism spectrum disorder(ASD), refers to a broad range of conditions characterized by challenges with social skills.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.map((e) {
                      int index = imageList.indexOf(e);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? Colors.black : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      top: 120,
                      // right: 90,
                      // left: 90,
                      // bottom: 0,
                    ),
                    padding: EdgeInsets.only(
                      top: 12,
                      left: 73,
                      right: 72,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xff50be91),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Color(0xffffffff),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'Login');
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => LoginMain(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.only(bottom: 2),
                    padding: EdgeInsets.only(
                      top: 12,
                      left: 73,
                      right: 72,
                      bottom: 8,
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xffffffff),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Color(0xff50be91),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'Signup');
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => SignUp(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/page-1/configurations.dart';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;


class UserIDChangingSFC extends StatefulWidget{
  UserIDChangingSF createState() => UserIDChangingSF();
}
class UserIDChangingSF extends State<UserIDChangingSFC> {
  final TextEditingController userIDController = TextEditingController();


  void changeUserID() async {
  // Check if the newUserID is not empty
  String cnewUserID = userIDController.text;
  if (cnewUserID.isNotEmpty) {
    if(cnewUserID == UserData.USERID){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please Enter New UserID You Enter Existing User ID'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
    }else{
    try {
      String needURL = url + UserData.REGISTERNUMBER + '/changeUserID';
      Uri changeUserIDUri = Uri.parse(needURL); // Replace 'uri' with your actual server endpoint
      // Send POST request to the server
      
      var response = await http.post(
        changeUserIDUri,
        body: json.encode({'NewUserID': cnewUserID}),
        headers: {'Content-Type': 'application/json'},
      );
      
      // Handle response
      if (response.statusCode == 200) {
        // UserID changed successfully
        // Handle success response here
        var responseData = json.decode(response.body);
        String nUserID = responseData['student']['newUserID'];
 // Extract register number from response
        // Save user credentials and register number to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userID', nUserID);
        UserData.loadData();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('UserID changed successfully New UserID: '+cnewUserID),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Show popup for failure
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to change UserID'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Error occurred while sending request
      // Handle error here
    }
  }} else {
    // NewUserID is empty
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('New UserID cannot be empty'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // useridchangingTvX (11:671)
            width: double.infinity,
            height: 844*fem,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Container(
              // depth0frame01BM (11:672)
              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 183*fem),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xfff2f7f4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // depth1frame0vZD (11:673)
                    padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 8*fem),
                    width: double.infinity,
                    height: 72*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f7f4),
                    ),
                    child: Container(
                      // autogroupyh3v3dq (RVyzyk9GXyhCSHfNDcYH3V)
                      padding: EdgeInsets.fromLTRB(0*fem, 12*fem, 108.19*fem, 12*fem),
                      width: 310*fem,
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // depth3frame0ZcB (11:675)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                            child: TextButton(
                              onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 24*fem,
                                height: 24*fem,
                                child: Image.asset(
                                  'assets/page-1/images/depth-3-frame-0-xMu.png',
                                  width: 24*fem,
                                  height: 24*fem,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // depth4frame0FE7 (11:681)
                            margin: EdgeInsets.fromLTRB(0*fem, 0.75*fem, 0*fem, 0.75*fem),
                            width: 153.81*fem,
                            height: double.infinity,
                            child: Text(
                              'Change User ID',
                              style: SafeGoogleFont (
                                'Plus Jakarta Sans',
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.25*ffem/fem,
                                letterSpacing: -0.2700000107*fem,
                                color: Color(0xff0c1c17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // autogroup8xnbiNb (RVyzXbEBRtWr8eqvLm8xNb)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 232*fem),
                    padding: EdgeInsets.fromLTRB(16*fem, 12*fem, 16*fem, 55*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // existinguseridgopick2004R27 (11:690)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32.5*fem),
                          child: Text(
                            'Existing User ID: ' + UserData.USERID,
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              color: Color(0xff0c1c17),
                            ),
                          ),
                        ),
                        Container(
                          // collegeregisternumber22mis0058 (11:705)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32.5*fem),
                          child: Text(
                            'College Register Number:' + UserData.REGISTERNUMBER,
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              color: Color(0xff0c1c17),
                            ),
                          ),
                        ),
                        Container(
                          // depth3frame0Pd9 (11:718)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21*fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // enternewuseridvd5 (11:720)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                child: Text(
                                  'Enter New User Id',
                                  style: SafeGoogleFont (
                                    'Plus Jakarta Sans',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                              Container(
                                // depth5frame0qEF (11:722)
                                padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 15*fem, 17*fem),
                                width: double.infinity,
                                height: 56*fem,
                                decoration: BoxDecoration (
                                  border: Border.all(color: Color(0xffcce5dd)),
                                  color: Color(0xfff2f7f4),
                                  borderRadius: BorderRadius.circular(12*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // depth6frame0LB1 (11:723)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                                      width: 288*fem,
                                      height: double.infinity,
                                      
                                      child: TextField(
                                        controller: userIDController,
                                        decoration: InputDecoration (
                                          
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Enter New User Id                                                         ',
                                          hintStyle: TextStyle(color:Color(0xff4c937f)),
                                        ),
                                        style: SafeGoogleFont (
                                          'Plus Jakarta Sans',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                    child: Container(
                                      // depth6frame1c8X (24:47)
                                      width: 24*fem,
                                      height: 24*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/depth-6-frame-1-haF.png',
                                        width: 24*fem,
                                        height: 24*fem,
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          // depth2frame0LqD (11:733)
                          onPressed: () {
                            
                            changeUserID();
                            //print('Register Number :$registerNumber');
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(150.25*fem, 12*fem, 149.75*fem, 12*fem),
                            width: double.infinity,
                            height: 48*fem,
                            decoration: BoxDecoration (
                              color: Color(0xff7dd6bc),
                              borderRadius: BorderRadius.circular(24*fem),
                            ),
                            child: Container(
                              // depth3frame0q1H (11:734)
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xff7dd6bc),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: SafeGoogleFont (
                                    'Plus Jakarta Sans',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5*ffem/fem,
                                    letterSpacing: 0.2399999946*fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // depth1frame7XPu (11:738)
                    width: double.infinity,
                    height: 20*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f7f4),
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
class  UserIDChanging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserIDChangingSFC();
  }
}
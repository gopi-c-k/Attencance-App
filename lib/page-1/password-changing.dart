import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/configurations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordChangingSFC extends StatefulWidget{
  PasswordChangingSF createState() => PasswordChangingSF();
}
class PasswordChangingSF extends State<PasswordChangingSFC> {
    final TextEditingController oldpwdController = TextEditingController();
    final TextEditingController newpwdController = TextEditingController();
    final TextEditingController newpwdrController = TextEditingController();

  @override
    void changePassWord() async {
  String cnewPWD = newpwdController.text;
  String cnewPWDR = newpwdrController.text;
  String coldPWD = oldpwdController.text;
  if(!coldPWD.isNotEmpty){
    showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please Enter Old Password'),
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

  }else if (cnewPWD.isNotEmpty && cnewPWD == cnewPWDR) {
    if(cnewPWD == UserData.PASSWORD){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please Enter New Password You Enter Existing Password'),
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
    }else if(coldPWD== UserData.PASSWORD){
    try {
      String needURL = url + UserData.REGISTERNUMBER + '/changePassWorD';
      Uri changeUserIDUri = Uri.parse(needURL); // Replace 'uri' with your actual server endpoint
      // Send POST request to the server
      
      var response = await http.post(
        changeUserIDUri,
        body: json.encode({'NewPWD': cnewPWD}),
        headers: {'Content-Type': 'application/json'},
      );
      
      // Handle response
      if (response.statusCode == 200) {
        // UserID changed successfully
        // Handle success response here
        var responseData = json.decode(response.body);
        String npwd = responseData['student']['newPassword'];
 // Extract register number from response
        // Save user credentials and register number to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('password', npwd);
        UserData.loadData();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Password changed successfully'),
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
              content: Text('Failed to change Password'),
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
          content: Text('PassWord cannot be empty And Re-Entered New Password must be same Entered New Password'),
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
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 844 * fem,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 72 * fem),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff2f7f4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 8 * fem),
                    width: double.infinity,
                    height: 72 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f7f4),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0 * fem, 12 * fem, 108.19 * fem, 12 * fem),
                      width: 310 * fem,
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 24 * fem, 0 * fem),
                            child: TextButton(
                              onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/depth-3-frame-0-415.png',
                                  width: 24 * fem,
                                  height: 24 * fem,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0.75 * fem, 0 * fem, 0.75 * fem),
                            height: double.infinity,
                            child: Text(
                              'Change Password',
                              style: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.25 * ffem / fem,
                                letterSpacing: -0.2700000107 * fem,
                                color: Color(0xff0c1c17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 232 * fem),
                    padding: EdgeInsets.fromLTRB(16 * fem, 12 * fem, 16 * fem, 55 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: Text(
                                  'Enter Old Password',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15 * fem, 15 * fem, 15 * fem, 17 * fem),
                                width: double.infinity,
                                height: 56 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffcce5dd)),
                                  color: Color(0xfff2f7f4),
                                  borderRadius: BorderRadius.circular(12 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19 * fem, 0 * fem),
                                      width: 285 * fem,
                                      height: double.infinity,
                                      child: TextField(
                                        controller: oldpwdController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Enter Old Password',
                                          hintStyle: TextStyle(color: Color(0xff4c937f)),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                    child: Container(
                                      width: 24 * fem,
                                      height: 24 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/depth-6-frame-1.png',
                                        width: 24 * fem,
                                        height: 24 * fem,
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: Text(
                                  'Enter New Password',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15 * fem, 15 * fem, 15 * fem, 17 * fem),
                                width: double.infinity,
                                height: 56 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffcce5dd)),
                                  color: Color(0xfff2f7f4),
                                  borderRadius: BorderRadius.circular(12 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 128 * fem, 0 * fem),
                                      width: 176 * fem,
                                      height: double.infinity,
                                      child: TextField(
                                        obscureText: true,
                                        controller: newpwdController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Enter New Password',
                                          hintStyle: TextStyle(color: Color(0xff4c937f)),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                    child: Container(
                                      width: 24 * fem,
                                      height: 24 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/depth-6-frame-1-H1y.png',
                                        width: 24 * fem,
                                        height: 24 * fem,
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 21 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: Text(
                                  'Re-enter New Password',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15 * fem, 15 * fem, 15 * fem, 17 * fem),
                                width: double.infinity,
                                height: 56 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffcce5dd)),
                                  color: Color(0xfff2f7f4),
                                  borderRadius: BorderRadius.circular(12 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 128 * fem, 0 * fem),
                                      width: 176 * fem,
                                      height: double.infinity,
                                      child: TextField(
                                        obscureText: true,
                                        controller: newpwdrController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Re-enter New Password',
                                          hintStyle: TextStyle(color: Color(0xff4c937f)),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                    child: Container(
                                      width: 24 * fem,
                                      height: 24 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/depth-6-frame-1-vDu.png',
                                        width: 24 * fem,
                                        height: 24 * fem,
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
                          onPressed: () {
                            changePassWord();
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(150.25 * fem, 12 * fem, 149.75 * fem, 12 * fem),
                            width: double.infinity,
                            height: 48 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xff7dd6bc),
                              borderRadius: BorderRadius.circular(24 * fem),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff7dd6bc),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.2399999946 * fem,
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
                    width: double.infinity,
                    height: 20 * fem,
                    decoration: BoxDecoration(
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

class  PasswordChanging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PasswordChangingSFC();
  }
}

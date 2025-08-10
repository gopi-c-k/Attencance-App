import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/password-changing.dart';
import 'package:myapp/page-1/user-id-changing.dart';
import 'package:myapp/page-1/taking-attendance.dart';

class StudentsSettingsSFC extends StatefulWidget{
  StudentsSettingsSF createState() => StudentsSettingsSF();
}

class StudentsSettingsSF extends State<StudentsSettingsSFC> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 396;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 548 * fem),
            width: 390 * fem,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfff2f7f4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16 * fem, 28 * fem, 16 * fem, 20 * fem),
                  width: double.infinity,
                  height: 72 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24 * fem,
                        height: 24 * fem,
                        child: Image.asset(
                          'assets/page-1/images/depth-3-frame-0-4Sb.png',
                          width: 24 * fem,
                          height: 24 * fem,
                        ),
                      ),
                      SizedBox(width: 24 * fem), // Added SizedBox for spacing
                      Container(
                        margin: EdgeInsets.only(left: 24 * fem), // Adjust margin
                        child: Text(
                          'Settings',
                          style: SafeGoogleFont(
                            'Plus Jakarta Sans',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.25 * ffem / fem,
                            letterSpacing: -0.2700000107 * fem,
                            color: Color(0xff0c1c17),
                          ),
                        ),
                      ),
                      Spacer(), // Added Spacer to push the button to the right
                      TextButton(
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
                            'assets/page-1/images/depth-3-frame-2-t5d.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordChanging()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16 * fem, 8 * fem, 18 * fem, 8 * fem),
                    width: double.infinity,
                    height: 56 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f7f4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40 * fem,
                          height: 40 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-0-ptX.png',
                            width: 40 * fem,
                            height: 40 * fem,
                          ),
                        ),
                        SizedBox(width: 16 * fem), // Added SizedBox for spacing
                        Container(
                          margin: EdgeInsets.only(left: 16 * fem), // Adjust margin
                          width: 121 * fem,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Reset Password',
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff0c1c17),
                              ),
                            ),
                          ),
                        ),
                        Spacer(), // Added Spacer to push the button to the right
                        Container(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-2-ibh.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Similar structure for other buttons...
                // Change Fingerprint
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16 * fem, 8 * fem, 18 * fem, 8 * fem),
                    width: double.infinity,
                    height: 56 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f7f4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40 * fem,
                          height: 40 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-0-AoH.png',
                            width: 40 * fem,
                            height: 40 * fem,
                          ),
                        ),
                        SizedBox(width: 16 * fem),
                        Container(
                          width: 147 * fem,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Change Fingerprint',
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff0c1c17),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-2.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Change User ID
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserIDChanging()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16 * fem, 8 * fem, 18 * fem, 8 * fem),
                    width: double.infinity,
                    height: 56 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f7f4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40 * fem,
                          height: 40 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-0-S15.png',
                            width: 40 * fem,
                            height: 40 * fem,
                          ),
                        ),
                        SizedBox(width: 16 * fem),
                        Container(
                          width: 120 * fem,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Change User ID',
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff0c1c17),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-2-c47.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Taking Attendance
                TextButton(
                  onPressed: () {
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TakingAttendance()),
                    );*/
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16 * fem, 8 * fem, 18 * fem, 8 * fem),
                    width: double.infinity,
                    height: 56 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f7f4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40 * fem,
                          height: 40 * fem,
                          child: Image.asset(
                            'assets/page-1/images/group.png',
                            width: 40 * fem,
                            height: 40 * fem,
                          ),
                        ),
                        SizedBox(width: 16 * fem),
                        Container(
                          width: 36 * fem,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Help',
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff0c1c17),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-2-1ju.png',
                            width: 24 * fem,
                            height: 24 * fem,
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
      ),
    );
  }
}
class  StudentsSettings  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StudentsSettingsSFC();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:local_auth/local_auth.dart'; 
class TakingAttendanceSFC extends StatefulWidget{
  TakingAttendanceSF createState() => TakingAttendanceSF();
}
class TakingAttendanceSF extends State<TakingAttendanceSFC> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _suppportstate = false;
  @override
  /*void initState(){
    super.initState();
    _localAuth = LocalAuthentication();
    _localAuth.isDeviceSupported().then(
      (bool isSupported) => setState((){
        _suppportstate = isSupported;
      }),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    double baseWidth = 396;
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
              width: 390 * fem,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff2f7f4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 404 * fem),
                    padding: EdgeInsets.fromLTRB(16 * fem, 24 * fem, 16 * fem, 12 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                          child: Text(
                            'Class Connect',
                            style: GoogleFonts.getFont(
                              'Plus Jakarta Sans',
                              fontSize: 32 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.25 * ffem / fem,
                              letterSpacing: -0.8000000119 * fem,
                              color: Color(0xff0c1c17),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                          child: Text(
                            'Faculty wants to take attendance',
                            style: GoogleFonts.getFont(
                              'Plus Jakarta Sans',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff0c1c17),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 19 * fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                child: Text(
                                  'SWE2005 - DSA',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                              Text(
                                'Enter 6  Digit SSC',
                                style: GoogleFonts.getFont(
                                  'Plus Jakarta Sans',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
                          padding: EdgeInsets.fromLTRB(15 * fem, 15 * fem, 15 * fem, 17 * fem),
                          width: double.infinity,
                          height: 56 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffcce5dd)),
                            color: Color(0xfff2f7f4),
                            borderRadius: BorderRadius.circular(12 * fem),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 259 * fem,
                              height: double.infinity,
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 69 * fem, 0 * fem),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                  //    keyboardType: TextInputType.number,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    //  maxLength: 6,
                                      hintText: 'Enter 6 digit scc',
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
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 40 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffe0efea),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 91.5 * fem,
                                top: 4 * fem,
                                child: Container(
                                  width: 175 * fem,
                                  height: 32 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16 * fem),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18 * fem,
                                top: 4 * fem,
                                child: TextButton(
                                 onPressed: () async {
                    // Call function to verify fingerprint
                    await _verifyFingerprint(context);
                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 20 * fem),
                                  ),
                                  child: Container(
                                    width: 294 * fem,
                                    height: 32 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff2f7f4),
                                      borderRadius: BorderRadius.circular(16 * fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x19000000),
                                          offset: Offset(0 * fem, 0 * fem),
                                          blurRadius: 2 * fem,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Fingerprint verify',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 16 * fem, 12 * fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 20 * fem),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 48 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff7dd6bc),
                                borderRadius: BorderRadius.circular(24 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Verify',
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16 * fem),
                          child: TextButton(
                            onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 20 * fem),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 48 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffe0efea),
                                borderRadius: BorderRadius.circular(24 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
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
                  /*Container(
                    width: double.infinity,
                    height: 20 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff2f7f4),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _verifyFingerprint(BuildContext context) async {
    bool isAuthenticated = false;

    try {
     // Check if biometric authentication is available
      bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (canCheckBiometrics) {
        // Authenticate using biometrics
        isAuthenticated = await _localAuth.authenticate(
          localizedReason: 'Please authenticate to verify your fingerprint.',
          //biometricOnly: true, // Only allow biometric methods (fingerprint, face, etc.)
        );
      }
    } catch (e) {
      print('Error authenticating: $e');
    }

    // Check the result of authentication
    if (isAuthenticated) {
      // Fingerprint authentication successful
      // Implement your logic here after successful verification
      //print('Fingerprint authentication successful');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Fingerprint Sucessfully Verified'),
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
      // Fingerprint authentication failed
      // Implement your logic here for failure cases
      //print('Fingerprint authentication failed');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to fingerprint verify Try Again'),
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

}
class TakingAttendance  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TakingAttendanceSFC();
  }
}
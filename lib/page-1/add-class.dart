import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // addclassXNF (1:449)
        padding: EdgeInsets.fromLTRB(20*fem, 20*fem, 9*fem, 20*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          border: Border.all(color: Color(0xff9747ff)),
          borderRadius: BorderRadius.circular(5*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // statedefault2K1 (1:450)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 140*fem),
              padding: EdgeInsets.fromLTRB(16*fem, 8*fem, 27*fem, 12*fem),
              width: double.infinity,
              height: 86*fem,
              decoration: BoxDecoration (
                color: Color(0xfff2f7f4),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // depth2frame0jDR (1:451)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // depth3frame04mV (1:452)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                          width: 48*fem,
                          height: 48*fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-0-DiF.png',
                            width: 48*fem,
                            height: 48*fem,
                          ),
                        ),
                        Container(
                          // depth3frame2oDH (1:457)
                          width: 250*fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // depth4frame0x6B (1:458)
                                width: 126*fem,
                                height: 24*fem,
                                child: Center(
                                  child: Text(
                                    'SWE2004 - DSA',
                                    style: SafeGoogleFont (
                                      'Plus Jakarta Sans',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5*ffem/fem,
                                      color: Color(0xff0c1c17),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // depth4frame1SX9 (1:461)
                                width: 114*fem,
                                height: 42*fem,
                                child: Center(
                                  // slotb1facultyseetharCFR (1:463)
                                  child: SizedBox(
                                    child: Container(
                                      constraints: BoxConstraints (
                                        maxWidth: 114*fem,
                                      ),
                                      child: Text(
                                        'Slot: B1\nFaculty: Seetha R',
                                        style: SafeGoogleFont (
                                          'Plus Jakarta Sans',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff4c937f),
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
                  TextButton(
                    // depth2frame16bh (1:464)
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 28*fem,
                      height: 28*fem,
                      child: Image.asset(
                        'assets/page-1/images/depth-2-frame-1-X7M.png',
                        width: 28*fem,
                        height: 28*fem,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // stateactivec4F (1:470)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
              padding: EdgeInsets.fromLTRB(16*fem, 17*fem, 16*fem, 20*fem),
              width: 390*fem,
              decoration: BoxDecoration (
                color: Color(0xfff2f7f4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupdjbzFsu (RVyxfZVrNiaTbBpFz3dJbZ)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                    width: double.infinity,
                    height: 48*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // depth2frame0n79 (1:471)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // depth3frame0tvs (1:472)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                                width: 48*fem,
                                height: 48*fem,
                                child: Image.asset(
                                  'assets/page-1/images/depth-3-frame-0-q51.png',
                                  width: 48*fem,
                                  height: 48*fem,
                                ),
                              ),
                              Container(
                                // depth4frame0pJj (1:478)
                                margin: EdgeInsets.fromLTRB(0*fem, 12*fem, 0*fem, 12*fem),
                                width: 239*fem,
                                height: double.infinity,
                                child: Center(
                                  child: Text(
                                    'SWE2004 - DSA',
                                    style: SafeGoogleFont (
                                      'Plus Jakarta Sans',
                                      fontSize: 30*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 0.8*ffem/fem,
                                      color: Color(0xff0c1c17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          // depth2frame1WxF (1:483)
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 28*fem,
                            height: 28*fem,
                            child: Image.asset(
                              'assets/page-1/images/depth-2-frame-1-4Lf.png',
                              width: 28*fem,
                              height: 28*fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // coursedatastructureandalgorith (1:482)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 59*fem, 0*fem),
                    constraints: BoxConstraints (
                      maxWidth: 291*fem,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: SafeGoogleFont (
                          'Plus Jakarta Sans',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.3125*ffem/fem,
                          color: Color(0xff4c937f),
                        ),
                        children: [
                          TextSpan(
                            text: 'Course:',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3125*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: ' Data Structure And Algorithms\n',
                          ),
                          TextSpan(
                            text: 'Course Code:',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3125*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: ' SWE2004\n',
                          ),
                          TextSpan(
                            text: 'Slot:',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3125*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: ' B1\n',
                          ),
                          TextSpan(
                            text: 'Faculty:',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3125*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: '  Seetha R\n',
                          ),
                          TextSpan(
                            text: 'Venue:',
                            style: SafeGoogleFont (
                              'Plus Jakarta Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3125*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: ' SJT G08',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
}
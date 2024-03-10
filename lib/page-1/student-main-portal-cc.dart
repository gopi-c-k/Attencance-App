import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/student-main-portal-uc.dart';
import 'package:myapp/page-1/students-settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/page-1/configurations.dart';

class StudentMainPortalCCSFC extends StatefulWidget{
  StudentMainPortalCCSF createState() => StudentMainPortalCCSF();
}

class StudentMainPortalCCSF extends State<StudentMainPortalCCSFC> {
  Map<String, dynamic> studentData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Replace the URL with your actual API endpoint
      final response = await http.post(
        Uri.parse(url + UserData.REGISTERNUMBER + '/SDashboardCC'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'password': UserData.PASSWORD}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          studentData = responseData['student'];
        });
      } else {
        // Handle error
        print('Failed to fetch data');
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
  String symbol ='assets/page-1/images/depth-2-frame-1.png';
  List<Widget> buildCustomCourseWidgets(Map<String, dynamic> studentData, double fem, double ffem) {
  List<Widget> courseWidgets = [];
  if (studentData.containsKey('courses')) {
    List<dynamic> courses = studentData['courses'];
    for (var course in courses) {
      if (course['attendanceStatus'] == true) {
        if(course['presentStatus'] == true){
          symbol ='assets/page-1/images/depth-2-frame-1-wNX.png';
        }else{
          symbol ='assets/page-1/images/depth-2-frame-1.png';
        }
        courseWidgets.add(
          Container(
            padding: EdgeInsets.fromLTRB(16 * fem, 8 * fem, 18 * fem, 8 * fem),
            width: double.infinity,
            height: 82 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff2f7f4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 18 * fem, 0 * fem),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
                        width: 48 * fem,
                        height: 48 * fem,
                        child: Image.asset(
                          'assets/page-1/images/depth-3-frame-0-rDD.png',
                          width: 48 * fem,
                          height: 48 * fem,
                        ),
                      ),
                      Container(
                        width: 250 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 138 * fem,
                              height: 24 * fem,
                              child: Center(
                                child: Text(
                                  '${course["courseCode"]} - ${course["courseName"]}',
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff0c1c17),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 96 * fem,
                              height: 42 * fem,
                              child: Center(
                                child: SizedBox(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 96 * fem,
                                    ),
                                    child: Text(
                                      'Slot: ${course["slot"]}\nFaculty: ${course["facultyUsernames"].join(", ")}',
                                      style: SafeGoogleFont(
                                        'Plus Jakarta Sans',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
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
                Container(
                  width: 24 * fem,
                  height: 24 * fem,
                  child: Image.asset(
                    symbol,
                    width: 24 * fem,
                    height: 24 * fem,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }
  return courseWidgets;
}

  @override
  Widget build(BuildContext context) {

    double baseWidth = 396;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    List<Widget> courseWidgets = buildCustomCourseWidgets(studentData, fem, ffem);

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Container(
            width: double.infinity,
            height: 844 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff2f7f4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 8 * fem),
                  width: double.infinity,
                  height: 72 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xfff2f7f4),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 24 * fem, 0 * fem),
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-0-goH.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 12.75 * fem, 0 * fem, 12.75 * fem),
                          width: 262 * fem,
                          height: double.infinity,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 95.06 * fem, 0 * fem),
                            width: 166.94 * fem,
                            height: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              child: Text(
                                'CLASS CONNECT',
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
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StudentsSettings()),
                            );
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Container(
                            width: 48 * fem,
                            height: 48 * fem,
                            child: Image.asset(
                              'assets/page-1/images/depth-3-frame-2-s7V.png',
                              width: 48 * fem,
                              height: 48 * fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 0 * fem, 18 * fem),
                  child: Text(
                    'Today,',
                    style: SafeGoogleFont(
                      'Plus Jakarta Sans',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.05 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 16 * fem, 12 * fem),
                  padding: EdgeInsets.fromLTRB(4 * fem, 4 * fem, 4 * fem, 4 * fem),
                  width: double.infinity,
                  height: 40 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffe0efea),
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StudentMainPortalUC()),
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(32.8 * fem, 5.5 * fem, 32.8 * fem, 5.5 * fem),
                          width: 175 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16 * fem),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Text(
                              'Upcoming Class',
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff4c937f),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(29.29 * fem, 5.5 * fem, 28.71 * fem, 5.5 * fem),
                        width: 175 * fem,
                        height: double.infinity,
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
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Completed Class',
                              style: SafeGoogleFont(
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
                    ],
                  ),
                ),
                SizedBox(height: 10),
              courseWidgets.isNotEmpty
                ? Column(
                    children: courseWidgets,
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'No classes Completed Today',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  )
                /*Container(
                  padding: EdgeInsets.fromLTRB(16 * fem, 8 * fem, 18 * fem, 8 * fem),
                  width: double.infinity,
                  height: 82 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xfff2f7f4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 18 * fem, 0 * fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 48 * fem,
                              height: 48 * fem,
                              child: Image.asset(
                                'assets/page-1/images/depth-3-frame-0-2NT.png',
                                width: 48 * fem,
                                height: 48 * fem,
                              ),
                            ),
                            Container(
                              width: 250 * fem,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 140 * fem,
                                    height: 24 * fem,
                                    child: Center(
                                      child: Text(
                                        'SWE2003 - DBMS',
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff0c1c17),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 139 * fem,
                                    height: 42 * fem,
                                    child: Center(
                                      child: SizedBox(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 139 * fem,
                                          ),
                                          child: Text(
                                            'Slot: L33 + L44\nFaculty: Ram Kumar T',
                                            style: SafeGoogleFont(
                                              'Plus Jakarta Sans',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
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
                      Container(
                        width: 24 * fem,
                        height: 24 * fem,
                        child: Image.asset(
                          'assets/page-1/images/depth-2-frame-1.png',
                          width: 24 * fem,
                          height: 24 * fem,
                        ),
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class StudentMainPortalCC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StudentMainPortalCCSFC();
  }
}
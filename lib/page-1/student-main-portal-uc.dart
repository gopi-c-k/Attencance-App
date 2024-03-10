import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/page-1/student-main-portal-cc.dart';
import 'package:myapp/page-1/students-settings.dart';
import 'package:myapp/page-1/configurations.dart';

class StudentMainPortalUCSFC extends StatefulWidget {
  @override
  _StudentMainPortalUCSFCState createState() => _StudentMainPortalUCSFCState();
}

class _StudentMainPortalUCSFCState extends State<StudentMainPortalUCSFC> {
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
        Uri.parse(url + UserData.REGISTERNUMBER + '/SDashboardUC'),
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

  List<Widget> buildCourseWidgets() {
    List<Widget> courseWidgets = [];
    if (studentData.containsKey('courses')) {
      List<dynamic> courses = studentData['courses'];
      for (var course in courses) {
        if (course['attendanceStatus'] == false) {
          courseWidgets.add(
            Container(
              padding: EdgeInsets.fromLTRB(16, 8, 27, 12),
              width: double.infinity,
              height: 86,
              decoration: BoxDecoration(
                color: Color(0xfff2f7f4),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                          width: 48,
                          height: 48,
                          child: Image.asset(
                            'assets/page-1/images/depth-3-frame-0-PUj.png',
                            width: 48,
                            height: 48,
                          ),
                        ),
                        Container(
                          width: 250,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 126,
                                height: 24,
                                child: Center(
                                  child: Text(
                                    '${course["courseCode"]} - ${course["courseName"]}',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Color(0xff0c1c17),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 114,
                                height: 42,
                                child: Center(
                                  child: SizedBox(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 114,
                                      ),
                                      child: Text(
                                        'Slot: ${course["slot"]}\nFaculty: ${course["facultyUsernames"].join(", ")}',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
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
                  Expanded(
                    child: Container(
                      width: 28,
                      height: 28,
                      child: Image.asset(
                        'assets/page-1/images/depth-2-frame-1-g8f.png',
                        width: 28,
                        height: 28,
                      ),
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
    List<Widget> courseWidgets = buildCourseWidgets();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your existing widgets
              
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
                            'assets/page-1/images/depth-3-frame-0-A71.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 12.75 * fem, 0 * fem, 12.75 * fem),
                          width: 262 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 95.06 * fem, 0 * fem),
                            width: 166.94 * fem,
                            height: double.infinity,
                            child: Text(
                              'CLASS CONNECT',
                              style: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.25 * ffem / fem,
                                //letterSpacing: -0.2700000107 * fem,
                                color: Color(0xff0c1c17),
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
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 48 * fem,
                            height: 48 * fem,
                            child: Image.asset(
                              'assets/page-1/images/depth-3-frame-2-7XM.png',
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
                  margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 0 * fem, 15 * fem),
                  child: Text(
                    'Today,',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.05 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 16 * fem, 20 * fem),
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
                      Container(
                        padding: EdgeInsets.fromLTRB(34.91 * fem, 5.5 * fem, 34.91 * fem, 5.5 * fem),
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
                          child: Text(
                            'upcoming class',
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
                      TextButton(
                        onPressed: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => StudentMainPortalCC()),
                    );
                  },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(31.68 * fem, 5.5 * fem, 31.68 * fem, 5.5 * fem),
                          width: 175 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16 * fem),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Center(
                              child: Text(
                                'completed class',
                                style: GoogleFonts.getFont(
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
                      ),
                    ],
                  ),
                ),
              /*SizedBox(height: 20),
              Text(
                'Upcoming Classes',
                style: GoogleFonts.getFont(
                  'Plus Jakarta Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff0c1c17),
                ),
              ),*/
              SizedBox(height: 10),
              courseWidgets.isNotEmpty
                ? Column(
                    children: courseWidgets,
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'No upcoming classes today',
                      style: TextStyle(
                        fontSize: 16,        
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StudentMainPortalUCSFC(),
  ));
}
class StudentMainPortalUC  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StudentMainPortalUCSFC();
  }
}
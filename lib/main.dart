import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
//import 'package:myapp/page-1/add-bio-metric-option.dart';
//import 'package:myapp/page-1/add-fingerprint.dart';
//import 'package:myapp/page-1/succesfully-fingerprint-added.dart';
import 'package:myapp/page-1/student-main-portal-uc.dart';
import 'package:myapp/page-1/student-main-portal-cc.dart';
import 'package:myapp/page-1/students-settings.dart';
import 'package:myapp/page-1/taking-attendance.dart';
//import 'package:myapp/page-1/place-fingerprint-to-attend-class.dart';
import 'package:myapp/page-1/student-log-in.dart';
import 'package:myapp/page-1/add-class.dart';
import 'package:myapp/page-1/password-changing.dart';
import 'package:myapp/page-1/user-id-changing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: Scaffold(
        body: SingleChildScrollView(
          child: StudentLogin(),
        ),
      ),
	);
	}
}

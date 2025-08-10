import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/page-1/configurations.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';/*
import 'package:airplane_mode_checker/airplane_mode_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';*/
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:local_auth/local_auth.dart'; 
import 'dart:async';
import 'package:multicast_dns/multicast_dns.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:quick_settings/quick_settings.dart';
import 'package:myapp/page-1/students-settings.dart';
import 'package:myapp/page-1/student-log-in.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null,[
    NotificationChannel(channelKey: 'Class Connect', channelName: 'Attendance Taking', channelDescription: 'Make Attendance')
  ]);
  QuickSettings.setup(
    onTileClicked: onTileClicked,
    onTileAdded: onTileAdded,
    onTileRemoved: onTileRemoved,
  );;
  setupNotificationListeners();
  runApp(MyApp());
}


late Future<Socket> _socketFuture;
   List<MdnsServer> mdnsServers = [];
late Socket socket;
late Socket sockets;
@pragma("vm:entry-point")
Tile onTileClicked(Tile tile)  {
  final oldStatus = tile.tileStatus;
  if (oldStatus == TileStatus.active) {
    // 1.
    tile.label = 'Student OFF';
    tile.tileStatus = TileStatus.inactive;
    tile.subtitle = "Class Connect";
    tile.drawableName = "class_of";
  } else {
    // 2.
    tile.label = 'Student ON';
    
    try {
   
    //bool isDiscovering = false;
    startDiscovery();
    
        
    int ports = 0;
    String ipAddress = '';
              for (MdnsServer server in mdnsServers) {
  if (server.name == 'gopi._http._tcp.local'){
  ipAddress = extractIPAddress(server.ipAddress);
  
 
  ports = server.port;
   
    break; 
  }
}
      _connectToServer(ports, ipAddress);
      //_listenForMessages(_socketFuture);
    } catch (e) {
      print('Error occurred: $e');
    }
    tile.tileStatus = TileStatus.active;
    tile.subtitle = "Class Connect";
    tile.drawableName = "class_on";
  }
    

  // 3.
  return tile;
}
String extractIPAddress(String input) {
  int startIndex = input.indexOf("'");
  int endIndex = input.indexOf("'", startIndex + 1);
  return input.substring(startIndex + 1, endIndex);
}
  void startDiscovery() async {
   
    final MDnsClient client = MDnsClient();
    await client.start();

    await for (PtrResourceRecord ptr in client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer('_http._tcp.local'))) {
      await for (SrvResourceRecord srv in client.lookup<SrvResourceRecord>(
          ResourceRecordQuery.service(ptr.domainName))) {
        final ipAddress = (await client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv4(srv.target),
            ).toList())
            .first
            .address
            .toString();

        mdnsServers.add(MdnsServer(
          name: ptr.domainName,
          ipAddress: ipAddress,
          port: srv.port,
        ));
        //setState(() {});
      }
    }
    client.stop();
  }
Map<String, String?> extractValues(String input) {
  // Split the input string based on commas
  List<String> parts = input.split(',');
  
  // Initialize variables to\
  String? slot, code, num;
  // Iterate through the parts to find the required values
  for (String part in parts) {
    if (part.contains('Slot')) {
      // Extract the slot value
      slot = part.split(':')[1].trim();
    } else if (part.contains('Code')) {
      // Extract the code value
      code = part.split(':')[1].trim();
    } 
  }
   // Create a map to store the extracted values
  Map<String, String?> extractedValues = {
    'slot': slot,
    'code': code,
  };

  return extractedValues;
}
void triggerNotification(String courseName, String courseCode, Socket s) {
    String notificationBody = 'Course Code: $courseName, Slot: $courseCode';
    AwesomeNotifications().createNotification(content: NotificationContent(id: 10, channelKey: 'Class Connect', title: 'Attendance Notification', body: notificationBody));
}
  Future<void> _connectToServer(int port, String address) async {
    
  try {
    socket = await Socket.connect(address, port);

    socket.writeln('hello notify me');

    socket.listen((List<int> event) {
      String message = utf8.decode(event).trim();
      if (message.isNotEmpty) {
          Map<String, String?> extractedValues = extractValues(message);
        triggerNotification(extractedValues['code'] ?? '', extractedValues['slot'] ?? '', socket);
        }
      print('Received message from server: $message');
    });
  } on SocketException catch (e) {
    print('SocketException: $e');
    throw e; // Rethrow the SocketException to handle it outside the method
  } on IOException catch (e) {
    print('IOException: $e');
    throw e; // Rethrow the IOException to handle it outside the method
  } catch (e) {
    print('Error connecting to server: $e');
    throw e; // Rethrow any other error to handle it outside the method
  }
}

@pragma("vm:entry-point")
Tile onTileAdded(Tile tile) {
  tile.label = "Student ON";
  tile.tileStatus = TileStatus.inactive;
  tile.subtitle = "Class Connect";
  tile.drawableName = "class_on";
  return tile;
}

@pragma("vm:entry-point")
void onTileRemoved() {
  print("Tile removed");
}
class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late Socket e;
  void initState() {

    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );

  }
  

	@override
	Widget build(BuildContext context) {
	return MaterialApp(
    navigatorKey: navigatorKey,
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
    //initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) =>
              StudentLogin()
          );

        case '/notification-page':
          return MaterialPageRoute(builder: (context) {
            return TakingAttendances();
          });

        default:
          return MaterialPageRoute(builder: (context) {
            // Here, directly return the TakingAttendance page
            return StudentsSettings();
          });
      }
    },
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
	);
	}
}

void setupNotificationListeners() {
  AwesomeNotifications().setListeners(
    onActionReceivedMethod: (ReceivedAction receivedAction) async {
      await NotificationController.onActionReceivedMethod(receivedAction);
    },
    onNotificationCreatedMethod: (ReceivedNotification receivedNotification) async{
      await NotificationController.onNotificationCreatedMethod(receivedNotification);
    },
    onNotificationDisplayedMethod: (ReceivedNotification receivedNotification) async {
     await NotificationController.onNotificationDisplayedMethod(receivedNotification);
    },
    onDismissActionReceivedMethod: (ReceivedAction receivedAction) async {
     await NotificationController.onDismissActionReceivedMethod(receivedAction);
    },
  );
}
class NotificationController {
static ReceivedAction? initialAction;
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
  }
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
            (route) => (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }
     @pragma("vm:entry-point") 
    static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
        (route) =>
            (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }
}
class MdnsServer {
  final String name;
  final String ipAddress;
  final int port;

  MdnsServer({required this.name, required this.ipAddress, required this.port});
}
class TakingAttendanceSFC extends StatefulWidget{
 
  TakingAttendanceSF createState() => TakingAttendanceSF();
}
class TakingAttendanceSF extends State<TakingAttendanceSFC> {

  late Socket soc;
  late String lot;
  late String cc;
  late String num;
  final TextEditingController codecontroller = TextEditingController();
  List<MdnsServer> mdns = [];
  
    final LocalAuthentication auth = LocalAuthentication();
    late Socket sock;
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  late bool _isLoading;
late String errorMessage;

   @override
   void initState() {
    super.initState();
    _isLoading = true;
    _startServerDiscoverys();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }
 String extractIPAddres(String input) {
  int startIndex = input.indexOf("'");
  int endIndex = input.indexOf("'", startIndex + 1);
  return input.substring(startIndex + 1, endIndex);
}
 Future<void> _startServerDiscoverys() async {
    final MDnsClient client = MDnsClient();
    await client.start();

    await for (PtrResourceRecord ptr in client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer('_http._tcp.local'))) {
      await for (SrvResourceRecord srv in client.lookup<SrvResourceRecord>(
          ResourceRecordQuery.service(ptr.domainName))) {
        final ipAddress = (await client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv4(srv.target),
            ).toList())
            .first
            .address
            .toString();

        mdns.add(MdnsServer(
          name: ptr.domainName,
          ipAddress: ipAddress,
          port: srv.port,
        ));
      }
    }

    if (mdns.isNotEmpty) {
      _connectToServers();
    } else {
      setState(() {
        errorMessage = 'No mDNS servers found.';
        _isLoading = false;
      });
    }
client.stop();
 }
  Map<String, String?> extractValue(String input) {
  // Split the input string based on commas
  List<String> parts = input.split(',');
  
  // Initialize variables to\
  String? slot, code, num;
  // Iterate through the parts to find the required values
  for (String part in parts) {
    if (part.contains('Slot')) {
      // Extract the slot value
      slot = part.split(':')[1].trim();
    } else if (part.contains('Code')) {
      // Extract the code value
      code = part.split(':')[1].trim();
    } else if (part.contains('Number')) {
      // Extract the number value
      num = part.split(':')[1].trim();
    }
  }
   // Create a map to store the extracted values
  Map<String, String?> extractedValues = {
    'slot': slot,
    'code': code,
    'num': num,
  };

  return extractedValues;
}

Future<void> _connectToServers() async {
    try {
      for (MdnsServer server in mdns) {
        if (server.name == 'gopi._http._tcp.local') {
          soc = await Socket.connect(extractIPAddres(server.ipAddress), server.port);

          soc.writeln("It's from fingerprint");
          soc.listen((List<int> event) {
            String message = utf8.decode(event).trim();
            if (message.isNotEmpty) {
              Map<String, String?> extractedValues = extractValue(message);
              setState(() {
                lot = extractedValues['slot'] ?? '';
                cc = extractedValues['code'] ?? '';
                num = extractedValues['num'] ?? '';
              });
            }
            print('Received message from server: $message');
          });

          setState(() {
            _isLoading = false;
          });

          break;
        }
      }
    } on SocketException catch (e) {
      setState(() {
        errorMessage = 'Error connecting to server: $e';
        _isLoading = false;
      });
      print('SocketException: $e');
    } on IOException catch (e) {
      setState(() {
        errorMessage = 'Error connecting to server: $e';
        _isLoading = false;
      });
      print('IOException: $e');
    } catch (e) {
      setState(() {
        errorMessage = 'Error connecting to server: $e';
        _isLoading = false;
      });
      print('Error connecting to server: $e');
    }
  }
  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Place your fingerprint for Attendance',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }
   Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }
  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }
   void sendMessage(String message) {
    if (message.isNotEmpty) {
      

      // Send message to server
      soc.writeln(message);

    }
  }
   Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}
  Future<String> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return an empty string
    return 'Empty';
  }
}

  @override
  Widget build(BuildContext context) {
    return _isLoading ? _buildLoadingPage() : _buildMainPage();
  }
  Widget _buildLoadingPage() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

Widget _buildMainPage() {
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
                                  '${cc ?? ''} - ${lot ?? ''}',
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
                                    controller: codecontroller,
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
                                  if(_authorized == 'Not Authorized'){
                                    await _authenticateWithBiometrics();
                                  }
                                  
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
                                        _authorized == 'Not Authorized' ? 'Fingerprint Verify' : 'Fingerprint Verified',
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
                            onPressed: () async {
                              {
    if (num == codecontroller.text && _authorized != 'Not Authorized') {
      String counter = await readCounter();
      sendMessage('$counter');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your Attendance is Registered'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();  // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if(num != codecontroller.text){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Code Verification Failed'),
            content: Text('Please verify with SCC Code.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }else if (_authorized == 'Not Authorized'){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Verification Failed'),
            content: Text('Please verify your fingerprint.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  
                            } },
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
 



}
class TakingAttendances  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TakingAttendanceSFC();
  }
}
enum _SupportState {
  unknown,
  supported,
  unsupported,
}
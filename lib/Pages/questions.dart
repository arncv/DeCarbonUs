import 'package:airplane_mode_checker/airplane_mode_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_settings/open_settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_settings/system_settings.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';


class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late String yes;

  Future<void> _askPermissions(String routeName) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Navigator.of(context).pushNamed(routeName);
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }


  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if(result.toString() == "ConnectivityResult.mobile" || result.toString() ==  "ConnectivityResult.wifi"){
      setState(() {
        _connectionStatus = result;
      });
    }
    setState(() {
      _connectionStatus = result;
    });
  }


  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
      SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  Future<void>? _launched;
  void showLongToast(String state) {
    Fluttertoast.showToast(
      msg: state,
      toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
        fontSize: 16.0
    );
  }
  void showLongToast2(String state) {
    Fluttertoast.showToast(
      msg: state,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
  Future<void> _launchInWebViewOrVC(String url) async {
    await launch(url);
  }


  Future<void> createOrderMessage(String result) async {
    final status = (await AirplaneModeChecker.checkAirplaneMode());
    result = status.toString();

    print(status);

  }

  @override
  Widget build(BuildContext context) {
    String toLaunch = 'https://www.youtube.com/';

    if(_connectionStatus.toString() == "ConnectivityResult.mobile"){

      yes = "YOU ARE CONNECTED TO THE INTERNET THROUGH MOBILE DATA";
    }
    else if(_connectionStatus.toString() ==  "ConnectivityResult.wifi"){
      yes = "YOU ARE CONNECTED TO THE INTERNET THROUGH WIFI";
    }
    else{

      yes = "YOU ARE NOT CONNECTED TO THE INTERNET. CHOOSE FROM ONE OF THE THE FOLLOWING OPTIONS TO CONNECT TO THE INTERNET.";
    }
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: CupertinoScrollbar(
          isAlwaysShown: true,
          child:
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 295.0, 0.0),
                  child: Container(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.grey[800],
                      child: CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage('assets/logo.jpg'),
                      ),
                    ),
                  ),

                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                      child: Text(
                        yes,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',
                        ),
                      ),
                    ),
                    if(_connectionStatus.toString() == "ConnectivityResult.none")
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2.0, 30.0, 10.0, 0.0),
                            child: Container(
                              child: ElevatedButton(
                                child: Text(
                                  "Switch on Data",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Mon',
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.pushNamed(context, 'mobiledata');
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(160.0,60.0),
                                  primary: Color(0xFF07224C),
                                  onPrimary: Color(0XFFFFFFFF),
                                  shadowColor: Colors.black,
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if(_connectionStatus.toString() == "ConnectivityResult.none")
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 30.0, 0.0),
                              child: Container(
                                child: ElevatedButton(
                                  child: Text(
                                    "Switch on Wifi",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Mon',
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.pushNamed(context, 'wifi');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(160.0,60.0),
                                    primary: Color(0xFF07224C),
                                    onPrimary: Color(0XFFFFFFFF),
                                    shadowColor: Colors.black,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      child: const Text('Check AirplaneMode'),
                      onPressed: () async {
                        final status = await AirplaneModeChecker.checkAirplaneMode();
                        if (status == AirplaneModeStatus.on) {
                          showLongToast('AIRPLANE MODE IS ON');
                          print('ON');
                          showLongToast2('TURN OFF AIRPLANE MODE TO USE INTERNET');
                        } else {
                          showLongToast('AIRPLANE MODE IS OFF');
                          print('OFF');
                        }
                      },
                    )
                  ],
                ),

                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Check Connectivity",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'con_check');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),


                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "WiFi",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'wifi');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),

                    )
                ),

                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Mobile Data",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'mobiledata');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),

                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Airplane Mode",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'airplane');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Save a Contact",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',

                        ),
                      ),
                      onPressed: () => _askPermissions('add'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xffD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),

                    )
                ),


                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Make a Phone Call",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'phone');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 30.0,),

                Container(
                  child: ElevatedButton(
                    child: Text(
                      "WhatsApp Video / Voice Call",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Mon',

                      ),
                    ),
                    onPressed: () => _askPermissions('nativeContactPicker'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(140.0,60.0),
                      primary: Color(0xFFD8A7B1),
                      onPrimary: Color(0XFFFFFFFF),
                      shadowColor: Colors.black,
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Adjust ringtone volume",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,'ringtonevolume');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Open YouTube",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',
                        ),
                      ),
                      onPressed: () => setState(() {
                        _launched = _launchInWebViewOrVC(toLaunch);
                      }),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 30.0,),

                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Open Play Store",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',
                        ),
                      ),
                      //onPressed: _launchURL,
                      onPressed: () {
                        Navigator.pushNamed(context,'playstore');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),

                SizedBox(height: 30.0,),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Increase font size",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Mon',

                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context,'fontSize');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(140.0,60.0),
                      primary: Color(0xFFD8A7B1),
                      onPrimary: Color(0XFFFFFFFF),
                      shadowColor: Colors.black,
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.0,),
                Container(
                    child: ElevatedButton(
                      child: Text(
                        "Bluetooth",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Mon',

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,'bluetooth');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140.0,60.0),
                        primary: Color(0xFFD8A7B1),
                        onPrimary: Color(0XFFFFFFFF),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// _launchURL() async {
//   const url = 'https://play.google.com/store/apps';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

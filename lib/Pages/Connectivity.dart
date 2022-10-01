import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';


class Con extends StatefulWidget {

  @override
  _ConState createState() => _ConState();
}

class _ConState extends State<Con> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late String yes;
  @override
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


  @override
  Widget build(BuildContext context) {
    if(_connectionStatus.toString() == "ConnectivityResult.mobile"){

      yes = "YOU ARE CONNECTED TO THE INTERNET THROUGH MOBILE DATA";
    }
    else if(_connectionStatus.toString() ==  "ConnectivityResult.wifi"){
        yes = "YOU ARE CONNECTED TO THE INTERNET THROUGH WIFI";
    }
    else{

      yes = "YOU ARE NOT CONNECTED TO THE INTERNET. CHOOSE FROM ONE OF THE THE FOLLOWING OPTIONS TO CONNECT TO THE INTERNET.";
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffCBCDE7),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.wifi,
              ),
            )
          ],
          backgroundColor: Color(0xff7283B3),
          elevation: 50.0,
        ),
        body: Column(
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
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 10.0, 0.0),
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
      ),
    );
  }
}

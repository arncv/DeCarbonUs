import 'package:we_project/pages/ContactPicker.dart';
import 'package:we_project/pages/bluetooth.dart';
import 'package:we_project/pages/connectivity.dart';
import 'package:we_project/pages/fontSize.dart';
import 'package:we_project/pages/playstore.dart';
import 'package:we_project/pages/video_call.dart';
import 'package:we_project/pages/voice_call.dart';
import 'package:we_project/splash.dart';
import 'package:flutter/material.dart';
import 'package:we_project/pages/questions.dart';
import 'package:we_project/pages/wifi.dart';
import 'package:we_project/pages/airplane.dart';
import 'package:we_project/pages/mobiledata.dart';
import 'package:we_project/pages/ringtonevolume.dart';
import 'package:we_project/pages/instructions.dart';
import 'package:we_project/pages/call.dart';
import 'contact_list_page.dart';
import 'package:airplane_mode_checker/airplane_mode_checker.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {
      'home': (context) => Splash(),
      'instructions': (context) => Instructions(),
      'question' : (context) => Questions(),
      'wifi' : (context) => Wifi(),
      'airplane' : (context) => AirplaneMode(),
      'mobiledata' : (context) => MobileData(),
      'ringtonevolume' : (context) => RingtoneVolume(),
      'add': (context) => AddContactPage(),
      'phone': (context) => PhoneCall(),
      'fontSize' : (context) => FontSize(),
      'playstore' : (context) => PlayStore(),
      'nativeContactPicker' : (context) => MainWidget(),
      'voice_call': (context) => VoiceCall(),
      'video_call': (context) => VideoCall(),
      'con_check': (context) => Con(),
      'bluetooth': (context) => Bluetooth(),
    },
  ));
}


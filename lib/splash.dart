import 'package:flutter/material.dart';
import 'package:we_project/pages/home.dart';
import 'dart:async';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => WeProject()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/ezgif.com-gif-maker (1).gif'),
        fit: BoxFit.cover,
      )
    );
  }
}

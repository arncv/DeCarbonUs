import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCall createState() => _VideoCall();
}

class _VideoCall extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffCBCDE7),
        appBar: AppBar(
          backgroundColor: Color(0xff7283B3),
          elevation: 50.0,
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.phone,
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/video_Call.gif'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}

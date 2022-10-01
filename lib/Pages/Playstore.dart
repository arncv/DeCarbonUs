import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayStore extends StatefulWidget {
  @override
  _PlayStore createState() => _PlayStore();
}

class _PlayStore extends State<PlayStore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffCBCDE7),
        appBar: AppBar(
          backgroundColor: Color(0xff7283B3),
          elevation: 50.0,
        ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Step1- Search for the app you want \n            to install and click on \n            "Install."  ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Mon',

                    ),
                  ),
                )
              ],
            ),


            Row(
              children: [
                Expanded(
            child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/appDownload.gif',
                    width: 1000.0,
                    height: 400.0,
                  ),
                 ),
                ),
              ],
            ),


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 55.0, 0.0, 30.0),
                  child: Text(
                    'Step2- Click on the green button \n              to open the app',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Mon',

                    ),
                  ),
                )
              ],
            ),


            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/appDownload2.jpg',
                    width: 1000.0,
                    height: 400.0,
                  ),
                )
              ],
            ),



            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 20.0, 10.0, 10.0),
                  child: Container(
                      child: ElevatedButton(
                        child: Text(
                          "Got it!",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Mon',

                          ),
                        ),
                        onPressed: _launchURL,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(240.0,60.0),
                          primary: Color(0xFF07224C),
                          onPrimary: Color(0XFFFFFFFF),
                          shadowColor: Colors.grey[100],
                          elevation: 50.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      )
                  ),
                ),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://play.google.com/store/apps';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

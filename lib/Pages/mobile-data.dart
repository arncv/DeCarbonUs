import 'package:flutter/material.dart';
//import 'package:open_settings/open_settings.dart';
import 'package:app_settings/app_settings.dart';

class MobileData extends StatefulWidget {
  @override
  _MobileData createState() => _MobileData();
}

class _MobileData extends State<MobileData> {
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
                Icons.signal_cellular_alt_rounded,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/ezgif.com-gif-maker (14).gif',
                    width: 450.0,
                    height: 70.0,
                  ),
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 50.0, 0.0, 20.0),
                  child: Text(
                    ' Press the toggle button \n     on the next screen\n         as shown here!!',
                    style: TextStyle(
                      fontSize: 27.0,
                      fontFamily: 'Mon',

                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage('assets/OnOff.jpg'),
                    width: 400.0,
                    height: 150.0,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(95.0, 145.0, 10.0, 0.0),
                  child: Container(
                      child: ElevatedButton(
                        child: Text(
                          "Got it!",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Mon',

                          ),
                        ),
                        onPressed: () {
                          AppSettings.openDataRoamingSettings();
                        },
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

class RingtoneVolume extends StatefulWidget {
  @override
  _RingtoneVolume createState() => _RingtoneVolume();
}

class _RingtoneVolume extends State<RingtoneVolume> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffCBCDE7),
        appBar: AppBar(
          backgroundColor: Color(0xff7283B3),
          elevation: 50.0,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 35.0, 0.0, 25.0),
                  child: Text(
                    '        Drag the slider\n    to adjust the volume\n      of your ringtone!!',
                    style: TextStyle(
                      fontSize: 27.0,
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
                    'assets/ezgif.com-gif-maker (18).gif',
                    width: 450.0,
                    height: 80.0,
                  ),
                )
              ],
            ),



            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(95.0, 190.0, 10.0, 0.0),
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
                          OpenSettings.openSoundSetting();
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

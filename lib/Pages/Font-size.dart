import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

class FontSize extends StatefulWidget {
  @override
  _FontSize createState() => _FontSize();
}

class _FontSize extends State<FontSize> {
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
                  padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 20.0),
                  child: Text(
                    '    Step1- Click on "Font size" \n                 option',
                    style: TextStyle(
                      fontSize: 23.0,
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
                    'assets/fontsizeOpt.jpeg',
                    width: 450.0,
                    height: 70.0,
                  ),
                )
              ],
            ),


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 55.0, 0.0, 30.0),
                  child: Text(
                    '    Step2- Drag the slider right \n               to increase font size',
                    style: TextStyle(
                      fontSize: 23.0,
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
                    'assets/fontgif.gif',
                    width: 520.0,
                    height: 120.0,
                  ),
                )
              ],
            ),



            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 70.0, 10.0, 0.0),
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
                          OpenSettings.openDisplaySetting();
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

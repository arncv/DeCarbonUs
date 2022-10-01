import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

class Bluetooth extends StatefulWidget {
  @override
  _Bluetooth createState() => _Bluetooth();
}

class _Bluetooth extends State<Bluetooth> {
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
                      padding: const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 70.0),
                      child: Text(
                        ' Press the toggle button \n     on the next screen\n         as shown here!!',
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
                        'assets/bluetoothgif.gif',
                        width: 450.0,
                        height: 80.0,
                      ),
                    )
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      child: Expanded(
                        child: Image(
                          image: AssetImage('assets/OnOff.jpg'),
                          width: 400.0,
                          height: 150.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(95.0, 60.0, 10.0, 0.0),
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
                              OpenSettings.openBluetoothSetting();
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
          )
      ),
    );
  }
}

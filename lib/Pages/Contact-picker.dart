import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';


class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();

}

class _MainWidgetState extends State<MainWidget> {

  late String num1;
  String? _contact;

  @override
  Widget build(BuildContext context) => SafeArea(
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
      body: Column(
        children: kIsWeb && !FlutterContactPicker.available
            ? [_buildError(context)]
            : _buildChildren(context),
      ),
    ),
  );

  Widget _buildError(BuildContext context) {
    return RichText(
      text: TextSpan(
          text:
          'Your browser does not support contact pickers for more information see: ',
          children: [
            TextSpan(
                text: 'https://web.dev/contact-picker/',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launch('https://web.dev/contact-picker/')),
            TextSpan(text: ' and '),
            TextSpan(
                text:
                'https://developer.mozilla.org/en-US/docs/Web/API/Contact_Picker_API#Browser_compatibility/',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launch(
                      'https://developer.mozilla.org/en-US/docs/Web/API/Contact_Picker_API#Browser_compatibility'))
          ]),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return <Widget>[
      /*if (_phoneContact != null)
        Column(
          children: <Widget>[
            const Text("Phone contact:"),
            Text("Name: ${_phoneContact!.fullName}"),
            Text(
                "Phone: ${_phoneContact!.phoneNumber!.number} (${_phoneContact!.phoneNumber!.label})")
          ],
        ),

      if (_contact != null) Text(_contact!),
      ElevatedButton(
        child: const Text("pick phone contact"),
        onPressed: () async {
          final PhoneContact contact =
          await FlutterContactPicker.pickPhoneContact();
          print(contact);
          setState(() {
            _phoneContact = contact;
          });
        },
      ), */
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 50.0),
        child: Text(
          'Choose a Contact to Call',
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Mon',

          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(65.0, 0.0, 50.0, 0.0),
        child: ElevatedButton(
          child: const Text(
              "Pick a Contact",
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Mon',

            ),
          ),
          onPressed: () async {
            final FullContact contact =
            (await FlutterContactPicker.pickFullContact());
            setState(() {
              _contact = contact.toString();
              int x = _contact!.indexOf('+');
              //print(x);
              String half = _contact!.substring(x);
              //print(half);
              int y = half.indexOf('}');
              //print(y);
              num1 = _contact!.substring(x, x + y);
              num1.replaceAll(' ', '');
              //print(num1);

            });
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
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
        child: Text(
          'Choose One',
          style: TextStyle(
            fontSize: 27.0,
            fontFamily: 'Mon',

          ),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 40.0, 25.0, 0.0),
            child: ElevatedButton(
              child: Row(
                children: [
                  Text(
                    "Video Call ",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Mon',

                    ),
                  ),
                  Icon(
                    Icons.videocam,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'video_call');
                Future.delayed(Duration(seconds: 6), () {
                  FlutterLaunch.launchWhatsapp(
                      phone: num1, message: "");
                  Navigator.pop(context, 'nativeContactPicker');
                });
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(185.0,60.0),
                primary: Color(0xFF07224C),
                onPrimary: Color(0XFFFFFFFF),
                shadowColor: Colors.black,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: ElevatedButton(
              child:  Row(
                children: [
                  Text(
                    "Voice Call ",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Mon',

                    ),
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'voice_call');
                Future.delayed(Duration(seconds: 6), () {
                  FlutterLaunch.launchWhatsapp(
                      phone: num1, message: "");
                  Navigator.pop(context, 'nativeContactPicker');
                });

              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(180.0,60.0),
                primary: Color(0xFF07224C),
                onPrimary: Color(0XFFFFFFFF),
                shadowColor: Colors.black,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          )
        ],
      )

    ];
  }
}

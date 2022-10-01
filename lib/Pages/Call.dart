import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class PartTwo extends StatefulWidget {
  @override
  _PartTwoState createState() => _PartTwoState();
}

class _PartTwoState extends State<PartTwo> {


  String? _contact;


  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: kIsWeb && !FlutterContactPicker.available
          ? [_buildError(context)]
          : _buildChildren(context),
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
    ];
  }
}

class PhoneCall extends StatefulWidget {
  @override
  _PhoneCallState createState() => _PhoneCallState();
}

class _PhoneCallState extends State<PhoneCall> {

  String? _contact;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '+91');
  }

  Future<void>? _launched;
  String _phone = '';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 30.0),
                  child: Text(
                    'Choose a Contact To Call',
                    style: TextStyle(
                      fontSize: 27.0,
                      fontFamily: 'Mon',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 15.0, 20.0),
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
                        String num1 = _contact!.substring(x, x + y);
                        num1.replaceAll(' ', '');
                        //print(num1);
                        _launched = _makePhoneCall('tel:$num1');
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
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 30.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 27.0,
                      fontFamily: 'Mon',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.length != 13){
                        return 'Enter a valid Mobile Number';
                      }
                    },
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {
                        _phone = value;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter a 10-digit mobile number :)',
                      labelText: 'Enter Mobile Number',
                      labelStyle: TextStyle(
                        fontSize: 30.0,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Mon',
                      ),
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontFamily: 'Osw',
                      ),
                      counterStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[800],
                        fontFamily: 'Mon',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(290.0, 0.0, 0.0, 0.0),
                  child: new ElevatedButton(
                    onPressed: () {
                      _controller.clear();
                      _controller.text = '+91';
                    },
                    child: new Text(
                      'CLEAR',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Osw',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[600],
                      onPrimary: Color(0XFFFFFFFF),
                      shadowColor: Colors.black,
                      elevation: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate() ? setState(() {
                        _launched = _makePhoneCall('tel:$_phone');
                      }) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Invalid Entry!'),
                      ));
                    },
                    child: const Text(
                      'Call',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Mon',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(140.0,60.0),
                      primary: Color(0xFF07224C),
                      onPrimary: Color(0XFFFFFFFF),
                      shadowColor: Colors.black,
                      elevation: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                )

              ],
            )
          ),
        ),
      ),
    );
  }
}


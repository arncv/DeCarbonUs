import 'package:flutter/material.dart';
class WeProject extends StatefulWidget {

  @override
  _WeProjectState createState() => _WeProjectState();
}

class _WeProjectState extends State<WeProject> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff7283B3),
        body: Stack(
          children: [
            Positioned.fill(
              top: 22.0,
              child: Image(
                image: AssetImage('assets/finalTheme.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 22.0,
                left: 2.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 90.0,),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50.0, 25.0, 150.0, 0.0),
                            child: Text(
                              'ELDBUD',
                              style: TextStyle(
                                fontFamily: 'BB',
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Container(
                          child: SizedBox(width: 25.0,),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                            child: Text(
                              'TECH BUDDY FOR THE ELDERLY',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'BB',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 90.0,),

                    Row(
                      children: [
                        Container(
                          child: SizedBox(width: 75.0,),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
                              child: CircleAvatar(
                                radius: 130.0,
                                backgroundColor: Color(0xff4A3E32),
                                child: CircleAvatar(
                                  radius: 123.0,
                                  backgroundImage: AssetImage('assets/logo.jpg'),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 80.0,),
                    Row(
                      children: [
                        Container(
                          child: SizedBox(width: 255.0,),
                        ),
                        Container(
                            child: ElevatedButton(
                              child: Text(
                                "Let's Go!",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Mon',

                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, 'instructions');
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(140.0,60.0),
                                primary: Color(0xFF07224C),
                                onPrimary: Colors.white,
                                shadowColor: Colors.grey[800],
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

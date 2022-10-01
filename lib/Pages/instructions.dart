import 'package:flutter/material.dart';


class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff9E8AC6),
        body: Stack(
          children: [
          Positioned.fill(
          top: 22.0,
          child: Image(
            image: AssetImage('assets/in.jpg'),
            fit: BoxFit.cover,
          ),
        ),
            Positioned(
              top: 25.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                        child: Text(
                            'Welcome!',
                          style: TextStyle(
                            fontFamily: 'BB',
                            fontSize: 42.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                        child: Text(
                          'Hello, we hope you are having a fantastic day. \n \nStuck somewhere? Don\'t worry, '
                              'we got you❤\nWe will take you through a few easy steps to \nmanage whatever '
                              'troubled you. \n \n The instructions go as : \n\n'
                              '1. After pressing the View Questions button, \n    select whatever you are stuck at.\n\n'
                              '2. It will redirect you to a page that will explain \n    you to what to do.'
                              ' Just look at the one or two \n    instructions on that page carefully :).'
                              ' \n \n3. Press the Got it button once you have \n    understood'
                              '\n\nIt was easy, right? These things just act '
                              'nasty \nsometimes, just like your kids. Since, we can\'t be \nof any help there, we can hopefully help '
                              'you \nmanage one of the notorious things around you ;)',

                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(250.0, 40.0, 15.0, 0.0),
                    child: Row(
                      children: [
                        Container(
                            child: ElevatedButton(
                              child: Text(
                                "    View \nQuestions",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Mon',

                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, 'question');
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
                    ),
                  )
                ],
              ),
            )
        ],
      ),
      ),
    );
  }
}

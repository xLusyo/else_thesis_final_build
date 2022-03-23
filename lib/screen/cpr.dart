import 'dart:isolate';

import 'package:else_thesis_final_build/backend/accelo.dart';
import 'package:else_thesis_final_build/backend/bpm.dart';
import 'package:else_thesis_final_build/backend/location.dart';
import 'package:else_thesis_final_build/backend/sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CPRScreen extends StatefulWidget {
  const CPRScreen({Key? key}) : super(key: key);

  @override
  _CPRScreenState createState() => _CPRScreenState();
}

class _CPRScreenState extends State<CPRScreen> {
  double x = 0.00;
  double y = 0.00;
  double z = 0.00;
  bool _buttonIsPressed = false;

  Accelo acc = Accelo();
  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  void prompt() async {
    sendMessage('success');
    while (_buttonIsPressed) {
      await Future.delayed(const Duration(seconds: 5));

      acc.validateUserAccelo(z);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA61414),
        title: Text(
          'CPR',
          style: GoogleFonts.righteous(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 350),
                  height: 559.2,
                  width: 463,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset('assets/images/cpr.gif'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 450),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      if (_buttonIsPressed == false) {
                        sendMessage('success');
                        prompt();
                        setState(() {
                          _buttonIsPressed = true;
                        });
                      } else {
                        setState(() {
                          _buttonIsPressed = false;
                        });
                        prompt();
                      }
                    },
                    child: Text(
                      _buttonIsPressed ? 'Stop CPR' : 'Start CPR',
                      style: GoogleFonts.righteous(
                        color: const Color(0xffa61414),
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25, right: 280),
                  height: 80,
                  child: SvgPicture.asset('assets/images/speak.svg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void sendMessage(String message) async {
  DataBPM xyz = DataBPM();
  UserLocation data = UserLocation();
  SMS sms = SMS();
  int? _bpm = xyz.bpm;
  String address = await data.getAddress();
  List numbers = await data.locationDataAndSMS();
  String message = 'Emergency' +
      '\n\n' +
      'BPM: ' +
      _bpm.toString() +
      '\nLocation:' +
      address;
  for (int i = 0; i < numbers.length; i++) {
    await sms.sendSMS(message, numbers[i]);
  }
  print(message);
}

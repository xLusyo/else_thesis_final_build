import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telephony/telephony.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text('eLse', style: GoogleFonts.righteous(fontSize: 30)),
        backgroundColor: const Color(0xffA61414),
      ),
      backgroundColor: const Color(0xffA61414),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text('Emergency?',
                  style:
                      GoogleFonts.righteous(color: Colors.white, fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('Press Button',
                  style:
                      GoogleFonts.righteous(color: Colors.white, fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 90),
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: FlatButton(
                onPressed: () async {
                  final Telephony telephony = Telephony.instance;

                  bool serviceEnabled;
                  LocationPermission permission;
                  serviceEnabled = await Geolocator.isLocationServiceEnabled();
                  permission = await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                  }

                  bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
                  Navigator.pushNamed(context, '/pulse');
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Center(
                  child: Image.asset( 
                    'assets/images/red.png',
                    height: 600,
                    width: 600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/images/home.svg"),
                height: 45,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/images/cu.svg"),
                height: 45,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/images/about.svg"),
                height: 45,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/images/faq.svg"),
                height: 45,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

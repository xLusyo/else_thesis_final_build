import 'package:else_thesis_final_build/backend/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpUI extends StatefulWidget {
  const SignUpUI({Key? key}) : super(key: key);

  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context); //TODO TO BE USE
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA61414),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffA61414),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 210, top: 20),
            child: Text('Sign up for a',
                style:
                    GoogleFonts.righteous(color: Colors.white, fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 210, top: 5),
            child: Text('new account.',
                style:
                    GoogleFonts.righteous(color: Colors.white, fontSize: 28)),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 90),
                child: Text('We need some of your information',
                    style: GoogleFonts.righteous(
                        color: Colors.white.withOpacity(.8), fontSize: 18)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: height - 229,
                width: width + 71,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, right: 30, left: 30, bottom: 10),
                      child: TextField(
                        controller: name,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: 'Name',
                          hintStyle: GoogleFonts.righteous(
                              color: const Color(0xffA61414)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 30,
                        left: 30,
                      ),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.righteous(
                              color: const Color(0xffA61414)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 30,
                        left: 30,
                      ),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.righteous(
                              color: const Color(0xffA61414)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 30,
                        left: 30,
                      ),
                      child: TextField(
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: 'Confirm Password',
                          hintStyle: GoogleFonts.righteous(
                              color: const Color(0xffA61414)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () async {
                          await auth.registerWithEmailAndPassword(
                              email.text, password.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Submit',
                          style: GoogleFonts.righteous(
                              color: const Color(0xffA61414), fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

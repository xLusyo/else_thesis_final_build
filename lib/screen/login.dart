import 'package:else_thesis_final_build/backend/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogInUI extends StatefulWidget {
  const LogInUI({Key? key}) : super(key: key);

  @override
  _LogInUIState createState() => _LogInUIState();
}

class _LogInUIState extends State<LogInUI> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final auth = Provider.of<Auth>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffA61414),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(50),
            height: height / 3.8,
            width: width / 1.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/red.png',
                height: height / 1.2 - 32.5,
                width: width + 208,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: height / 2,
            width: width - 27,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Email',
                      labelStyle:
                          GoogleFonts.righteous(color: const Color(0xffA61414)),
                      icon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Password',
                      labelStyle:
                          GoogleFonts.righteous(color: const Color(0xffA61414)),
                      icon: const Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    'Forgot Password?',
                    style:
                        GoogleFonts.righteous(color: const Color(0xffA61414)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xffA61414),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        auth.signWithEmailAndPassword(
                            email.text, password.text);
                      }
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.righteous(
                          color: Colors.white.withOpacity(.8), fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 0.1, left: 200),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                        //TODO: SignUp Function
                      },
                      child: Text(
                        'Sign me up',
                        style: GoogleFonts.righteous(
                            color: const Color(0xffA61414)),
                      ),
                    )),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.1, left: 75),
                      child: TextButton(
                        onPressed: () {},
                        child: SvgPicture.asset(
                            'assets/images/icons8-facebook.svg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.1, right: 75),
                      child: TextButton(
                        onPressed: () {},
                        child: SvgPicture.asset('assets/images/gmail.svg'),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

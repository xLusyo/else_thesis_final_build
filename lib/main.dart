import 'package:else_thesis_final_build/backend/wrapper.dart';
import 'package:else_thesis_final_build/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'backend/auth.dart';
import 'screen/cpr.dart';
import 'screen/login.dart';
import 'screen/notify.dart';
import 'screen/pulse.dart';
import 'screen/signin.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<Auth>(create: (_) => Auth())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/login': (context) => const LogInUI(),
          '/home' : (context) => const HomeUI(),
          '/signup': (context) => const SignUpUI(),
          '/pulse': (context) => const PulseRate(),
          '/notify':(context) =>  NotifyUI(),
          '/cpr': (context) => const CPRScreen(),
          
        },
      ),
    );
  }
}




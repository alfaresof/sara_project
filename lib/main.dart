import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/view/edit_info.dart';
import 'package:sara_project/features/auth/view/sign_in.dart';
import 'package:sara_project/features/auth/view/sign_up.dart';
import 'package:sara_project/features/exam/view/about_personality.dart';
import 'package:sara_project/features/exam/view/exam_page.dart';
import 'package:sara_project/features/exam/view/home.dart';
import 'package:sara_project/features/exam/view/result.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignIn(),
        '/about': (context) => const About(),
        '/edit': (context) => const EditInfo(),
        '/sign_up': (context) => const SignUp(),
        '/home': (context) => const Home(),
        '/exam': (context) => const ExamPage(),
        '/result': (context) => const Result(),
      },
    );
  }
}

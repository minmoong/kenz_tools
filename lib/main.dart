import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home/home.dart';

void main() {
  runApp(const MyApp());
  final recognizedTextList = [
    "petition",
    "O",
    "tragedy",
    "prejudice",
    "flaw",
    "Crisis",
    "exclusive",
    "evacuate",
    "apparent",
    "",
    "on Strike",
    "have struggled",
    "with",
    "bragged akont",
    "Contestant",
    "help onself to",
    "habitat",
    "medication",
    "instruction",
    "legislation",
    "Stubborn",
    "Conducting",
    "accumulate",
    "immune",
    "of ones choice",
    "resign",
    "beat around",
    "the bush",
    "tution fees",
    "from within",
    "appoint",
    "Massike",
    "o Squeeze",
    "erupt",
    "dozente",
    "emissions",
    "time off",
    "Specimens",
    "exhaust",
    "O",
    "real estate",
    "patents",
    "O",
    "unsettled",
    "regulute",
    "correction",
    "deforestation",
    "recession",
    "know A by heart",
    "Pop quizzes",
  ];
  print(recognizedTextList);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '켄즈 툴즈',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansNKoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Home(),
    );
  }
}

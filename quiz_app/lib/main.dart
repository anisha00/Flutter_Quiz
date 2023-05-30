import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/QuestionEntry.dart';
import 'package:quiz_app/QuizProvider.dart';
import 'package:quiz_app/QuizScreenCard.dart';
import 'package:quiz_app/questionHome.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => QuizProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuestionEntry(),
    );
  }
}




     // This trailing comma makes auto-formatting nicer for build methods.
   
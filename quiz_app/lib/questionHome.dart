import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionEntry.dart';
import 'package:quiz_app/QuizProvider.dart';

import 'package:quiz_app/QuizScreenCard.dart';
import 'package:provider/src/provider.dart';

class QuestionHome extends StatefulWidget {
  QuestionHome({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionHome> createState() => _QuestionHomeState();
}

class _QuestionHomeState extends State<QuestionHome> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'quiz.jpg',
              width: 80,
            ),
            Center(
              child: Text(
                'Lets play',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple.shade600),
              ),
            )
          ],
        ),
        shadowColor: Colors.purple,
      ),
      body: quizProvider.quiz.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Question 1/20",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  QuizScreenCard(
                    quiz: quizProvider.quiz[index],
                  ),
                ],
              ),
            ),
      bottomNavigationBar: InkWell(
        onTap: () {
          index++;
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.purple.shade600,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            'Next',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

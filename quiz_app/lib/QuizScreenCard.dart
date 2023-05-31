import 'package:flutter/material.dart';
import 'package:quiz_app/AnswerUi.dart';
import 'package:quiz_app/Quiz.dart';

class QuizScreenCard extends StatefulWidget {
  Quiz quiz;
  QuizScreenCard({Key? key, required this.quiz}) : super(key: key);

  @override
  State<QuizScreenCard> createState() => _QuizScreenCardState();
}

class _QuizScreenCardState extends State<QuizScreenCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(widget.quiz.question,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.purple.shade600)),
        AnswerUI(quiz: widget.quiz)
      ]),
    );
  }
}

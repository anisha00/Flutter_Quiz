import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';

class QuizScreenCard extends StatefulWidget {
  Quiz quiz;
  QuizScreenCard({Key? key, required this.quiz}) : super(key: key);

  @override
  State<QuizScreenCard> createState() => _QuizScreenCardState();
}

class _QuizScreenCardState extends State<QuizScreenCard> {
  String _answer = '';
  String ans = '';

  List<String> _answers = [];
  @override
  initState() {
    onCreateAnswers();
  }

  onCreateAnswers() {
    _answers = widget.quiz.incorrectAnswers;
    _answers.add(widget.quiz.correctAnswer);
    _answers.shuffle();

    setState(() {});
  }

  Color getColors(String ans) {
    if (_answer != '') {
      if (ans == widget.quiz.correctAnswer) {
        return Colors.green;
      } else {
        if (ans == widget.quiz.correctAnswer) {
          return Colors.green;
        }
        return Colors.red;
      }
    }
    return Colors.purple.shade600;
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(widget.quiz.question,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.purple.shade600)),
        ..._answers.map(
          (e) => InkWell(
            onTap: () {
              _answer = e;
              setState(() {});
            },
            child: Container(
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.only(top: 12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: getColors(e),
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: Colors.purple.shade600, width: 2)),
                child: Center(
                    child: Text(
                  e,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ))),
          ),
        ),
      ]),
    );
  }
}

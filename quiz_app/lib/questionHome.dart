import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionEntry.dart';
import 'package:quiz_app/QuizCompletionUI.dart';
import 'package:quiz_app/QuizProvider.dart';
import 'package:quiz_app/QuizScreenCard.dart';
import 'package:provider/src/provider.dart';
import 'package:quiz_app/global.dart';

class QuestionHome extends StatefulWidget {
  QuestionHome({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionHome> createState() => _QuestionHomeState();
}

int index = 0;
Widget getAppState(QuizProvider quizProvider) {
  print(quizProvider.app_state);
  if (quizProvider.app_state == App_State.SUCCESS) {
    print('succes');
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Question ${index + 1}/${quizProvider.quiz.length}",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          ...quizProvider.quiz.map((e) {
            int idx = quizProvider.quiz.indexOf(e);
            if (idx == index) {
              return QuizScreenCard(
                quiz: e,
              );
            } else {
              return SizedBox();
            }
          }),
        ],
      ),
    );
  } else if (quizProvider.app_state == App_State.IS_LOADING) {
    return Center(child: CircularProgressIndicator());
  } else {
    return Center(child: Text('Error on Loading'));
  }
}

class _QuestionHomeState extends State<QuestionHome> {
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
      body: getAppState(quizProvider),
      bottomNavigationBar: quizProvider.app_state == App_State.SUCCESS
          ? InkWell(
              onTap: () {
                if (index == quizProvider.quiz.length - 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuizCompletionUI()));
                } else {
                  index++;
                  setState(() {});
                }
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
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ))
          : SizedBox.shrink(),
    );
  }
}

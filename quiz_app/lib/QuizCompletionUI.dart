import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/QuestionEntry.dart';

import 'QuizProvider.dart';

class QuizCompletionUI extends StatelessWidget {
  QuizCompletionUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    return Scaffold(
        body: SafeArea(
            top: true,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://as2.ftcdn.net/v2/jpg/01/61/82/55/1000_F_161825542_Ht1BwVZKrukJLpyTCDzekw6RszGH5LrC.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade100),
                    child: Text(
                      quizProvider.correct.toString(),
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.green),
                    ),
                  ),
                  Text(
                    "You Have Completed Your Quiz",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.green),
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => QuestionEntry()))
                          },
                      child: Text("Back To Home"))
                ],
              ),
            )));
  }
}

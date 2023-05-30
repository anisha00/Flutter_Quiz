import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/QuizProvider.dart';
import 'package:quiz_app/QuizScreenCard.dart';
import 'package:quiz_app/questionHome.dart';

class QuestionEntry extends StatefulWidget {
  const QuestionEntry({super.key});

  @override
  State<QuestionEntry> createState() => _QuestionEntryState();
}

class _QuestionEntryState extends State<QuestionEntry> {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: true);
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
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Center(
                child: Text("Select QUIZ Level",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.purple.shade600)),
              ),
              InkWell(
                onTap: () {
                  quizProvider.setLevel('easy');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: quizProvider.level == 'easy'
                            ? Colors.purple.shade600
                            : Colors.white,
                        border: Border.all(
                          color: Colors.purple.shade600,
                          width: 2,
                        )),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Easy",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: quizProvider.level == 'easy'
                                ? Colors.white
                                : Colors.purple.shade600),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  quizProvider.setLevel('medium');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: quizProvider.level == 'medium'
                            ? Colors.purple.shade600
                            : Colors.white,
                        border: Border.all(
                          color: Colors.purple.shade600,
                          width: 2,
                        )),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Medium",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: quizProvider.level == 'medium'
                                ? Colors.white
                                : Colors.purple.shade600),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  quizProvider.setLevel('hard');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: quizProvider.level == 'hard'
                            ? Colors.purple.shade600
                            : Colors.white,
                        border: Border.all(
                          color: Colors.purple.shade600,
                          width: 2,
                        )),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Hard",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: quizProvider.level == 'hard'
                                ? Colors.white
                                : Colors.purple.shade600),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text("Select category",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.purple.shade600)),
              ),
              ...['Sports', 'Animals', 'Arts', 'Policits'].map(
                (e) => InkWell(
                  onTap: () {
                    quizProvider.setCategory(e.toLowerCase());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: quizProvider.category == e.toLowerCase()
                                ? Colors.purple.shade600
                                : Colors.white,
                            border: Border.all(
                              color: Colors.purple.shade600,
                              width: 2,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: Text(e,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: quizProvider.category == e.toLowerCase()
                                    ? Colors.white
                                    : Colors.purple.shade600,
                              )),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (quizProvider.level != '' && quizProvider.category != '') {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuestionHome(),
            ));
          }
        },
        child: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: (quizProvider.level == '')
                  ? Colors.grey.shade400
                  : (quizProvider.category == ''
                      ? Colors.grey.shade400
                      : Colors.purple.shade600),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            'Play',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

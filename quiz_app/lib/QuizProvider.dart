import 'package:flutter/widgets.dart';
import 'package:quiz_app/Quiz.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class QuizProvider with ChangeNotifier {
  QuizProvider() {
    onGetQuiz();
  }
  String _level = '';
  List<Quiz> _quiz = [];

  List<Quiz> get quiz => _quiz;
  String get level => _level;

  setLevel(String value) {
    _level = value;
    notifyListeners();
  }

  String _category = '';
  String get category => _category;

  setCategory(String value) {
    _category = value;
    notifyListeners();
    print(category);
  }

  onSuccess() {
    notifyListeners();
    print("object");
  }

  onGetQuiz() async {
    try {
      var url = Uri.https('opentdb.com', '/api.php', {
        'amount': '10',
        'category': '21',
        'difficulty': 'medium',
        'type': 'multiple'
      });
/**/
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        jsonResponse['results']
            .forEach((value) => {_quiz.add(Quiz.fromJson(value))});
        onSuccess();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
  }
}

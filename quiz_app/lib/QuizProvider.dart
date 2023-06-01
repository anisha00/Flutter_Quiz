import 'package:flutter/widgets.dart';
import 'package:quiz_app/Quiz.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:quiz_app/global.dart';

class QuizProvider with ChangeNotifier {
  App_State _app_state = App_State.IDEAL;
  App_State get app_state => _app_state;
  int _correct = 0;
  int get correct => _correct;
  setCorrect() {
    _correct++;
    notifyListeners();
  }

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
  }

  onSuccess() {
    _app_state = App_State.SUCCESS;
    notifyListeners();
  }

  onGetQuiz() async {
    try {
      _app_state = App_State.IS_LOADING;
      notifyListeners();
      var url = Uri.https('opentdb.com', '/api.php', {
        'amount': '20',
        'category': '32',
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
        _app_state == App_State.ERROR;
        notifyListeners();
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      _app_state == App_State.ERROR;
      notifyListeners();
      print(e);
    }
  }
}

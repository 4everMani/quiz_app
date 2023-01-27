import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/question.dart';

class QuizRepository {
  final String topic;
  QuizRepository(this.topic);
  Future<List<Question>> fetchQuestions() async {
    var url =
        'https://quiz-app-2fb27-default-rtdb.asia-southeast1.firebasedatabase.app/${topic.replaceAll(' ', '')}.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var output = jsonDecode(response.body);
        List<Question> questionList = [];
        for (var que in output) {
          List<String> options = [];
          for (var opt in que['options']) {
            options.add(opt);
          }
          var quest = Question(que['question'], options, que['correctAnswer']);
          questionList.add(quest);
        }
        return questionList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      rethrow;
    }
  }
}

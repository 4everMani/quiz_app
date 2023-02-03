import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/score.dart';
import 'package:quiz_app/widgets/quiz/result.dart';

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

  Future<bool> submitQuiz(Score data) async {
    const url =
        'https://quiz-app-2fb27-default-rtdb.asia-southeast1.firebasedatabase.app/results.json';
    final body = {
      'questionAttempted': data.questionAttempted,
      'correctAnswer': data.correctAnswer,
      'totalScore': data.totalScore,
      'email': data.email,
      'topic': data.topic,
      'submittedAt': data.submittedAt.toIso8601String()
    };
    final response = await http.post(Uri.parse(url), body: jsonEncode(body));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception({
        'message': response.reasonPhrase,
        'status code': response.statusCode
      });
    }
  }
}

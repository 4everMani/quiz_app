import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/score.dart';

class ResultRepository {
  /// fetching user result
  Future<List<Score>> getResults(String email) async {
    final url =
        'https://quiz-app-2fb27-default-rtdb.asia-southeast1.firebasedatabase.app/results.json?orderBy="email"&equalTo="${email}"';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final output = jsonDecode(response.body);
      final scores = <Score>[];
      output.forEach((key, value) {
        var score = Score(
            value['questionAttempted'],
            value['correctAnswer'],
            value['totalScore'],
            value['email'],
            value['topic'],
            DateTime.parse(value['submittedAt']));
        scores.add(score);
      });
      scores.forEach((element) {
        print(element.email);
      });
      return scores;
    } else {
      throw Exception({
        'message': response.reasonPhrase,
        'status code': response.statusCode
      });
    }
  }
}

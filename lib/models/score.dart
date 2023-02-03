import 'dart:ffi';

class Score {
  int questionAttempted;
  int correctAnswer;
  double totalScore;
  String email;
  String topic;
  DateTime submittedAt;

  Score(this.questionAttempted, this.correctAnswer, this.totalScore, this.email,
      this.topic, this.submittedAt);
}

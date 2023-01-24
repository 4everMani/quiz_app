enum OptionCode { A, B, C, D }

class Question {
  String question;
  List<String> options;
  String correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

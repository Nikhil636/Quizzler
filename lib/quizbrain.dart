import 'Questions.dart';

class QuizBrain {
  int qno = 0;
  List<Question> questionbank = [
    Question('Matches were invented before lighters.', false),
    Question('The liver is the largest organ in the human body', false),
    Question('Apples have more than 30,000 varities', true),
    Question('A human body blood vessels can circle the Earth', true),
    Question(' Athlete Usain Bolt is faster than a cheetah', false),
    Question('Human teeth are just as strong as mature shark teeth', true),
    Question('Iron is the most abundant metal in Earth’s crust', false),
    Question('Earth’s oldest known rock is about 4 billion years old.', true),
    Question('An elephant has 100 muscles in its trunk.', false),
    Question('Water is the most common element on Earth.', false),
  ];
  void nxt() {
    if (qno < questionbank.length - 1) {
      qno++;
    }
  }
  String getqt() {
    return questionbank[qno].questionText;
  }

  bool getca() {
    return questionbank[qno].questionAnswer;
  }

  bool isFinished() {
    if (qno >= questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    qno = 0;
  }
}

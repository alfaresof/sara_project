import 'package:sara_project/features/exam/models/question.dart';

class ExamState {
  final List<int> scoreList;
  final int questionNum;
  final int numbering;
  final int score;
  final List<bool> isLock;
  final List<Question> questionGroup;
  final int result;
  final int choosen;

  ExamState(
      {required this.questionGroup,
      required this.numbering,
      required this.scoreList,
      required this.questionNum,
      required this.score,
      required this.isLock,
      required this.result,
      required this.choosen});

  factory ExamState.Initial() {
    return ExamState(
        numbering: 1,
        scoreList: [],
        questionNum: 0,
        score: 0,
        result: 0,
        choosen: 0,
        isLock: [false, false, false, false, false],
        questionGroup: [
          Question(q: '1- I usually play...', i: 'images/q1.png'),
          Question(q: '2- When I usually go to school...', i: 'images/q2.png'),
          Question(q: '3- When I see birds flying...', i: 'images/q3.png'),
          Question(q: '4- I usually do my housework...', i: 'images/q4.png'),
          Question(q: '5- When Someone needs thing...', i: 'images/q5.png'),
          Question(q: '6- While others have fun...', i: 'images/q6.png'),
          Question(q: '7- When things go wrong...', i: 'images/q7.png'),
          Question(q: '8- On a trip, I like...', i: 'images/q8.png'),
          Question(q: '9- In my room...', i: 'images/q9.png'),
          Question(q: '10- When I\'m able to help ...', i: 'images/q10.png'),
          Question(q: '11- When someone is joking...', i: 'images/q11.png'),
          Question(q: '12- Usually...', i: 'images/q12.png'),
          Question(q: '13- New and difficult things...', i: 'images/q13.png'),
          Question(q: '14- When I get money...', i: 'images/q14.png'),
          Question(q: '15- When I have a new toy...', i: 'images/q15.png'),
        ]);
  }

  ExamState copyWith(
      {List<int>? scoreList,
      int? questionNum,
      int? numbering,
      int? score,
      List<bool>? isLock,
      List<Question>? questionGroup,
      int? result,
      int? choosen}) {
    return ExamState(
      numbering: numbering ?? this.numbering,
      scoreList: scoreList ?? this.scoreList,
      questionNum: questionNum ?? this.questionNum,
      score: score ?? this.score,
      isLock: isLock ?? this.isLock,
      result: result ?? this.result,
      questionGroup: questionGroup ?? this.questionGroup,
      choosen: choosen ?? this.choosen,
    );
  }
}

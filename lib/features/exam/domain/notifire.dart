import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/exam/domain/state.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

final ExamProvider = StateNotifierProvider<ExamNotifier, ExamState>((ref) {
  return ExamNotifier();
});

class ExamNotifier extends StateNotifier<ExamState> {
  ExamNotifier() : super(ExamState.Initial());

  void setInit() {
    state = ExamState.Initial();
  }

  void setBottomBar(int ind) {
    state = state.copyWith(
        choosen: ind
    );
  }

  void setTrue(int chosen) {
    for (int i = 0; i < state.isLock.length; i++) {
      state.isLock[i] = i == chosen;
    }
    state = state.copyWith(
      isLock: state.isLock,
    );
  }

  void setScore(int chosen) {
    var n = state.questionNum % 2;

    if (n != 0) {
      state = state.copyWith(score: ((5 - chosen) + 1));
    } else {
      state = state.copyWith(score: chosen);
    }
    print(state.score);
  }

  void setNext() {
    state.scoreList.add(state.score);
    print(state.scoreList);
    state = state.copyWith(
      scoreList: state.scoreList,
      isLock: [false, false, false, false, false],
      questionNum: state.questionNum + 1,
      numbering: state.numbering + 1,
      score: 0,
    );
  }

  void setResult() async {
    state.scoreList.add(state.score);
    List<List<double>> data = [[]];
    for (var i in state.scoreList) {
      data[0].add(i.toDouble());
    }
    final interpreter = await tfl.Interpreter.fromAsset('model.tflite');
    var output = List.filled(1 * 5, 0).reshape([1, 5]);
    // print(data);
    interpreter.run(data, output);
    print(output);

    int result = 0;
    for (int i = 0; i < output[0].length; i++) {
      if (output[0][result] < output[0][i]) {
        result = i;
      }
    }
    print(result);
    state = state.copyWith(result: result);
  }

  String getPersonality() {
    switch (state.result) {
      case 0:
        return "perosonality 1";
        break;
      case 1:
        return "perosonality 2";
        break;
      case 2:
        return "perosonality 3";
        break;
      case 3:
        return "perosonality 4";
        break;
      case 4:
        return "perosonality 5";
        break;
      default:
        return "error";
        break;
    }
  }

  String getQuestionText() {
    return state.questionGroup[state.questionNum].questionText;
  }

  int getQuestionLength() {
    return state.questionGroup.length;
  }

  String getQuestionImage() {
    return state.questionGroup[state.questionNum].questionImage;
  }
}

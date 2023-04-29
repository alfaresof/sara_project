import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/exam/domain/notifire.dart';
import 'package:sara_project/features/exam/view/widget/button.dart';

class ExamPage extends ConsumerStatefulWidget {
  const ExamPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ExamPageState();
}

class _ExamPageState extends ConsumerState<ExamPage> {
  String next = 'Next';

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(ExamProvider);
    final examController = ref.read(ExamProvider.notifier);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 241, 243),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Question ${examState.numbering}/${examController.getQuestionLength()}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 51, 49, 49)),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(thickness: 1, color: Colors.grey),
                      Text(examController.getQuestionText(),
                          style: const TextStyle(fontSize: 30),
                          textAlign: TextAlign.left),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(examController.getQuestionImage()),
                          const SizedBox(height: 60),
                          customButton(
                              fun: () {
                                examController.setTrue(0);
                                examController.setScore(1);
                              },
                              title: 'definitly yes',
                              isLocked: examState.isLock[0]),
                          const SizedBox(height: 20),
                          customButton(
                              fun: () {
                                examController.setTrue(1);
                                examController.setScore(2);
                              },
                              title: 'a little bit',
                              isLocked: examState.isLock[1]),
                          const SizedBox(height: 20),
                          customButton(
                              fun: () {
                                examController.setTrue(2);
                                examController.setScore(3);
                              },
                              title: 'it depends',
                              isLocked: examState.isLock[2]),
                          const SizedBox(height: 20),
                          customButton(
                              fun: () {
                                examController.setTrue(3);
                                examController.setScore(4);
                              },
                              title: 'a little bit',
                              isLocked: examState.isLock[3]),
                          const SizedBox(height: 20),
                          customButton(
                              fun: () {
                                examController.setTrue(4);
                                examController.setScore(5);
                              },
                              title: 'definitly yes',
                              isLocked: examState.isLock[4]),
                          const SizedBox(width: 100),
                        ],
                      ),
                      nextButton(
                        fun: () {
                          if (examState.questionNum ==
                              examController.getQuestionLength() - 1) {
                            examController.setResult();
                            Navigator.pushNamed(context, '/result');
                          } else if (examState.score != 0) {
                            examController.setNext();
                          }
                        },
                        result: examState.questionNum ==
                            examController.getQuestionLength() - 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_notifire.dart';
import 'package:sara_project/features/exam/domain/notifire.dart';

class Result extends ConsumerStatefulWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ResultState();
}

class _ResultState extends ConsumerState<Result> {
  @override
  Widget build(BuildContext context) {
    final resultState = ref.watch(ExamProvider);
    final resultController = ref.read(ExamProvider.notifier);
    final authController = ref.read(authProvider.notifier);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'the result is : ',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              resultController.getPersonality(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  resultController.setInit();
                  authController.setType(context, resultState.result);
                },
                child: Text('done')),
          ],
        ),
      ),
    );
  }
}

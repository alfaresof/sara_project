import 'package:flutter/material.dart';

ElevatedButton customButton({
  required Function() fun,
  required String title,
  required bool isLocked,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          isLocked ? Colors.blue : const Color.fromARGB(255, 248, 249, 252),
        ),
        elevation: const MaterialStatePropertyAll(3),
        padding:
            const MaterialStatePropertyAll(EdgeInsets.fromLTRB(25, 20, 25, 20)),
      ),
      onPressed: fun,
      child: Text(
        title,
        style:
            const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );

ElevatedButton nextButton({
  required Function() fun,
  required bool result,
}) =>
    ElevatedButton(
      onPressed: fun,
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
      child: Text(result ? 'Result' : 'Next'),
    );

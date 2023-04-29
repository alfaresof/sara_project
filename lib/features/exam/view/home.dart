import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/view/info.dart';
import 'package:sara_project/features/exam/domain/notifire.dart';
import 'package:sara_project/features/exam/view/widget/child_page.dart';

class Home extends ConsumerStatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(ExamProvider);
    final examController = ref.read(ExamProvider.notifier);
    final pages = [
      ChildPage(context),
      Info(),
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 129, 189, 241),
      body: pages[examState.choosen],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (val) => examController.setBottomBar(val),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Child',
              icon: Icon(Icons.child_care_sharp),
            ),
          ]),
    );
  }
}

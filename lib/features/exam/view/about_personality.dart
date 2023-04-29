import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_notifire.dart';
import 'package:sara_project/shared/types_and_details.dart';

class About extends ConsumerStatefulWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AboutState();
}

class _AboutState extends ConsumerState<About> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('about'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(types[authState.type]),
            SizedBox(),
            Text(aboutTypes[authState.type]),
          ],
        ),
      ),
    );
  }
}

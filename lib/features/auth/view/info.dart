import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_notifire.dart';
import 'package:sara_project/shared/types_and_details.dart';

class Info extends ConsumerStatefulWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _InfoState();
}

class _InfoState extends ConsumerState<Info> {
  @override
  void initState() {
    final infoController = ref.read(authProvider.notifier);
    infoController.getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final infoState = ref.watch(authProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(infoState.name, style: const TextStyle(fontSize: 30)),
              Text(infoState.age.toString(),
                  style: const TextStyle(fontSize: 30)),
              Text(infoState.gender, style: const TextStyle(fontSize: 30)),
              Text('your personality is : ${types[infoState.type]}',
                  style: const TextStyle(fontSize: 30)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('Read about personality')),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/edit'),
                  child: const Text('edit info'))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_notifire.dart';
import 'package:sara_project/features/auth/view/widgets/my_button.dart';
import 'package:sara_project/features/auth/view/widgets/my_text_field.dart';

class EditInfo extends ConsumerStatefulWidget {
  const EditInfo({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EditInfoState();
}

class _EditInfoState extends ConsumerState<EditInfo> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authController = ref.read(authProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                //welcome back
                Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                //user name textfield
                MyTextfield(
                  controller: authState.editEmail,
                  hintText: 'email',
                  obscureText: false,
                ),

                //password textfield
                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.editPassword,
                  hintText: 'Password',
                  obscureText: true,
                ),

                //name textfield
                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.editName,
                  hintText: 'name',
                  obscureText: true,
                ),

                //password textfield
                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.editAge,
                  hintText: 'age',
                  obscureText: true,
                ),

                MyTextfield(
                  controller: authState.editGender,
                  hintText: 'age',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                //sign in button
                MyButton(
                  onTap: () {
                    authController.editInfo(context);
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_notifire.dart';
import 'package:sara_project/features/auth/view/widgets/my_button.dart';
import 'package:sara_project/features/auth/view/widgets/my_text_field.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
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
                  controller: authState.email,
                  hintText: 'Username',
                  obscureText: false,
                ),

                //password textfield
                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.password,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                //sign in button
                MyButton(
                  onTap: () {
                    authController.signIn(context);
                  },
                ),
                const SizedBox(height: 100),
                //not a member?  register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/sign_up'),
                      child: const Text(
                        "sign up now",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

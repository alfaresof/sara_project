import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_notifire.dart';
import 'package:sara_project/features/auth/view/widgets/my_button.dart';
import 'package:sara_project/features/auth/view/widgets/my_text_field.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
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
                  controller: authState.signUpEmail,
                  hintText: 'email',
                  obscureText: false,
                ),

                //password textfield
                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.signUpPassword,
                  hintText: 'Password',
                  obscureText: true,
                ),

                //name textfield
                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.signUpName,
                  hintText: 'name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                MyTextfield(
                  controller: authState.signUpAge,
                  hintText: 'age',
                  obscureText: false,
                ),

                MyTextfield(
                  controller: authState.signUpGender,
                  hintText: 'age',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                //sign up button
                MyButton(
                  title: "Sign Up",
                  onTap: () {
                    authController.signUp(context);
                  },
                ),
                const SizedBox(height: 100),
                //not a member?  register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have an account ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/sign_up'),
                      child: const Text(
                        "sign in now",
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

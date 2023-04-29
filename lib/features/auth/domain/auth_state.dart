import 'package:flutter/cupertino.dart';

class AuthState {
  /// this is for sign in screen
  final TextEditingController email;
  final TextEditingController password;

  /// this is for sign up screen
  final TextEditingController signUpEmail;
  final TextEditingController signUpPassword;
  final TextEditingController signUpName;
  final TextEditingController signUpGender;
  final TextEditingController signUpAge;

  /// this is for sign up screen
  final TextEditingController editEmail;
  final TextEditingController editPassword;
  final TextEditingController editName;
  final TextEditingController editGender;
  final TextEditingController editAge;

  final String uid;
  final String name;
  final int age;
  final int type;
  final String gender;

  AuthState({
    required this.email,
    required this.password,
    required this.uid,
    required this.name,
    required this.age,
    required this.gender,
    required this.signUpAge,
    required this.signUpEmail,
    required this.signUpGender,
    required this.signUpName,
    required this.signUpPassword,
    required this.editAge,
    required this.editEmail,
    required this.editGender,
    required this.editName,
    required this.editPassword,
    required this.type,
  });

  factory AuthState.Initial() {
    return AuthState(
      email: TextEditingController(),
      password: TextEditingController(),
      signUpAge: TextEditingController(),
      signUpEmail: TextEditingController(),
      signUpGender: TextEditingController(),
      signUpName: TextEditingController(),
      signUpPassword: TextEditingController(),
      uid: "",
      name: "",
      age: 0,
      gender: "",
      type: 0,
      editAge: TextEditingController(),
      editEmail: TextEditingController(),
      editGender: TextEditingController(),
      editName: TextEditingController(),
      editPassword: TextEditingController(),
    );
  }

  AuthState copyWith(
      {TextEditingController? email,
      TextEditingController? password,
      String? uid,
      String? name,
      String? gender,
      int? age,
      TextEditingController? signUpEmail,
      TextEditingController? signUpPassword,
      TextEditingController? signUpName,
      TextEditingController? signUpGender,
      TextEditingController? signUpAge,
      TextEditingController? editEmail,
      TextEditingController? editPassword,
      TextEditingController? editName,
      TextEditingController? editGender,
      TextEditingController? editAge,
      int? type}) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      signUpAge: signUpAge ?? this.signUpAge,
      signUpEmail: signUpEmail ?? this.signUpEmail,
      signUpGender: signUpGender ?? this.signUpGender,
      signUpName: signUpName ?? this.signUpName,
      signUpPassword: signUpPassword ?? this.signUpPassword,
      type: type ?? this.type,
      editAge: editAge ?? this.editAge,
      editEmail: editEmail ?? this.editEmail,
      editGender: editGender ?? this.editGender,
      editName: editName ?? this.editName,
      editPassword: editPassword ?? this.editPassword,
    );
  }
}

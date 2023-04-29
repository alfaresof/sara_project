import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sara_project/features/auth/domain/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.Initial());

  void signIn(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      final res = await auth.signInWithEmailAndPassword(
        email: state.email.text,
        password: state.password.text,
      );
      print(res);
      if (res.user!.uid.isNotEmpty) {
        state = state.copyWith(
          uid: res.user!.uid,
        );
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {}
  }

  void signUp(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      final res = await auth.createUserWithEmailAndPassword(
        email: state.signUpEmail.text,
        password: state.signUpPassword.text,
      );
      if (res.user!.uid.isNotEmpty) {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        final data = {
          'child_name': state.signUpName.text,
          'age': state.signUpAge.text,
          'gender': state.signUpGender.text,
          'type': 0
        };
        await firestore
            .collection("users")
            .doc(res.user!.uid)
            .set(data)
            .onError((e, _) => print("Error writing document: $e"));

        state = state.copyWith(
          uid: res.user!.uid,
        );
        print('here');
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {}
  }

  void getInfo() async {
    try {
      final firestore = FirebaseFirestore.instance;
      try {
        final res = firestore.collection("users").doc(state.uid);
        res.get().then((DocumentSnapshot value) {
          final data = value.data() as Map<String, dynamic>;
          print(data);
          state = state.copyWith(
              name: value['child_name'],
              age: int.parse(value['age'].toString()),
              gender: value['gender'],
              type: value['type']);
        }, onError: (e) {});

        print(res);
      } catch (e) {
        print(e);
      }
    } catch (e) {}
  }

  void editInfo(BuildContext context) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final data = {
        'child_name':
            state.editName.text.isEmpty ? state.name : state.editName.text,
        'age': state.editAge.text.isEmpty ? state.age : state.editAge.text,
        'gender': state.editGender.text.isEmpty
            ? state.gender
            : state.editGender.text,
        'type': state.type
      };
      print(data);
      final res = firestore
          .collection("users")
          .doc(state.uid)
          .update(data)
          .onError((error, stackTrace) => print(error));
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {}
  }

  setType(BuildContext context, int typeOfResult) {
    state = state.copyWith(type: typeOfResult);
    editInfo(context);
    Navigator.pushReplacementNamed(context, '/home');
  }
}

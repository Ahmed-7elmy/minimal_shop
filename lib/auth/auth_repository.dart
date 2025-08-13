import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mshtsht/auth/auth_bloc.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SharedPreferences prefs;

  AuthRepository({required this.prefs});

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    //await prefs.setBool('isLoggedIn', true);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await prefs.setBool('isLoggedIn', false);
  }

  bool get isLoggedIn => prefs.getBool('isLoggedIn') ?? false;
}

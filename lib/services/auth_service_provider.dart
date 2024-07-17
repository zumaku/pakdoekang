import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pakdoekang/services/auth_service.dart';

class AuthServiceProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user; // Firebase User object

  User? get user => _user;

  // Check if user is authenticated
  bool get isAuthenticated => _user != null;

  // Initialize the provider
  AuthServiceProvider() {
    _init();
  }

  // Initialize method to check current user
  Future<void> _init() async {
    _user = await _authService.currentUser;
    notifyListeners();
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    _user = await _authService.signInWithGoogle();
    notifyListeners();
  }

  // Sign out
  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}

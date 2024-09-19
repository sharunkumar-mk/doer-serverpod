import 'package:doer_flutter/constants/secure_storage_path.dart';
import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/modules/pages/home.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class LoginNotifier extends StateNotifier<ResponseState> {
  final FirebaseAuth firebaseAuth;

  LoginNotifier({required this.firebaseAuth})
      : super(ResponseState(isLoading: true, isError: false));
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  final authController = EmailAuthController(client.modules.auth);

  Future<void> signInWithEmailAndPassword(
      {bool init = true,
      required String email,
      required String password}) async {
    try {
      if (init) {
        state = state.copyWith(isLoading: true, isError: false);

        final response = await authController.signIn(email, password);

        if (response != null) {
          state = state.copyWith(
              isLoading: false, isError: false, response: response);
        } else {
          state = state.copyWith(
              isLoading: false, isError: true, errorMessage: 'Login error');
        }
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }

  Future<void> logout({bool init = true}) async {
    try {
      if (init) {
        state = state.copyWith(isLoading: true, isError: false);
        await sessionManager.signOut();
        state =
            state.copyWith(isLoading: false, isError: false, response: false);
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }
}

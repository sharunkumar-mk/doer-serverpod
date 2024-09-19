import 'package:doer_flutter/providers/service_notifier.dart';
import 'package:doer_flutter/providers/signin_notifier.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// final firebaseRespositoryProvider = Provider<FirebaseRepository>((ref) {
//   return FirebaseRepository();
// });
final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, ResponseState>(
        (ref) => LoginNotifier(firebaseAuth: ref.watch(firebaseAuthProvider)));

final serviceNotifierProvider =
    StateNotifierProvider.autoDispose<ServiceNotifier, ResponseState>(
        (ref) => ServiceNotifier());

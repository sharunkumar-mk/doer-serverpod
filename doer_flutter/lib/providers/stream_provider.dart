import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doer_flutter/providers/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseStreamProvider = StreamProvider<List<DocumentSnapshot>>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final collection = firestore.collection('collections');
  return collection.snapshots().map((snapshot) => snapshot.docs);
});

// final streamNotifierProvider =
//     StateNotifierProvider<LoginNotifier, ResponseState>(
//         (ref) => LoginNotifier(ref.watch(homeApiRepositoryProvider)));

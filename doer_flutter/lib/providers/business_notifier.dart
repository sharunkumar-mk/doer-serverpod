import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceNotifier extends StateNotifier<ResponseState> {
  ServiceNotifier() : super(ResponseState(isLoading: true, isError: false));

  Future<void> fetchServices({bool init = true}) async {
    try {
      if (init) {
        state = state.copyWith(isLoading: true, isError: false);
        final response = await client.service.getService();
        state = state.copyWith(
            isLoading: false, isError: false, response: response);
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }
}

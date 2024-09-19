import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceNotifier extends StateNotifier<ResponseState> {
  ServiceNotifier() : super(ResponseState(isLoading: true, isError: false));

  List<Service>? servicesList;

  Future<void> getServices({bool init = true}) async {
    try {
      if (init) {
        state = state.copyWith(isLoading: true, isError: false);
        final result = await client.service.getService();
        servicesList = result;
        state =
            state.copyWith(isLoading: false, isError: false, response: result);
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }

  Future<void> postServices(
      {bool init = true, required Service service}) async {
    try {
      if (init) {
        state = state.copyWith(isLoading: true, isError: false);

        final response = await client.service.getService();
        await client.service.postService(service);
        state = state.copyWith(
            isLoading: false, isError: false, response: response);
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }

  Future<void> deleteServices(
      {bool init = true, required Service service}) async {
    try {
      if (init) {
        await client.service.deleteService(service);
        await client.upload.deleteUpload(service.image);
        state = state.copyWith(
          isLoading: false,
          isError: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString());
    }
  }
}

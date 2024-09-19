/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'business.dart' as _i2;
import 'service.dart' as _i3;
import 'sub_service.dart' as _i4;
import 'protocol.dart' as _i5;
import 'package:doer_client/src/protocol/business.dart' as _i6;
import 'package:doer_client/src/protocol/service.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'business.dart';
export 'service.dart';
export 'sub_service.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Business) {
      return _i2.Business.fromJson(data) as T;
    }
    if (t == _i3.Service) {
      return _i3.Service.fromJson(data) as T;
    }
    if (t == _i4.SubService) {
      return _i4.SubService.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Business?>()) {
      return (data != null ? _i2.Business.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Service?>()) {
      return (data != null ? _i3.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.SubService?>()) {
      return (data != null ? _i4.SubService.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i5.SubService>) {
      return (data as List).map((e) => deserialize<_i5.SubService>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i6.Business>) {
      return (data as List).map((e) => deserialize<_i6.Business>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Service>) {
      return (data as List).map((e) => deserialize<_i7.Service>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Business) {
      return 'Business';
    }
    if (data is _i3.Service) {
      return 'Service';
    }
    if (data is _i4.SubService) {
      return 'SubService';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Business') {
      return deserialize<_i2.Business>(data['data']);
    }
    if (data['className'] == 'Service') {
      return deserialize<_i3.Service>(data['data']);
    }
    if (data['className'] == 'SubService') {
      return deserialize<_i4.SubService>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

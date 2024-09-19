/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:doer_client/src/protocol/business.dart' as _i3;
import 'package:doer_client/src/protocol/service.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointBusiness extends _i1.EndpointRef {
  EndpointBusiness(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'business';

  _i2.Future<List<_i3.Business>> getService() =>
      caller.callServerEndpoint<List<_i3.Business>>(
        'business',
        'getService',
        {},
      );

  _i2.Future<void> postBusiness(_i3.Business business) =>
      caller.callServerEndpoint<void>(
        'business',
        'postBusiness',
        {'business': business},
      );

  _i2.Future<void> deleteBusiness(_i3.Business business) =>
      caller.callServerEndpoint<void>(
        'business',
        'deleteBusiness',
        {'business': business},
      );
}

/// {@category Endpoint}
class EndpointService extends _i1.EndpointRef {
  EndpointService(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'service';

  _i2.Future<List<_i4.Service>> getService() =>
      caller.callServerEndpoint<List<_i4.Service>>(
        'service',
        'getService',
        {},
      );

  _i2.Future<void> postService(_i4.Service service) =>
      caller.callServerEndpoint<void>(
        'service',
        'postService',
        {'service': service},
      );

  _i2.Future<void> deleteService(_i4.Service service) =>
      caller.callServerEndpoint<void>(
        'service',
        'deleteService',
        {'service': service},
      );
}

/// {@category Endpoint}
class EndpointUpload extends _i1.EndpointRef {
  EndpointUpload(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'upload';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'upload',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'upload',
        'verifyUpload',
        {'path': path},
      );

  _i2.Future<String> getUploadPath(String path) =>
      caller.callServerEndpoint<String>(
        'upload',
        'getUploadPath',
        {'path': path},
      );

  _i2.Future<void> deleteUpload(String path) => caller.callServerEndpoint<void>(
        'upload',
        'deleteUpload',
        {'path': path},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    business = EndpointBusiness(this);
    service = EndpointService(this);
    upload = EndpointUpload(this);
    modules = _Modules(this);
  }

  late final EndpointBusiness business;

  late final EndpointService service;

  late final EndpointUpload upload;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'business': business,
        'service': service,
        'upload': upload,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}

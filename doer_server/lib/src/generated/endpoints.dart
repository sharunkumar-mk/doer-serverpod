/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/business_endpoin.dart' as _i2;
import '../endpoints/service_endpoint.dart' as _i3;
import '../endpoints/upload_endpoint.dart' as _i4;
import 'package:doer_server/src/generated/business.dart' as _i5;
import 'package:doer_server/src/generated/service.dart' as _i6;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'business': _i2.BusinessEndpoint()
        ..initialize(
          server,
          'business',
          null,
        ),
      'service': _i3.ServiceEndpoint()
        ..initialize(
          server,
          'service',
          null,
        ),
      'upload': _i4.UploadEndpoint()
        ..initialize(
          server,
          'upload',
          null,
        ),
    };
    connectors['business'] = _i1.EndpointConnector(
      name: 'business',
      endpoint: endpoints['business']!,
      methodConnectors: {
        'getService': _i1.MethodConnector(
          name: 'getService',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['business'] as _i2.BusinessEndpoint)
                  .getService(session),
        ),
        'postBusiness': _i1.MethodConnector(
          name: 'postBusiness',
          params: {
            'business': _i1.ParameterDescription(
              name: 'business',
              type: _i1.getType<_i5.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['business'] as _i2.BusinessEndpoint).postBusiness(
            session,
            params['business'],
          ),
        ),
        'deleteBusiness': _i1.MethodConnector(
          name: 'deleteBusiness',
          params: {
            'business': _i1.ParameterDescription(
              name: 'business',
              type: _i1.getType<_i5.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['business'] as _i2.BusinessEndpoint).deleteBusiness(
            session,
            params['business'],
          ),
        ),
      },
    );
    connectors['service'] = _i1.EndpointConnector(
      name: 'service',
      endpoint: endpoints['service']!,
      methodConnectors: {
        'getService': _i1.MethodConnector(
          name: 'getService',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['service'] as _i3.ServiceEndpoint).getService(session),
        ),
        'postService': _i1.MethodConnector(
          name: 'postService',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i6.Service>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['service'] as _i3.ServiceEndpoint).postService(
            session,
            params['service'],
          ),
        ),
        'deleteService': _i1.MethodConnector(
          name: 'deleteService',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i6.Service>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['service'] as _i3.ServiceEndpoint).deleteService(
            session,
            params['service'],
          ),
        ),
      },
    );
    connectors['upload'] = _i1.EndpointConnector(
      name: 'upload',
      endpoint: endpoints['upload']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i4.UploadEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i4.UploadEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
        'getUploadPath': _i1.MethodConnector(
          name: 'getUploadPath',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i4.UploadEndpoint).getUploadPath(
            session,
            params['path'],
          ),
        ),
        'deleteUpload': _i1.MethodConnector(
          name: 'deleteUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i4.UploadEndpoint).deleteUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}

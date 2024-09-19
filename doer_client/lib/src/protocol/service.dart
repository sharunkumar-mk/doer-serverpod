/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class Service implements _i1.SerializableModel {
  Service._({
    this.id,
    required this.name,
    required this.description,
    required this.subServices,
    required this.image,
  });

  factory Service({
    int? id,
    required String name,
    required List<String> description,
    required List<_i2.SubService> subServices,
    required String image,
  }) = _ServiceImpl;

  factory Service.fromJson(Map<String, dynamic> jsonSerialization) {
    return Service(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: (jsonSerialization['description'] as List)
          .map((e) => e as String)
          .toList(),
      subServices: (jsonSerialization['subServices'] as List)
          .map((e) => _i2.SubService.fromJson((e as Map<String, dynamic>)))
          .toList(),
      image: jsonSerialization['image'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  List<String> description;

  List<_i2.SubService> subServices;

  String image;

  Service copyWith({
    int? id,
    String? name,
    List<String>? description,
    List<_i2.SubService>? subServices,
    String? image,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description.toJson(),
      'subServices': subServices.toJson(valueToJson: (v) => v.toJson()),
      'image': image,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServiceImpl extends Service {
  _ServiceImpl({
    int? id,
    required String name,
    required List<String> description,
    required List<_i2.SubService> subServices,
    required String image,
  }) : super._(
          id: id,
          name: name,
          description: description,
          subServices: subServices,
          image: image,
        );

  @override
  Service copyWith({
    Object? id = _Undefined,
    String? name,
    List<String>? description,
    List<_i2.SubService>? subServices,
    String? image,
  }) {
    return Service(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description.clone(),
      subServices: subServices ?? this.subServices.clone(),
      image: image ?? this.image,
    );
  }
}

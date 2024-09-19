/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SubService implements _i1.SerializableModel {
  SubService._({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  factory SubService({
    int? id,
    String? name,
    List<String>? description,
    String? image,
  }) = _SubServiceImpl;

  factory SubService.fromJson(Map<String, dynamic> jsonSerialization) {
    return SubService(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String?,
      description: (jsonSerialization['description'] as List?)
          ?.map((e) => e as String)
          .toList(),
      image: jsonSerialization['image'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? name;

  List<String>? description;

  String? image;

  SubService copyWith({
    int? id,
    String? name,
    List<String>? description,
    String? image,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description?.toJson(),
      if (image != null) 'image': image,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubServiceImpl extends SubService {
  _SubServiceImpl({
    int? id,
    String? name,
    List<String>? description,
    String? image,
  }) : super._(
          id: id,
          name: name,
          description: description,
          image: image,
        );

  @override
  SubService copyWith({
    Object? id = _Undefined,
    Object? name = _Undefined,
    Object? description = _Undefined,
    Object? image = _Undefined,
  }) {
    return SubService(
      id: id is int? ? id : this.id,
      name: name is String? ? name : this.name,
      description: description is List<String>?
          ? description
          : this.description?.clone(),
      image: image is String? ? image : this.image,
    );
  }
}

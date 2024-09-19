/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Business implements _i1.SerializableModel {
  Business._({
    this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Business({
    int? id,
    required String name,
    required List<String> description,
    required String image,
  }) = _BusinessImpl;

  factory Business.fromJson(Map<String, dynamic> jsonSerialization) {
    return Business(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: (jsonSerialization['description'] as List)
          .map((e) => e as String)
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

  String image;

  Business copyWith({
    int? id,
    String? name,
    List<String>? description,
    String? image,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description.toJson(),
      'image': image,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BusinessImpl extends Business {
  _BusinessImpl({
    int? id,
    required String name,
    required List<String> description,
    required String image,
  }) : super._(
          id: id,
          name: name,
          description: description,
          image: image,
        );

  @override
  Business copyWith({
    Object? id = _Undefined,
    String? name,
    List<String>? description,
    String? image,
  }) {
    return Business(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description.clone(),
      image: image ?? this.image,
    );
  }
}

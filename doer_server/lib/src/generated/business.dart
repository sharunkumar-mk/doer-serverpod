/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Business extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Business._({
    int? id,
    required this.name,
    required this.description,
    required this.image,
  }) : super(id);

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

  static final t = BusinessTable();

  static const db = BusinessRepository._();

  String name;

  List<String> description;

  String image;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description.toJson(),
      'image': image,
    };
  }

  static BusinessInclude include() {
    return BusinessInclude._();
  }

  static BusinessIncludeList includeList({
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    BusinessInclude? include,
  }) {
    return BusinessIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Business.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Business.t),
      include: include,
    );
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

class BusinessTable extends _i1.Table {
  BusinessTable({super.tableRelation}) : super(tableName: 'business') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnSerializable(
      'description',
      this,
    );
    image = _i1.ColumnString(
      'image',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnSerializable description;

  late final _i1.ColumnString image;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        image,
      ];
}

class BusinessInclude extends _i1.IncludeObject {
  BusinessInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Business.t;
}

class BusinessIncludeList extends _i1.IncludeList {
  BusinessIncludeList._({
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Business.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Business.t;
}

class BusinessRepository {
  const BusinessRepository._();

  Future<List<Business>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Business>(
      where: where?.call(Business.t),
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Business?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Business>(
      where: where?.call(Business.t),
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Business?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Business>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Business>> insert(
    _i1.Session session,
    List<Business> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Business>(
      rows,
      transaction: transaction,
    );
  }

  Future<Business> insertRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Business>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Business>> update(
    _i1.Session session,
    List<Business> rows, {
    _i1.ColumnSelections<BusinessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Business>(
      rows,
      columns: columns?.call(Business.t),
      transaction: transaction,
    );
  }

  Future<Business> updateRow(
    _i1.Session session,
    Business row, {
    _i1.ColumnSelections<BusinessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Business>(
      row,
      columns: columns?.call(Business.t),
      transaction: transaction,
    );
  }

  Future<List<Business>> delete(
    _i1.Session session,
    List<Business> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Business>(
      rows,
      transaction: transaction,
    );
  }

  Future<Business> deleteRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Business>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Business>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BusinessTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Business>(
      where: where(Business.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Business>(
      where: where?.call(Business.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

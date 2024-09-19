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

abstract class SubService extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  SubService._({
    int? id,
    this.name,
    this.description,
    this.image,
  }) : super(id);

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

  static final t = SubServiceTable();

  static const db = SubServiceRepository._();

  String? name;

  List<String>? description;

  String? image;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description?.toJson(),
      if (image != null) 'image': image,
    };
  }

  static SubServiceInclude include() {
    return SubServiceInclude._();
  }

  static SubServiceIncludeList includeList({
    _i1.WhereExpressionBuilder<SubServiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubServiceTable>? orderByList,
    SubServiceInclude? include,
  }) {
    return SubServiceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SubService.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SubService.t),
      include: include,
    );
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

class SubServiceTable extends _i1.Table {
  SubServiceTable({super.tableRelation}) : super(tableName: 'sub_services') {
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

class SubServiceInclude extends _i1.IncludeObject {
  SubServiceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SubService.t;
}

class SubServiceIncludeList extends _i1.IncludeList {
  SubServiceIncludeList._({
    _i1.WhereExpressionBuilder<SubServiceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SubService.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SubService.t;
}

class SubServiceRepository {
  const SubServiceRepository._();

  Future<List<SubService>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubServiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubServiceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SubService>(
      where: where?.call(SubService.t),
      orderBy: orderBy?.call(SubService.t),
      orderByList: orderByList?.call(SubService.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SubService?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubServiceTable>? where,
    int? offset,
    _i1.OrderByBuilder<SubServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubServiceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SubService>(
      where: where?.call(SubService.t),
      orderBy: orderBy?.call(SubService.t),
      orderByList: orderByList?.call(SubService.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SubService?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SubService>(
      id,
      transaction: transaction,
    );
  }

  Future<List<SubService>> insert(
    _i1.Session session,
    List<SubService> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SubService>(
      rows,
      transaction: transaction,
    );
  }

  Future<SubService> insertRow(
    _i1.Session session,
    SubService row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SubService>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SubService>> update(
    _i1.Session session,
    List<SubService> rows, {
    _i1.ColumnSelections<SubServiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SubService>(
      rows,
      columns: columns?.call(SubService.t),
      transaction: transaction,
    );
  }

  Future<SubService> updateRow(
    _i1.Session session,
    SubService row, {
    _i1.ColumnSelections<SubServiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SubService>(
      row,
      columns: columns?.call(SubService.t),
      transaction: transaction,
    );
  }

  Future<List<SubService>> delete(
    _i1.Session session,
    List<SubService> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SubService>(
      rows,
      transaction: transaction,
    );
  }

  Future<SubService> deleteRow(
    _i1.Session session,
    SubService row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SubService>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SubService>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SubServiceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SubService>(
      where: where(SubService.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubServiceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SubService>(
      where: where?.call(SubService.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

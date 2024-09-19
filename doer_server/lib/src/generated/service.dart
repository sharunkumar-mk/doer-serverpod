/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Service extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Service._({
    int? id,
    required this.name,
    required this.description,
    required this.subServices,
    required this.image,
  }) : super(id);

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

  static final t = ServiceTable();

  static const db = ServiceRepository._();

  String name;

  List<String> description;

  List<_i2.SubService> subServices;

  String image;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description.toJson(),
      'subServices':
          subServices.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'image': image,
    };
  }

  static ServiceInclude include() {
    return ServiceInclude._();
  }

  static ServiceIncludeList includeList({
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    ServiceInclude? include,
  }) {
    return ServiceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Service.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Service.t),
      include: include,
    );
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

class ServiceTable extends _i1.Table {
  ServiceTable({super.tableRelation}) : super(tableName: 'service') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnSerializable(
      'description',
      this,
    );
    subServices = _i1.ColumnSerializable(
      'subServices',
      this,
    );
    image = _i1.ColumnString(
      'image',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnSerializable description;

  late final _i1.ColumnSerializable subServices;

  late final _i1.ColumnString image;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        subServices,
        image,
      ];
}

class ServiceInclude extends _i1.IncludeObject {
  ServiceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Service.t;
}

class ServiceIncludeList extends _i1.IncludeList {
  ServiceIncludeList._({
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Service.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Service.t;
}

class ServiceRepository {
  const ServiceRepository._();

  Future<List<Service>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Service>(
      where: where?.call(Service.t),
      orderBy: orderBy?.call(Service.t),
      orderByList: orderByList?.call(Service.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Service?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Service>(
      where: where?.call(Service.t),
      orderBy: orderBy?.call(Service.t),
      orderByList: orderByList?.call(Service.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Service?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Service>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Service>> insert(
    _i1.Session session,
    List<Service> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Service>(
      rows,
      transaction: transaction,
    );
  }

  Future<Service> insertRow(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Service>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Service>> update(
    _i1.Session session,
    List<Service> rows, {
    _i1.ColumnSelections<ServiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Service>(
      rows,
      columns: columns?.call(Service.t),
      transaction: transaction,
    );
  }

  Future<Service> updateRow(
    _i1.Session session,
    Service row, {
    _i1.ColumnSelections<ServiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Service>(
      row,
      columns: columns?.call(Service.t),
      transaction: transaction,
    );
  }

  Future<List<Service>> delete(
    _i1.Session session,
    List<Service> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Service>(
      rows,
      transaction: transaction,
    );
  }

  Future<Service> deleteRow(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Service>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Service>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServiceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Service>(
      where: where(Service.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Service>(
      where: where?.call(Service.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

import 'package:doer_server/src/generated/service.dart';
import 'package:serverpod/serverpod.dart';

class ServiceEndpoint extends Endpoint {
  Future<List<Service>> getService(Session session) async {
    return await Service.db.find(session);
  }

  Future<void> postService(Session session, Service service) async {
    final res = await Service.db.insertRow(session, service);
    print(res);
  }

  Future<void> deleteService(Session session, Service service) async {
    await Service.db.deleteRow(session, service);
  }
}

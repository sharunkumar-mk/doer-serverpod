import 'package:doer_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class BusinessEndpoint extends Endpoint {
  Future<List<Business>> getService(Session session) async {
    return await Business.db.find(session);
  }

  Future<void> postBusiness(Session session, Business business) async {
    final res = await Business.db.insertRow(session, business);
    print(res);
  }

  Future<void> deleteBusiness(Session session, Business business) async {
    await Business.db.deleteRow(session, business);
  }
}

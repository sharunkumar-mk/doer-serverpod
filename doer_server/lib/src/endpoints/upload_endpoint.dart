import 'package:serverpod/serverpod.dart';

class UploadEndpoint extends Endpoint {
  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<String> getUploadPath(Session session, String path) async {
    final url = await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );
    return url.toString();
  }

  Future<void> deleteUpload(Session session, String path) async {
    await session.storage.deleteFile(storageId: 'public', path: path);
  }
}

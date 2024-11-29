import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  late Client client;
  late Databases databases;
  static const endpoint = "https://cloud.appwrite.io/v1";
  static const projectId = "674591b40020e71645d8";
  static const databaseId = "6745921b000eb2609f62";
  static const collectionId = "67459234002de5f745da";

  AppwriteService() {
    client = Client();
    client.setEndpoint(endpoint);
    client.setProject(projectId);
    databases = Databases(client);
  }

  Future<Document> AddEmployee(String _employee, String photo) async {
    try {
      final documetId = ID.unique();
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(documetId);
      final result = await databases.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: documetId,
          data: {"photo": photo, "name": _employee, "isActive": false});
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Document>> getEmployee() async {
    try {
      final result = await databases.listDocuments(
          databaseId: databaseId, collectionId: collectionId);
      print("===============");
      print(result);
      print(".................................");
      return result.documents;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Document> updateListStatus(String documentId, bool active) async {
    try {
      final result = await databases.updateDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: documentId,
          data: {"isActive": active});
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteTask(id) async {
    try {
      final result = await databases.deleteDocument(
          databaseId: databaseId, collectionId: collectionId, documentId: id);
    } catch (e) {
      print(e);
    }
  }
}

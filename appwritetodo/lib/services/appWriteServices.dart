import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class appWriteServices {
  late Client client;
  late Databases databases;
  static const endpoint = "https://cloud.appwrite.io/v1";
  static const projectId = "67406594000d63f66303";
  static const databaseid = "6740674d00069bff2051";
  static const collectionId = "674067c40026ab1b4987";

  appWriteServices() {
    client = Client();
    client.setEndpoint(endpoint);
    client.setProject(projectId);
    databases = Databases(client);
  }

  Future<Document> addTask(String _task) async {
    try {
      final documentId = ID.unique();
      print("..................................................");
      print(documentId);
      final result = await databases.createDocument(
          databaseId: databaseid,
          collectionId: collectionId,
          documentId: documentId,
          data: {"task": _task, "isCompleted": false});
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Document>> getTasks() async {
    try {
      final results = await databases.listDocuments(
          databaseId: databaseid, collectionId: collectionId);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(results);
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      return results.documents;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteTask(id) async {
    try {
      final results = await databases.deleteDocument(
          databaseId: databaseid, collectionId: collectionId, documentId: id);
    } catch (e) {
      print(e);
    }
  }

  Future<Document> updateTaskStatus(String documentId, bool completed) async {
    try {
      final result = await databases.updateDocument(
          databaseId: databaseid,
          collectionId: collectionId,
          documentId: documentId,
          data: {"isCompleted": completed});
          return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

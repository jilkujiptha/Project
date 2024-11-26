import 'package:appwrite/models.dart';

class Employee {
  final String id;
  final String photo;
  final String name;
  final bool isActive;

  Employee({required this.id, required this.photo, required this.name, required this.isActive});

  factory Employee.formDocument(Document doc) {
    print(doc);
    return Employee(
      id: doc.$id,
        photo: doc.data["photo"],
        name: doc.data["name"],
        isActive: doc.data["isActive"]);
  }
}

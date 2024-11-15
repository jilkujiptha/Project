import 'package:flutter/foundation.dart';

class UserPrivider with ChangeNotifier {
  String? Uid;

  String? get uid => Uid;
  void setUid(String uid) {
    Uid = uid;
    notifyListeners();
  }
}

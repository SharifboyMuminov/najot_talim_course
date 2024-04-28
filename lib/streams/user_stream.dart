import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/utils/app_cons.dart';

class UserStream {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Object?>> userStream() {
    return _firebaseFirestore.collection(AppCons.userTableName).snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomStream {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Object?>> chatRoomStream(
      {required String myDocId, required String docId}) {
    String doc = "";
    if (myDocId.codeUnits.first > docId.codeUnits.first) {
      doc = "${myDocId}_$docId";
    } else {
      doc = "${docId}_$myDocId";
    }

    return _firebaseFirestore
        .collection("message")
        .doc(doc)
        .collection("chat_room")
        .orderBy("sort", descending: true)
        .snapshots();
  }
}

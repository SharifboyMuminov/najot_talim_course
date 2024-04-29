import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/models/messege/messege_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<bool> {
  ChatCubit() : super(false);
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static String doc = "";

  Future<void> addMessage(
      {required MessageModel messageModel,
      required String myDocId,
      required String docId}) async {
    if (myDocId.codeUnits.first > docId.codeUnits.first) {
      doc = "${myDocId}_$docId";
    } else {
      doc = "${docId}_$myDocId";
    }

    var cf = await _firebaseFirestore
        .collection("message")
        .doc(doc)
        .collection("chat_room")
        .add(messageModel.toJson());

    await _firebaseFirestore
        .collection("message")
        .doc(doc)
        .collection("chat_room")
        .doc(cf.id)
        .update({"message_id": cf.id});
  }
}

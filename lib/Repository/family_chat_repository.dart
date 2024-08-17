import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FamilyChatRepository {
  final DatabaseReference firestore = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveDataToContactsSubcollection(
    String text,
    DateTime timeSent,
    String providerId,
    String senderName,
    String receiverName,
    String senderProfilePic,
    String receiverProfilePic,
  ) async {
    int timestamp = timeSent.millisecondsSinceEpoch;

    Map<String, dynamic> receiverChatContact = {
      "name": senderName,
      "profilePic": senderProfilePic,
      "timeSent": timestamp,
      "lastMessage": text,
      "familyId": auth.currentUser!.uid,
    };
    await firestore
        .child("Providers")
        .child(providerId)
        .child("chats")
        .child(auth.currentUser!.uid)
        .set(receiverChatContact);

    Map<String, dynamic> senderChatContact = {
      "name": receiverName,
      "receiverProfilePic": receiverProfilePic,
      "timeSent": timestamp,
      "lastMessage": text,
      "providerId": providerId,
    };
    await firestore
        .child("Family")
        .child(auth.currentUser!.uid)
        .child("chats")
        .child(providerId)
        .set(senderChatContact);
  }

  Stream<DatabaseEvent> getFamilyChatStream() {
    String userId = auth.currentUser!.uid;
    DatabaseReference familyChatRef =
        firestore.child("Family").child(userId).child("chats");

    return familyChatRef.orderByChild("timeSent").onValue;
  }
}

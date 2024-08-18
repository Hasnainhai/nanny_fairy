import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class ProviderChatRepository {
  final DatabaseReference firestore = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveDataToContactsSubcollection(
    String text,
    DateTime timeSent,
    String familyId,
    String senderName,
    String receiverName,
    String senderProfilePic,
    String receiverProfilePic,
  ) async {
    try {
      int timestamp = timeSent.millisecondsSinceEpoch;

      // Update the last message and time in both the Providers and Family nodes
      Map<String, dynamic> receiverChatContact = {
        "name": senderName,
        "profilePic": senderProfilePic,
        "timeSent": timestamp,
        "lastMessage": text,
        "familyId": familyId,
        "isSeen": false,
      };

      Map<String, dynamic> senderChatContact = {
        "name": receiverName,
        "profilePic": receiverProfilePic,
        "timeSent": timestamp,
        "lastMessage": text,
        "providerId": auth.currentUser!.uid,
      };

      // Use update instead of set to avoid overwriting the entire node
      await firestore
          .child("Providers")
          .child(auth.currentUser!.uid)
          .child("chats")
          .child(familyId)
          .update(receiverChatContact);

      await firestore
          .child("Family")
          .child(familyId)
          .child("chats")
          .child(auth.currentUser!.uid)
          .update(senderChatContact);

      // Now save the message to the messages node
      await saveMessageToDatabase(
        text,
        timestamp,
        familyId,
      );
    } catch (e) {
      print("Failed to save contact: $e");
    }
  }

  Stream<DatabaseEvent> getFamilyChatStream() {
    String userId = auth.currentUser!.uid;
    DatabaseReference familyChatRef =
        firestore.child("Providers").child(userId).child("chats");

    return familyChatRef.orderByChild("timeSent").onValue;
  }

  Stream<DatabaseEvent> getFamilyChatStreamList(String providerId) {
    String userId = auth.currentUser!.uid;
    DatabaseReference familyChatRef = firestore
        .child("Providers")
        .child(userId)
        .child("chats")
        .child(providerId)
        .child("messages");

    return familyChatRef.orderByChild("timeSent").onValue;
  }

  Future<void> saveMessageToDatabase(
      String text, int timeSent, String familyId) async {
    try {
      var uuid = const Uuid().v1();
      print("Generated UUID: $uuid");

      // Save the message to the messages node for both the Providers and Family nodes
      await firestore
          .child("Providers")
          .child(auth.currentUser!.uid)
          .child("chats")
          .child(familyId)
          .child("messages")
          .child(uuid)
          .set({
        "message": text,
        "timeSent": timeSent,
        'senderId': auth.currentUser!.uid,
        "messageId": uuid,
      });

      await firestore
          .child("Family")
          .child(familyId)
          .child("chats")
          .child(auth.currentUser!.uid)
          .child("messages")
          .child(uuid)
          .set({
        "message": text,
        "timeSent": timeSent,
        'senderId': familyId,
        "messageId": uuid,
      });

      print("Message saved successfully.");
    } catch (e) {
      print("Failed to save message: $e");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/family_chat_repository.dart';

class FamilyChatController with ChangeNotifier {
  final FamilyChatRepository familyChatRepository;

  FamilyChatController({required this.familyChatRepository});

  List<Map<dynamic, dynamic>> _chats = [];
  bool _isLoading = false;

  List<Map<dynamic, dynamic>> get chats => _chats;
  bool get isLoading => _isLoading;

  void loadChats() {
    _isLoading = true;
    notifyListeners();

    familyChatRepository.getFamilyChatStream().listen((event) {
      _chats = [];
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> chatData =
            event.snapshot.value as Map<dynamic, dynamic>;
        chatData.forEach((key, value) {
          _chats.add(value);
        });
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> saveChat(
    String text,
    DateTime timeSent,
    String providerId,
    String senderName,
    String receiverName,
    String senderProfilePic,
    String receiverProfilePic,
  ) async {
    await familyChatRepository.saveDataToContactsSubcollection(
      text,
      timeSent,
      providerId,
      senderName,
      receiverName,
      senderProfilePic,
      receiverProfilePic,
    );
    loadChats(); // Reload chats after saving
  }
}

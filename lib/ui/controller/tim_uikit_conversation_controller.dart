import 'package:tencent_im_base/tencent_im_base.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_conversation_view_model.dart';

class TIMUIKitConversationController {
  late TUIConversationViewModel model;

  /// Get the selected conversation currently
  V2TimConversation? get selectedConversation {
    return model.selectedConversation;
  }

  /// Set the selected conversation currently
  set selectedConversation(V2TimConversation? conversation) {
    model.selectedConversation = conversation;
  }

  /// Get the conversation list
  List<V2TimConversation?> get conversationList {
    return model.conversationList;
  }

  /// Set the conversation list
  set conversationList(List<V2TimConversation?> conversationList) {
    model.conversationList = conversationList;
  }

  /// Load the conversation list to UI
  loadData({int count = 40}) {
    model.loadData(count: count);
  }

  /// Reload the conversation list to UI
  reloadData({int count = 100}) {
    model.refresh(count: count);
  }

  /// Pin one conversation to the top
  Future<V2TimCallback> pinConversation(
      {required String conversationID, required bool isPinned}) {
    return model.pinConversation(
        conversationID: conversationID, isPinned: isPinned);
  }

  /// Pin one conversation to the top
  Future<bool> markConversation(
      {required String conversationID}) {
    return model.markConversation(conversationID: conversationID);
  }

  /// Set the draft for a conversation
  Future<V2TimCallback> setConversationDraft(
      {required String conversationID, String? draftText}) {
    return model.setConversationDraft(
        conversationID: conversationID, draftText: draftText);
  }

  /// Clear the historical message in a specific conversation
  Future<V2TimCallback?>? clearHistoryMessage(
      {required V2TimConversation conversation}) {
    final convType = conversation.type;
    final convID = convType == 1 ? conversation.userID : conversation.groupID;
    if (convType != null && convID != null) {
      return model.clearHistoryMessage(convID: convID, convType: convType);
    }
    return null;
  }

  /// Delete a conversation
  Future<void> deleteConversation({required String conversationID, bool isClearHistory = false}) {
    return model.deleteConversation(conversationID: conversationID, isClearHistory: isClearHistory);
  }

  /// Clear the conversation list from UI
  dispose() {
    model.clearData();
  }

  /// Scroll to a specific conversation, this conversation must be existed in conversation list.
  /// If not exist, invoking `loadData` recursively, until find the target conversation.
  scrollToConversation(String conversationID){
    model.scrollToConversation = conversationID;
  }
}

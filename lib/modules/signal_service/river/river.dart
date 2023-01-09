import 'package:chat_app/modules/signal_service/river/chat_ref/chat_notifier.dart';
import 'package:chat_app/modules/signal_service/river/connection_ref/connection_notifier.dart';
import 'package:chat_app/modules/signal_service/river/message_ref/message_notifier.dart';

import 'chat_ref/chat_state_ref.dart';
import 'message_ref/message_state_ref.dart';
import 'user_ref/user_notifier.dart';
import 'user_ref/user_state_ref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class River {
  static final connectPod =
      StateNotifierProvider<ConnectionNotifier, ConnectionStatus>(
          (ref) => ConnectionNotifier());

  static final userPod = StateNotifierProvider<UserNotifier, UserStateRef>(
      (ref) => UserNotifier());
  static final futureUserPod = FutureProvider<UserStateRef>(
      (ref) => ref.read(userPod.notifier).readUser());

  static final chatPod = StateNotifierProvider<ChatNotifier, ChatStateRef>(
      (ref) => ChatNotifier());
  static final futureChatPod = FutureProvider<ChatStateRef>(
      (ref) => ref.read(chatPod.notifier).readChat());
  static final messagePod =
      StateNotifierProvider<MessageNotifier, MessageStateRef>(
          (ref) => MessageNotifier());
  static final futureMessagePod = FutureProvider<MessageStateRef>(
      (ref) => ref.read(messagePod.notifier).readMessages());
}

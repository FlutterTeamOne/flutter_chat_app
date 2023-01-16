import 'package:chat_app/modules/signal_service/river/chat_ref/chat_notifier.dart';
import 'package:chat_app/modules/signal_service/river/connection_ref/connection_notifier.dart';
import 'package:chat_app/modules/signal_service/river/message_ref/message_notifier.dart';
import 'package:chat_app/modules/signal_service/river/synch_user_ref/synch_state_ref.dart';
import 'package:chat_app/modules/signal_service/river/synch_user_ref/synch_user_notifier.dart';

import 'chat_ref/chat_state_ref.dart';
import 'message_ref/message_state_ref.dart';
import 'user_ref/user_notifier.dart';
import 'user_ref/user_state_ref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class River {
  static final connectPod =
      StateNotifierProvider<ConnectionNotifier, ConnectionStatus>(
          (ref) => ConnectionNotifier());

  static final synchUserPod =
      StateNotifierProvider.autoDispose<SynchUserNotifier, SynchStateRef>(
          (ref) => SynchUserNotifier());

  static final userPod = StateNotifierProvider<UserNotifier, UserStateRef>(
      (ref) => UserNotifier());

  static final chatPod = StateNotifierProvider<ChatNotifier, ChatStateRef>(
      (ref) => ChatNotifier());

  static final messagePod =
      StateNotifierProvider<MessageNotifier, MessageStateRef>(
          (ref) => MessageNotifier());
}

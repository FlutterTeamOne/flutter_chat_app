import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/storage_manager/impl/local_message_impl.dart';

import '../../client/grpc_client.dart';
import '../../library.dart';
import '../../services/message_service.dart';
import '../../src/db_server/database_helper/messages/messages_imp.dart';
import '../../storage_manager/db_helper.dart';
import '../../utils/convert_helper.dart';

part 'msg_event.dart';
part 'msg_state.dart';

class MsgBloc extends Bloc<MsgEvent, MsgState> {
  late LocalMessagesServices _messagesServices;
  late StreamSubscription _subscription;
  final GrpcClient grpcClient;

  MsgBloc({required this.grpcClient}) : super(MsgState()) {
    _messagesServices = LocalMessagesServices(
      channel: GrpcClient().channel,
    );
    // _subscription = _messageService.onMessagesStream().listen((value) {
    //   add(ReadMessageEvent(messages: value.messages));
    //   print('MESSAGE: ${value.messages}');
    // });
    _subscription =
        DBHelper.instanse.updateListenController.stream.listen((event) async {
      if (event == true) {
        add(ReadMessageEvent(
            messages: await _messagesServices.getAllMessages()));
      }
    });
    on<ReadMessageEvent>(_onReadMessageEvent);
    on<CreateMessageEvent>(_onCreateMessageEvent);
  }

  FutureOr<void> _onReadMessageEvent(
      ReadMessageEvent event, Emitter<MsgState> emit) async {
    if (event.messages == null) {
      var messages = await _messagesServices.getAllMessages();
      print(messages);
      emit(state.copyWith(messages: messages));
    } else {
      emit(state.copyWith(messages: event.messages));
      print(event.messages);
    }
  }

  FutureOr<void> _onCreateMessageEvent(
      CreateMessageEvent event, Emitter<MsgState> emit) async {
    var message = event.message;
    var model = message.writeToJsonMap();
    print('MESSAGE: $message');
    // DBHelper.instanse
    //     .onAdd(tableName: 'messages', model: messageMapToDB(model));
    _messagesServices.addNewMessage(
      localChatId: 2,
      senderId: 1,
      content: message.content,
      date: message.date,
    );
    // MessagesServices().addNewMessage(
    //   friendsChatId: 2,
    //   senderId: 1,
    //   content: message.content,
    //   date: message.date,
    // );
    print('MODEL: $model');
    // _messagesServices.onCreateMessage(
    //     userMainId1: message.userMainId1,
    //     userMainId12: message.userMainId2,
    //     senderMainId: message.senderMainId,
    //     content: message.content,
    //     date: message.date);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

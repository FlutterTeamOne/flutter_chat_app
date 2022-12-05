import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/grpc_client.dart';
import '../../library.dart';
import '../../services/message_service.dart';
import '../../src/db_server/database_helper/messages/messages_imp.dart';
import '../../storage_manager/db_helper.dart';
import '../../utils/convert_helper.dart';

part 'msg_event.dart';
part 'msg_state.dart';

class MsgBloc extends Bloc<MsgEvent, MsgState> {
  late MessageService _messageService;
  late StreamSubscription _subscription;
  final GrpcClient grpcClient;

  MsgBloc({required this.grpcClient}) : super(MsgState()) {
    _messageService = MessageService(
      channel: GrpcClient().channel,
    );
    // _subscription = _messageService.onMessagesStream().listen((value) {
    //   add(ReadMessageEvent(messages: value.messages));
    //   print('MESSAGE: ${value.messages}');
    // });
    on<ReadMessageEvent>(_onReadMessageEvent);
    on<CreateMessageEvent>(_onCreateMessageEvent);
  }

  FutureOr<void> _onReadMessageEvent(
      ReadMessageEvent event, Emitter<MsgState> emit) async {
    if (event.messages == null) {
      // emit(state.copyWith(messages: await _messageService.onCreateMessage(content: content, date: date)));
      print(event.messages);
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
    MessagesServices().addNewMessage(
      friendsChatId:2 ,senderId: 1,content: message.content,date:message.date
    );
    print('MODEL: $model');

    _messageService.onCreateMessage(
        userMainId1: message.userMainId1,
        userMainId12: message.userMainId2,
        senderMainId: message.senderMainId,
        content: message.content,
        date: message.date);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

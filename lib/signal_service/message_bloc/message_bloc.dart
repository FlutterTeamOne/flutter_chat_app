import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/grpc_client.dart';
import '../../library.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  late LocalMessagesServices _messagesServices;
  late MessageIdServices _messageIdServices;
  late StreamSubscription _subscription;
  final GrpcClient grpcClient;

  MessageBloc({required this.grpcClient}) : super(MessageState()) {
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
      ReadMessageEvent event, Emitter<MessageState> emit) async {
    var message = LocalMessagesServices(channel: GrpcClient().channel);
    var chats = LocalChatServices(channel: GrpcClient().channel);
    print(message.getAllMessages());
    print(chats.getMainIdChatByMessage(localId: 2));
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
      CreateMessageEvent event, Emitter<MessageState> emit) async {
    var message = event.message;
    var model = message.writeToJsonMap();
    var chats = LocalChatServices(channel: GrpcClient().channel);
    print('MESSAGE: $message');
    // DBHelper.instanse
    //     .onAdd(tableName: 'messages', model: messageMapToDB(model));
    var messageBase = await _messagesServices.addNewMessage(
      localChatId: event.idChat,
      senderId: 1,
      content: message.content,
      date: message.date,
    );

    var messageToServer = Message();
    messageToServer.chatIdMaint =
        await chats.getMainIdChatByMessage(localId: event.idChat);
    messageToServer.content = messageBase.content;
    messageToServer.date = messageBase.date;
    messageToServer.senderMainId = messageBase
        .senderMainId; //Заменить за запрос поиск main_users_id по local_user_id

    var messageOk =
        await GrpcChatClient(grpcClient.channel).createMessage(messageToServer);
    if (messageOk.ok) {
      var updateWrittenToServer = _messagesServices.updateWrittenToServer(
          localMessageId: messageBase.id, isWrittenToDB: messageOk.ok as int);
      print('UPDATE WRITTEN TO SERVER: $updateWrittenToServer');
      var createMessageId = _messageIdServices.createMessageId(
          mainId: messageOk.mainMessagesId, localId: messageBase.id);
      print('CREATE MESSAGE ID $createMessageId');
    }
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

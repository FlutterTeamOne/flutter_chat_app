import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:grpc/grpc_connection_interface.dart';

import '../../../../src/generated/grpc_manager/grpc_manager.pbgrpc.dart';
import '../../../../src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  late LocalMessagesServices _messagesServices;
  late MessageIdServices _messageIdServices;
  late StreamSubscription _subscription;
  StreamController<List<MessageDto>> messageController =
      StreamController.broadcast();
  final GrpcClient grpcClient;

  MessageBloc({required this.grpcClient}) : super(MessageState()) {
    _messagesServices = LocalMessagesServices();
    // _subscription = _messageService.onMessagesStream().listen((value) {
    //   add(ReadMessageEvent(messages: value.messages));
    //   print('MESSAGE: ${value.messages}');
    // });

    grpcClient.channel.getConnection();
    grpcClient.channel.onConnectionStateChanged.asBroadcastStream(
      onListen: (subscription) {
        subscription.resume();
        subscription.onData((data) {
          print('DATA $data');
        });
      },
    );
   
    _messageIdServices = MessageIdServices();
    _subscription =
        DBHelper.instanse.updateListenController.stream.listen((event) async {
      if (event == true) {
        var messages = await _messagesServices.getAllMessages();
        // messages.sort((a, b) => a.localMessageId!.compareTo(b.localMessageId!));
        print('sort message:$messages');
        add(ReadMessageEvent(messages: messages));
        // state.copyWith(messages: messages);
      }
    });

    on<ReadMessageEvent>(_onReadMessageEvent);
    on<CreateMessageEvent>(_onCreateMessageEvent);
    on<UpdateMessageEvent>(_onUpdateMessageEvent);
//TODO:добавить удаление сообщения
    on<DeleteMessageEvent>(_onDeleteMessageEvent);
    on<DeleteHistoryMessageEvent>(_onDeleteHistoryMessageEvent);
  }

  FutureOr<void> _onReadMessageEvent(
      ReadMessageEvent event, Emitter<MessageState> emit) async {
    // print(await message.getAllMessages());
     grpcClient.channel.onConnectionStateChanged.listen((event) {
      print('ON LISTEN $event');
    });
    grpcClient.channelState.listen((item) => print('ITEM LISTEN $item'));
    print('OnConnection: ${grpcClient.channel.onConnectionStateChanged}');
    print('STATE CONNECT :${grpcClient.channelState}');
    grpcClient.channelState.forEach((element) {
      print("ELEMENT $element");
    });
    grpcClient.channelState.listen((event) {
      print('EVENT $event');
    });
    if (event.messages == null) {
      var messages = await _messagesServices.getAllMessages();
      print("MESSAGES:$messages");

      messageController.add(messages);
      emit(state.copyWith(messages: messages));
    } else {
      print('EVENT MSG: ${event.messages}');
      emit(state.copyWith(messages: event.messages));
    }
  }

  FutureOr<void> _onCreateMessageEvent(
      CreateMessageEvent event, Emitter<MessageState> emit) async {
    var message = event.message;
    // var model = message.writeToJsonMap();
    var chats = LocalChatServices();
    print('MESSAGE: $message');
    // DBHelper.instanse
    //     .onAdd(tableName: 'messages', model: messageMapToDB(model));
    message.localMessageId = await _messagesServices.addNewMessage(
      localChatId: message.localChatId,
      senderId: 1,
      content: message.content,
      date: message.date,
    );
    var messageToServer = Message();
    messageToServer.chatIdMaint =
        await chats.getMainIdChatByMessage(localId: message.localChatId);
    messageToServer.content = message.content;
    messageToServer.date = message.date;
    messageToServer.senderMainId =
        await localUsersServices.getMainIdUserByLocalId(localId: 1);
    print('message to server \n $messageToServer');

    try {
      var messageOk = await GrpcChatClient(grpcClient.channel)
          .createMessage(messageToServer);
      print("messageOK:/n $messageOk");
      if (messageOk.ok) {
        await _messagesServices.updateWrittenToServer(
            localMessageId: message.localMessageId!, isWrittenToDB: 1);
        emit(state.copyWith(
            messages: await localMessagesServices.getAllMessages()));
        var updateWrittenToServer =
            await _messagesServices.getMessageById(id: message.localMessageId!);
        print('UPDATE WRITTEN TO SERVER: $updateWrittenToServer');
        var createMessageId = await _messageIdServices.createMessageId(
            mainId: messageOk.mainMessagesId, localId: message.localMessageId!);
        print('CREATE MESSAGE ID $createMessageId');
      }
    } catch (e) {
      print(e);
    }
  }

  ///Обновление сообщения
  FutureOr<void> _onUpdateMessageEvent(
      UpdateMessageEvent event, Emitter<MessageState> emit) async {
    if (event.isEditing == EditState.isPreparation) {
      emit(state.copyWith(
          editState: EditState.isPreparation, messageId: event.messageId));
    }
    if (event.isEditing == EditState.isEditing) {
      await _messagesServices.updateMessage(
          message: event.message!, localMessageId: state.messageId!);
      emit(state.copyWith(editState: EditState.isNotEditing));
    }
    //TODO: запрос на редактирование сообщение на сервере
  }

  ///Удаление сообщения по ид
  FutureOr<void> _onDeleteMessageEvent(
      DeleteMessageEvent event, Emitter<MessageState> emit) async {
    await _messagesServices.deleteMessage(id: event.messageId);
    add(ReadMessageEvent());
    print('message ID: ${event.messageId}');
    //TODO: отправить запрос в grpc на удаление сообщения и получить ответ
  }

  ///Очистка истории в определенном чате
  FutureOr<void> _onDeleteHistoryMessageEvent(
      DeleteHistoryMessageEvent event, Emitter<MessageState> emit) async {
    await _messagesServices.deleteAllMessagesInChat(chatID: event.chatID);
    print('CHAT ID: ${event.chatID}');
    add(ReadMessageEvent());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

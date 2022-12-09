import 'dart:async';
import '../../../../src/generated/grpc_manager/grpc_manager.pbgrpc.dart';
import '../../../../src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  late LocalMessagesServices _messagesServices;
  late MessageIdServices _messageIdServices;
  late StreamSubscription _subscription;
  final GrpcClient grpcClient;

  MessageBloc({required this.grpcClient}) : super(MessageState()) {
    _messagesServices = LocalMessagesServices();
    // _subscription = _messageService.onMessagesStream().listen((value) {
    //   add(ReadMessageEvent(messages: value.messages));
    //   print('MESSAGE: ${value.messages}');
    // });
    _messageIdServices = MessageIdServices();
    _subscription =
        DBHelper.instanse.updateListenController.stream.listen((event) async {
      if (event == true) {
        add(ReadMessageEvent(
            messages: await _messagesServices.getAllMessages()));
      }
    });
    on<ReadMessageEvent>(_onReadMessageEvent);
    on<CreateMessageEvent>(_onCreateMessageEvent);
//TODO: добавить редактирование сообщения
    on<UpdateMessageEvent>(_onUpdateMessageEvent);
//TODO:добавить удаление сообщения
    on<DeleteMessageEvent>(_onDeleteMessageEvent);
  }

  FutureOr<void> _onReadMessageEvent(
      ReadMessageEvent event, Emitter<MessageState> emit) async {
    // print(await message.getAllMessages());
    // if (event.messages == null) {
    var messages = await _messagesServices.getAllMessages();
    print("MESSAGES:$messages");
    emit(state.copyWith(messages: messages));
    // } else {
    //   emit(state.copyWith(messages: event.messages));
    //   print(event.messages);
    // }
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

  FutureOr<void> _onUpdateMessageEvent(
      UpdateMessageEvent event, Emitter<MessageState> emit) async {
    await _messagesServices.updateMessage(
        newValues: event.message.content, localMessageId: event.messageId);
  }

  FutureOr<void> _onDeleteMessageEvent(
      DeleteMessageEvent event, Emitter<MessageState> emit) async {
    await _messagesServices.deleteMessage(id: event.messageId);
    add(ReadMessageEvent());
    print('message ID: ${event.messageId}');
    //TODO: отправить запрос в grpc на удаление сообщения и получить ответ
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

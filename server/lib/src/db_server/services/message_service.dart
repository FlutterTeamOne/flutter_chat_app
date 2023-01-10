import 'dart:async';

import 'package:server/src/library/library_server.dart';

class MessageService {
  MessageService._();

  static Future onCreateMessage(
      {required StreamController<DynamicResponse> controller,
      required StreamController<DynamicResponse> clientController,
      required DynamicRequest req}) async {
    print('for Each Create');
    var message = DynamicResponse();
    if (controller != clientController) {
      message = DynamicResponse(
          readMessage: ReadMessageResponse(message: req.createMessage.message),
          messageState: MessageStateEnum.isReadMessage);
      print(message.messageState);
      controller.sink.add(message);
    } else {
      print('CREATE MSG: ${req.createMessage.message}');
      message = DynamicResponse(
          createMessage:
              CreateMessageResponse(message: req.createMessage.message),
          messageState: MessageStateEnum.isCreateMessage);
      print(message.messageState);
      controller.sink.add(message);
    }
  }

  static Future onUpdateMessage(
      {required StreamController<DynamicResponse> controller,
      required StreamController<DynamicResponse> clientController,
      required DynamicRequest req}) async {
    print('for Each Update');
    var timeUpdate = DateTime.now().toIso8601String();
    await MessagesDBServices().updateMessage(
        newValues:
            "content = '${req.updateMessage.content}', updated_date = '$timeUpdate'",
        condition: "message_id = ${req.updateMessage.idMessageMain}");
    var updateMessage = DynamicResponse();
    if (controller != clientController) {
      updateMessage = DynamicResponse(
        updateMessage: UpdateMessageResponse(
            dateUpdate: timeUpdate,
            content: req.updateMessage.content,
            idMessageMain: req.updateMessage.idMessageMain),
        messageState: MessageStateEnum.isUpdateMessage,
      );
      controller.add(updateMessage);
    } else {
      updateMessage = DynamicResponse(
          updateMessage: UpdateMessageResponse(
              content: req.updateMessage.content,
              dateUpdate: timeUpdate,
              idMessageMain: req.updateMessage.idMessageMain),
          messageState: MessageStateEnum.isUpdateMessage);
      controller.add(updateMessage);
    }
  }

  static Future onDeleteMessage(
      {required StreamController<DynamicResponse> controller,
      required StreamController<DynamicResponse> clientController,
      required DynamicRequest req}) async {
    var dateDelete = DateTime.now().toIso8601String();
    await MessagesDBServices().updateMessage(
        newValues: "deleted_date = '$dateDelete', updated_date = '$dateDelete'",
        condition: 'message_id=${req.deleteMessage.idMessageMain}');
    if (controller != clientController) {
      var delMsg = DynamicResponse(
          deleteMessage: DeleteMessageResponse(
            idMessageMain: req.deleteMessage.idMessageMain,
            dateDelete: dateDelete,
          ),
          messageState: MessageStateEnum.isDeleteMesage);
      controller.add(delMsg);
    } else {}
  }
}

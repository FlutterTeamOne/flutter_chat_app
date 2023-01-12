// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/src/generated/messages/messages.pbgrpc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MessageDto messageDto = MessageDto(chatId: 1, senderId: 1, content: "Hello");
  setUpAll(() async {
    /// TODO refactor print
    print("test start");
  });
  tearDownAll(() {
    /// TODO refactor print
    print("test end");
  });
  group("MessageDto tests", () {
    test('CopyWith response', () async {
      var actual = messageDto.copyWith();
      expect(actual, messageDto);

      actual = messageDto.copyWith(
          localMessageId: 1,
          chatId: 1,
          senderId: 1,
          messageId: 1,
          createdDate: '',
          content: '',
          attachId: 2,
          updatedDate: '',
          deletedDate: '',
          isRead: 0,
          contentType: ContentType.isText);
      expect(
          actual,
          MessageDto(
              localMessageId: 1,
              chatId: 1,
              senderId: 1,
              messageId: 1,
              createdDate: '',
              content: '',
              attachId: 2,
              updatedDate: '',
              deletedDate: '',
              isRead: 0,
              contentType: ContentType.isText));
    });

    test('ToMap', () async {
      var actual = messageDto.toMap();

      expect(actual, {
        'local_messages_id': null,
        'chat_id': 1,
        'sender_id': 1,
        'created_date': null,
        'content': 'Hello',
        'message_id': null,
        'updated_date': null,
        'deleted_date': null,
        'attachment_id': null,
        'is_read': 0,
        'content_type': 'isText'
      });
    });

    ///
    ///Проблема с логикой, проверки на null
    ///
    // test('FromMap', () async {
    //   var map = messageDto.toMap();
    //   print(map);
    //   var actual = MessageDto.fromMap(map);

    //   expect(actual, messageDto);
    // });

    test('Test operator == ', () async {
      MessageDto messageDto1 =
          MessageDto(chatId: 1, senderId: 1, content: "Hello");
      MessageDto messageDto2 =
          MessageDto(chatId: 2, senderId: 1, content: "Hello");
      var actual = messageDto == messageDto1;
      expect(actual, true);
      actual = messageDto == messageDto2;
      expect(actual, false);
    });

    test('Test for getter hashCode', () async {
      var actual = messageDto.hashCode;

      expect(
          actual,
          messageDto.localMessageId.hashCode ^
              messageDto.chatId.hashCode ^
              messageDto.senderId.hashCode ^
              messageDto.messageId.hashCode ^
              messageDto.createdDate.hashCode ^
              messageDto.updatedDate.hashCode ^
              messageDto.deletedDate.hashCode ^
              messageDto.isRead.hashCode ^
              messageDto.content.hashCode ^
              messageDto.attachId.hashCode ^
              messageDto.contentType.hashCode);
    });

    test('ToString', () async {
      var actual = messageDto.toString();

      /// TODO refactor print
      print(actual);

      expect(actual,
          'MessageDto(localMessageId: null, chatId: 1, senderId: 1, messageId: null, content: Hello, createdDate: null, updatedDate: null, deletedDate: null, isRead: 0)');
    });

    test('toJson', () async {
      var actual = messageDto.toJson();

      expect(
          actual,
          json.encode({
            "local_messages_id": null,
            "chat_id": 1,
            "sender_id": 1,
            "created_date": null,
            "content": "Hello",
            "message_id": null,
            "updated_date": null,
            "deleted_date": null,
            "attachment_id": null,
            "is_read": 0,
            "content_type": "isText"
          }));
    });

    ///
    ///Проблема с логикой, проверки на null
    ///
    // test('fromJson', () async {

    //   var toJson = messageDto.toJson();
    //   var actual = MessageDto.fromJson(toJson);

    //   expect(actual, messageDto);
    // });
  });
}

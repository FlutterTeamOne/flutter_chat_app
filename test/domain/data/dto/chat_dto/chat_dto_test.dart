import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ChatDto chatModel =
      ChatDto(userIdChat: 1, createdDate: 'date', updatedDate: 'date');

  group("ChatDto tests", () {
    test('CopyWith response', () async {
      var actual = chatModel.copyWith();
      expect(actual, chatModel);

      actual = chatModel.copyWith(
        chatId: 1,
        createdDate: '',
        updatedDate: '',
        deletedDate: '',
      );
      expect(
          actual,
          ChatDto(
            userIdChat: 1,
            chatId: 1,
            createdDate: '',
            updatedDate: '',
            deletedDate: '',
          ));
    });

    test('ToMap', () async {
      var actual = chatModel.toMap();

      expect(actual, {
        DatabaseConst.chatsColumnChatId: null,
        DatabaseConst.chatsColumnUserId: 1,
        DatabaseConst.chatsColumnCreatedDate: 'date',
        DatabaseConst.chatsColumnUpdatedDate: 'date',
        DatabaseConst.chatsColumnDeletedDate: null
      });
    });

    test('FromMap', () async {
      var chatMap = {
        DatabaseConst.chatsColumnChatId: 1,
        DatabaseConst.chatsColumnUserId: 1,
        DatabaseConst.chatsColumnCreatedDate: 'date',
        DatabaseConst.chatsColumnUpdatedDate: 'date',
        DatabaseConst.chatsColumnDeletedDate: ''
      };
      var actual = ChatDto.fromMap(chatMap);

      expect(
          actual,
          ChatDto(
              userIdChat: 1,
              chatId: 1,
              createdDate: 'date',
              updatedDate: 'date',
              deletedDate: ''));
    });

    test('Test operator == ', () async {
      ChatDto chat1 = ChatDto(
        userIdChat: 1,
        chatId: 1,
        createdDate: 'date',
        updatedDate: 'date',
      );
      ChatDto chat2 = ChatDto(
        userIdChat: 2,
        chatId: 2,
        createdDate: 'date',
        updatedDate: 'date',
      );
      ChatDto chat3 = ChatDto(
        userIdChat: 1,
        chatId: 1,
        createdDate: 'date',
        updatedDate: 'date',
      );
      var actual = chat1 == chat3;
      expect(actual, true);
      actual = chat1 == chat2;
      expect(actual, false);
    });

    test('Test for getter hashCode', () async {
      var actual = chatModel.hashCode;

      expect(
          actual,
          chatModel.chatId.hashCode ^
              chatModel.userIdChat.hashCode ^
              chatModel.createdDate.hashCode ^
              chatModel.updatedDate.hashCode ^
              chatModel.deletedDate.hashCode);
    });

    test('ToString', () async {
      var actual = chatModel.toString();

      expect(actual,
          'ChatDto(ChatId: null, userId: 1, createdDate: date, updatedDate: date, deletedDate: null)');
    });

    test('toJson', () async {
      var actual = chatModel.toJson();
      expect(actual, '{"chat_id":null,"user_id":1,"created_date":"date","update_date":"date","deleted_date":null}');
    });
  });
}

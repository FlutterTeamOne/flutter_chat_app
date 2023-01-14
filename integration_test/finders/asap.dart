import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'finders.dart';

class AsapFinder extends TestFinder {
  //кнопка asap page
  final Finder asapPageButton = find.byIcon(Icons.chat_bubble_outline_rounded);

  //поиск userCardWidget
  final Finder userCardWidget = find.byType(UserCardWidget);

  //userCardWidget с первым другом
  final Finder firstUserCard = find.byKey(const Key('userCardWidget 0'));

  //текст филд ввода сообщения
  final Finder messageInputField = find.byKey(const Key('messageInputField'));

  //кнопка отправки сообщения
  final Finder sendMessageButton = find.byKey(const Key('sendMessageButton'));

  //кнопка выбора картинки в сообщениях
  final Finder chooseImageButton = find.byIcon(Icons.emoji_emotions_outlined);
}

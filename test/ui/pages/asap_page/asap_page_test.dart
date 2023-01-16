import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/ui/pages/asap_page/layouts/chat_list_layout.dart';
import 'package:chat_app/ui/pages/asap_page/layouts/default_user_chat_layout.dart';
import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/add_chat_dialog_widget.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/search_field.dart';
import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();

  List<ChatDto> chats = [];
  List<MessageDto> messages = [];
  const testKey = Key('K');
  var userCardWidget = UserCardWidget(
    name: 'name',
    image: 'https://compressjpeg.com/images/compressjpeg/icon.png',
    message: 'message',
    onTap: () {},
    selected: true,
    sender: 'sender',
    updatedDate: DateTime.now().toIso8601String(),
    isSuccess: 1,
  );
  var addChatDialogWidget = AddChatDialogWidget(val: 0);
  var searchFieldWidget = const SearchFieldWidget();
  var circleIndicatorWidget = const CircularProgressIndicator();
  var defaultUserChatWidget = const DefaultUserChatLayout();

  var chatListWidget = ChatListLayout(
    messageModel: messages,
  );

  group('Asap Page', () {
    testWidgets('find widget by key', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(
          child: MaterialApp(
        key: testKey,
        home: AsapPage(),
      )));
      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('finds a chatListWidget', (tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(
              home: Scaffold(
                  body: Center(
        child: Row(children: [chatListWidget]),
      )))));
      expect(find.byWidget(chatListWidget), findsOneWidget);
    });

    testWidgets('finds a circleProgressIndicator', (tester) async {
      await tester.pumpWidget(Container(
        child: circleIndicatorWidget,
      ));
      expect(find.byWidget(circleIndicatorWidget), findsOneWidget);
    });

    testWidgets('finds a defaultChatUserWidget', (tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(home: Scaffold(body: defaultUserChatWidget))));
      expect(find.byWidget(defaultUserChatWidget), findsOneWidget);
    });

    testWidgets('finds a chatAppBarWidget', (tester) async {
      await tester.pumpWidget(const ChatAppWidgetTest());
      expect(find.byType(ChatAppBarWidget), findsOneWidget);
    });

    testWidgets('finds a userCardWidget', (tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(home: Scaffold(body: userCardWidget))));
      expect(find.byWidget(userCardWidget), findsOneWidget);
    });

    testWidgets('finds a searchFieldWidget', (tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(home: Scaffold(body: searchFieldWidget))));
      expect(find.byWidget(searchFieldWidget), findsOneWidget);
    });

    testWidgets('finds a addChatDialogWidget', (tester) async {
      await tester.pumpWidget(ProviderScope(
          child: MaterialApp(home: Scaffold(body: addChatDialogWidget))));
      expect(find.byWidget(addChatDialogWidget), findsOneWidget);
    });
  });
}

class ChatAppWidgetTest extends ConsumerStatefulWidget {
  const ChatAppWidgetTest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatAppWidgetTestState();
}

class _ChatAppWidgetTestState extends ConsumerState<ChatAppWidgetTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(builder: (context, ref, _) {
        return Scaffold(
          body: Center(
              child: ChatAppBarWidget(
            chatId: 1,
            image: 'https://www.iconsdb.com/icons/preview/red/cancel-xxl.png',
            myChat: true,
            name: 'My Favorite Chat',
            ref: ref,
          )),
        );
      }),
    );
  }
}

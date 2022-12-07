// import 'package:bloc/bloc.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_chat_app/sending_manager/bloc/sending_message/sending_message_bloc.dart';
// import 'package:flutter_chat_app/sending_manager/bloc/sending_message/sending_message_event.dart';
// import 'package:flutter_chat_app/sending_manager/bloc/sending_message/sending_message_state.dart';
// import 'package:flutter_chat_app/src/generated/grpc_chat.pb.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// class MockNewMessageBloc
//     extends MockBloc<SendingMessageEvent, SendingMessageState>
//     implements SendingMessageBloc {}
//
// void main() {
//   group('Bloc test new message', () {
//     blocTest<SendingMessageBloc, SendingMessageState>(
//       'New message',
//       build: () => SendingMessageBloc(),
//       act: (bloc) async {
//
//         bloc.add(NewMessageEvent());
//       },
//       expect: () => SendingMessageState(),
//     );
//   });
// }

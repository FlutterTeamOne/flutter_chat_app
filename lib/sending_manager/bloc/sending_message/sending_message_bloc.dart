// import 'dart:async';

// import 'package:bloc/bloc.dart';

// import 'package:flutter_chat_app/client/grpc_client.dart';
// import 'sending_message_event.dart';
// import 'sending_message_state.dart';
// import 'package:flutter_chat_app/sending_manager/connection_bloc/connection_bloc.dart';
// import 'package:flutter_chat_app/src/libs/protoc_lib.dart';

// class SendingMessageBloc
//     extends Bloc<SendingMessageEvent, SendingMessageState> {
//   late ConnectionBloc connectionBloc;

//   SendingMessageBloc() : super(SendingMessageState()) {
//     on<NewMessageEvent>(onNewMessageEvent);
//   }

//   FutureOr<void> onNewMessageEvent(
//       NewMessageEvent event, Emitter<SendingMessageState> emit) {
//     // Listen for connect signal
//     connectionBloc.stream.listen((connect) {
//       // Check connect and message
//       if (connect is ActiveConnectionState && event.message != null) {
//         GrpcClient client = GrpcClient();
//         final newMessage = event.message;
//         client.SendMessage(newMessage);
//         emit(SendingMessageState(message: newMessage));
//       }
//     });
//   }
// }

// part of 'message_bloc.dart';

// abstract class MessageEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class CreateMessageEvent extends MessageEvent {
//   final MessageDto? message;
//   final String? mediaPath;
//   final MediaState? mediaState;
//   final ContentType? contentType;

//   CreateMessageEvent({
//     this.message,
//     this.mediaPath,
//     this.mediaState,
//     this.contentType,
//   });

//   @override
//   List<Object?> get props => [message, mediaPath, mediaState, contentType];
// }

// class ReadMessageEvent extends MessageEvent {
//   final List<MessageDto>? messages;

//   ReadMessageEvent({this.messages});
//   @override
//   List<Object?> get props => [messages];
// }

// class UpdateMessageEvent extends MessageEvent {
//   final MessageDto? message;
//   final int? messageId;
//   final EditState? isEditing;

//   UpdateMessageEvent({this.message, this.messageId, this.isEditing});
//   @override
//   List<Object?> get props => [message, messageId, isEditing];
// }

// class DeleteMessageEvent extends MessageEvent {
//   final int messageId;

//   DeleteMessageEvent({required this.messageId});
//   @override
//   List<Object?> get props => [messageId];
// }

// class DeleteHistoryMessageEvent extends MessageEvent {
//   final int chatID;

//   DeleteHistoryMessageEvent(this.chatID);
//   @override
//   List<Object?> get props => [chatID];
// }

// class MessageStreamEvent extends MessageEvent {
//   @override
//   List<Object> get props => [];
// }

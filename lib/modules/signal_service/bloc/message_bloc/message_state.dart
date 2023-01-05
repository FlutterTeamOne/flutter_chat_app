// part of 'message_bloc.dart';

// enum EditState { isEditing, isNotEditing, isPreparation }

// enum MediaState { isPreparation, isSending, isCanceled }

// enum DeleteState { isDeleted, isRemoval, isPrepatation }

// class MessageState extends Equatable {
//   final List<MessageDto>? messages;
//   final EditState editState;
//   final DeleteState deleteState;
//   final MediaState mediaState;
//   final int? messageId;
//   final String? mediaPath;
//   const MessageState({
//     this.messages,
//     this.editState = EditState.isNotEditing,
//     this.deleteState = DeleteState.isRemoval,
//     this.mediaState = MediaState.isCanceled,
//     this.messageId,
//     this.mediaPath,
//   });

//   MessageState copyWith({
//     List<MessageDto>? messages,
//     EditState? editState,
//     DeleteState? deleteState,
//     MediaState? mediaState,
//     int? messageId,
//     String? mediaPath,
//   }) {
//     return MessageState(
//       messages: messages ?? this.messages,
//       editState: editState ?? this.editState,
//       deleteState: deleteState ?? this.deleteState,
//       mediaState: mediaState ?? this.mediaState,
//       messageId: messageId ?? this.messageId,
//       mediaPath: mediaPath ?? this.mediaPath,
//     );
//   }

//   @override
//   List<Object?> get props =>
//       [messages, editState, messageId, mediaState, deleteState, mediaPath];
// }

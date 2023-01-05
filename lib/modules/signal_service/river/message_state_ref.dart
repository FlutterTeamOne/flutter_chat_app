import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:equatable/equatable.dart';

enum EditState { isEditing, isNotEditing, isPreparation }

enum MediaState { isPreparation, isSending, isCanceled }

enum DeleteState { isDeleted, isRemoval, isPrepatation }

class MessageStateRef extends Equatable {
  final List<MessageDto>? messages;
  final EditState editState;
  final DeleteState deleteState;
  final MediaState mediaState;
  final int? messageId;
  final String? mediaPath;
  const MessageStateRef({
    this.messages,
    this.editState = EditState.isNotEditing,
    this.deleteState = DeleteState.isRemoval,
    this.mediaState = MediaState.isCanceled,
    this.messageId,
    this.mediaPath,
  });

  MessageStateRef copyWith({
    List<MessageDto>? messages,
    EditState? editState,
    DeleteState? deleteState,
    MediaState? mediaState,
    int? messageId,
    String? mediaPath,
  }) {
    return MessageStateRef(
      messages: messages ?? this.messages,
      editState: editState ?? this.editState,
      deleteState: deleteState ?? this.deleteState,
      mediaState: mediaState ?? this.mediaState,
      messageId: messageId ?? this.messageId,
      mediaPath: mediaPath ?? this.mediaPath,
    );
  }

  @override
  List<Object?> get props =>
      [messages, editState, messageId, mediaState, deleteState, mediaPath];
}

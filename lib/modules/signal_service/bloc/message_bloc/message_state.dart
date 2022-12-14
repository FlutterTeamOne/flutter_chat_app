part of 'message_bloc.dart';

enum EditState { isEditing, isNotEditing, isPreparation }

enum DeleteState { isDeleted, isRemoval, isPrepatation }

class MessageState extends Equatable {
  final List<MessageDto>? messages;
  final EditState editState;
  final DeleteState deleteState;
  final int? messageId;
  const MessageState({
    this.messages,
    this.editState = EditState.isNotEditing,
    this.deleteState = DeleteState.isRemoval,
    this.messageId,
  });

  MessageState copyWith({
    List<MessageDto>? messages,
    EditState? editState,
    DeleteState? deleteState,
    int? messageId,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
      editState: editState ?? this.editState,
      deleteState: deleteState ?? this.deleteState,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  List<Object?> get props => [messages, editState, messageId];
}

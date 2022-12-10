part of 'message_bloc.dart';

enum EditState { isEditing, isNotEditing, isPreparation }

class MessageState extends Equatable {
  final List<MessageDto>? messages;
  final EditState editState;
  final int? messageId;
  const MessageState({
    this.messages,
    this.editState = EditState.isNotEditing,
    this.messageId,
  });

  MessageState copyWith({
    List<MessageDto>? messages,
    EditState? editState,
    int? messageId,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
      editState: editState ?? this.editState,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  List<Object?> get props => [messages, editState, messageId];
}

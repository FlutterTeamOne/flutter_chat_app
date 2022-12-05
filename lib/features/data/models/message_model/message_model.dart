class MessageModel {
  final String message;
  final bool isSentByMe;
  final DateTime date;

  MessageModel({
    required this.message,
    required this.isSentByMe,
    required this.date,
  });
}

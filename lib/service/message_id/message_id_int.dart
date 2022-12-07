import '../lib_db.dart';

abstract class IMessageIdServices {
  factory IMessageIdServices() => MessageIdServices();
  createMessageId({required int mainId, required int localId});

  updateMessageId({required String newValues, required String condition});

  deleteMessageId({required int mainId});
}

final messageIdServices = IMessageIdServices();

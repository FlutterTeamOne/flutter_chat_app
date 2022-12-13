import 'model_dto.dart';

class MessageIdInMainDto extends ModelDto {
  final int mainMessageId;
  final int localMessageId;

  MessageIdInMainDto({
    required this.mainMessageId,
    required this.localMessageId,
  });

}
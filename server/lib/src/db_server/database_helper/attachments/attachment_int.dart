import 'attachment_impl.dart';

abstract class IAttachmentServices {
  factory IAttachmentServices() => AttachmentServices();
  Future createAttachment({required String attachmentMeta});
  Future readAttachment({required int id});
  Future deleteAttachment({required int id});
}

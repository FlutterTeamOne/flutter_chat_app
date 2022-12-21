import 'package:dio/dio.dart';
import 'package:server/src/db_server/database_helper/attachments/attachment_impl.dart';

class ImageSender {
  final _imgbb = 'https://api.imgbb.com/1/upload';
  final _key = '903c9fb8e9c7996408d27ba9699f84a6';
  final _dio = Dio();
  final _attach = AttachmentServices();
  Future uploadImage(String path, String filename) async {
    var image = await MultipartFile.fromFile(path, filename: filename);
    FormData data =
        FormData.fromMap({'key': _key, 'image': image, 'name': filename});

    var body = await _dio.put(_imgbb, data: data,
        onSendProgress: (int sent, int total) {
      print('post: $sent and $total');
    });

    var resp = await _attach.createAttachment(attachmentMeta: body.data);
    return resp;
  }

  Future deleteImage({required int id}) async {
    var resp = await _attach.deleteAttachment(id: id);
    return resp;
  }

  Future getImage({required int id}) async {
    var resp = await _attach.readAttachment(id: id);
    return resp;
  }
}

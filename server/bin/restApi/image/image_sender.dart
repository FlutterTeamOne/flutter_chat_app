import 'package:dio/dio.dart';
import 'package:server/src/db_server/database_helper/attachments/attachment_impl.dart';

class ImageSender {
  final _imgbb = 'https://api.imgbb.com/1/upload';
  final _key = '903c9fb8e9c7996408d27ba9699f84a6';
  final _dio = Dio();
  final _attach = AttachmentServices();
  Future<Map<String, Object?>> uploadImage(String path) async {
    var image = await MultipartFile.fromFile(path);
    FormData data = FormData.fromMap({'key': _key, 'image': image});
    var resp;
    try {
      var body = await _dio.post(_imgbb, data: data,
          onSendProgress: (int sent, int total) {
        print('post: $sent and $total');
      });
      print('BODY:$body');
      return resp =
          await _attach.createAttachment(attachmentMeta: body.toString());
    } catch (e) {
      print('ERROR:$e');
    }
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

import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'image/image_sender.dart';

class MediaApi {
  static const _headers = {'Content-Type': 'application/json'};
  // final _file = File(_images);
  final _sender = ImageSender();

  Router get router {
    final router = Router();
    //Запрос на получение списка изображений
    router.get('/', (Request request) async {
      var req = await request.readAsString();
      var id = jsonDecode(req);
      var data = await _sender.getImage(id: id);
      return Response.ok(json.encode(data), headers: _headers);
    });

    //Запрос на добавление изображения
    router.post('/', (Request request) async {
      final body = await request.readAsString();
      var bodyDecode = jsonDecode(body);
      var resp =
          await _sender.uploadImage(bodyDecode['path'], bodyDecode['filename']);

      return Response.ok(resp, headers: _headers);
    });
    //Запрос на добавление изображения
    router.put('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);

      return Response.ok(body, headers: _headers);
    });
    //
    router.delete('/', (Request request) async {
      var id = await request.readAsString();
      var imageId = int.parse(id);
      var resp = await _sender.deleteImage(id: imageId);
      return Response.ok(resp, headers: _headers);
    });
    return router;
  }
}

class ImageModel {
  final int id;
  final String url;
  ImageModel({
    required this.id,
    required this.url,
  });

  ImageModel copyWith({
    int? id,
    String? url,
  }) {
    return ImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id']?.toInt() ?? 0,
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  String toString() => 'ImageModel(id: $id, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel && other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}

import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class MediaApi {
  static const String _images = 'server/bin/restApi/images.json';
  static const _headers = {'Content-Type': 'application/json'};
  final _file = File(_images);

  final List data = json.decode(File(_images).readAsStringSync());

  Router get router {
    final router = Router();
    //Запрос на получение списка изображений
    router.get('/',
        (Request request) => Response.ok(json.encode(data), headers: _headers));

    //Запрос на добавление изображения
    router.post('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);
      data.add(resp);
      _file.writeAsStringSync(json.encode(data));
      return Response.ok(body, headers: _headers);
    });
    //Запрос на добавление изображения
    router.put('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);
      data.add(resp);
      _file.writeAsStringSync(json.encode(data));
      return Response.ok(body, headers: _headers);
    });
    //
    router.delete('/<id>', (Request request, String id) async {
      var imageId = int.parse(id);
      final body = await request.readAsString();
     data.removeWhere((chat) => chat['id'] == imageId);
      _file.writeAsStringSync(json.encode(data));
      return Response.ok(body, headers: _headers);
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

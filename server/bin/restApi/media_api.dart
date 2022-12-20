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
    return router;
  }
}

class ImageModel {
  final String url;
  ImageModel({
    required this.url,
  });

  ImageModel copyWith({
    String? url,
  }) {
    return ImageModel(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  String toString() => 'ImageModel(url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}

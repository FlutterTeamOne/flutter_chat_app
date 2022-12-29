import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'chat_api.dart';
import 'media_api.dart';
import 'rest_service.dart';

void main(List<String> args) async {
  final restService = RestService();

  var server = await io.serve(restService.handler, 'localhost', 8080);
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

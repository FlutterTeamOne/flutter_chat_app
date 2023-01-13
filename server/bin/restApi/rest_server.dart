import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'rest_service.dart';

void main(List<String> args) async {
  final restService = RestService();
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(restService.handler);
  var server = await io.serve(handler, 'localhost', 8081);
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

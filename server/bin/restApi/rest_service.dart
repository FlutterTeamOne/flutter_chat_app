import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'chat_api.dart';
import 'media_api.dart';

class RestService {
  Handler get handler {
    final router = Router();
    router.mount('/chats/', ChatApi().router);
    router.mount('/images/', MediaApi().router);
    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));
    return router;
  }
}

import 'package:alfred/alfred.dart';

import 'server_rest.dart';

void main() async {
  final app = Alfred();

  var chat = await RestServer().getChat();
  print (chat);
}
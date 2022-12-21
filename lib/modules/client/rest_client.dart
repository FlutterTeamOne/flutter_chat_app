import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:dio/dio.dart';

class RestClient {
  static const String _url = 'http://localhost:8080';

  final _dio = Dio();

  Future<List<ChatDto>> getChats() async {
    var chatUrl = '$_url/chats/';
    var chats = <ChatDto>[];
    try {
      var resp = await _dio.get(chatUrl);
      if (resp.statusCode == 200) {
        var respChats = resp.data.map((el) => ChatDto.fromMap(el)).toList();
        chats.add(respChats);
      }
    } catch (e) {
      print(e);
    }
    return chats;
  }

  Future<ChatDto> createChatRest(ChatDto chat) async {
    var chatUrl = '$_url/chats/';
    var restChat;
    try {
      //возвращает один созданные элемент
      var resp = await _dio.put(chatUrl, data: chat.toJson());
      if (resp.statusCode == 200) {
        restChat = resp;
      }
    } catch (e) {
      print(e);
    }
    return restChat;
  }

  Future deleteChatRest({required int id}) async {
    var chatUrl = '$_url/chats';
    try {
      var resp = await _dio.delete('$chatUrl/$id');
      print('DEL RESP:$resp');
    } catch (e) {}
  }
}

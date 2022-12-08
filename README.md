# FlutterChatApp:::

После клонирования перед запуском прописываем в консоль:

dart pub get

cd servers\server_bd

dart pub get

cd ..\..

Запуск локального сервера:

dart servers\server_bd\bin\server.dart

В консоли проверьте на каком порту реализован сервер.
Зайти в файл
lib/client/grpc_client.dart
Поменять порт на тот который вывел сервер.

Можем запускать приложение

flutter run

/////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////

Генерация protosFiles(Если поменяли файл .proto)

protoc --dart_out=grpc:lib/src/generated -Iprotos protos/grpc_chat.proto

генерация для сервера 

protoc --dart_out=grpc:servers/server_bd/lib/src/generated -Iprotos protos/grpc_chat.proto

///
///Запуск клиента и Сервера в разных консолях!!!!!!
///Не забудьте проверить порт, совпадает ли на сервере и в клиенте
///

Запуск клиента консольного 

dart servers\server_bd\bin\client.dart

Запуск локального сервера

dart servers\server_bd\bin\server.dart


При ошибках с grpc или Базой: 
Проверьте что база создана (Создается на каждом пк отдельно, тк файлики .dart_tool в .gitignore)
Для проверки успешной записи в базу раскомментировать нужные строки в файле:
servers\server_bd\lib\src\db_server\database_helper\test.dart
Запуск проверки:
dart servers\server_bd\lib\src\db_server\database_helper\test.dart
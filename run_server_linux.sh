dart pub get
cd server
dart pub get
cd ..
rm .dart_tool/sqflite_common_ffi/databases/.dart_tool/sqflite_common_ffi/databases/main_db.db
find /tmp/ -type f -name '*.db' -delete
protoc -I ./proto/ ./proto/messages.proto --dart_out=grpc:./lib/src/generated/messages
protoc -I ./proto/ ./proto/messages.proto --dart_out=grpc:./server/lib/src/generated
protoc -I ./proto/ ./proto/users.proto --dart_out=grpc:./lib/src/generated/users
protoc -I ./proto/ ./proto/users.proto --dart_out=grpc:./server/lib/src/generated
protoc -I ./proto/ ./proto/chats.proto --dart_out=grpc:./lib/src/generated/chats
protoc -I ./proto/ ./proto/chats.proto --dart_out=grpc:./server/lib/src/generated
protoc -I ./proto/ ./proto/grpcsynh.proto --dart_out=grpc:./lib/src/generated/sync
protoc -I ./proto/ ./proto/grpcsynh.proto --dart_out=grpc:./server/lib/src/generated
dart server/bin/server.dart  
dart pub get
cd server
dart pub get
cd ..
protoc -I ./proto/ ./proto/messages.proto --dart_out=grpc:./lib/src/generated/messages
protoc -I ./proto/ ./proto/messages.proto --dart_out=grpc:./server/lib/src/generated
protoc -I ./proto/ ./proto/users.proto --dart_out=grpc:./lib/src/generated/users
protoc -I ./proto/ ./proto/users.proto --dart_out=grpc:./server/lib/src/generated
protoc -I ./proto/ ./proto/chats.proto --dart_out=grpc:./lib/src/generated/chats
protoc -I ./proto/ ./proto/chats.proto --dart_out=grpc:./server/lib/src/generated
dart server/bin/server.dart  
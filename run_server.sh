dart pub get
cd server
dart pub get
cd ..
protoc -I ./proto/ ./proto/grpc_manager.proto --dart_out=grpc:./lib/src/generated/grpc_manager
protoc -I ./proto/ ./proto/grpc_manager.proto --dart_out=grpc:./server/lib/src/generated
protoc -I ./proto/ ./proto/users.proto --dart_out=grpc:./lib/src/generated/users
protoc -I ./proto/ ./proto/users.proto --dart_out=grpc:./server/lib/src/generated
dart server/bin/server.dart  
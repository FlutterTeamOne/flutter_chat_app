cd ..
dart pub get
cd server
dart pub get
cd ..
protoc -I ./proto/ ./proto/grpc_manager.proto --dart_out=grpc:./lib/src/generated/grpc_manager
protoc -I ./proto/ ./proto/grpc_manager.proto --dart_out=grpc:./server/lib/src/generated
cd ps1
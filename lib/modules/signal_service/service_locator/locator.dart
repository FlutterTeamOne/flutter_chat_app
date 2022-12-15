import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:get_it/get_it.dart';

class Locator {
  static final GetIt getIt = GetIt.instance;

  static void setUp() {
    getIt.registerSingleton<GrpcClient>(GrpcClient());
    getIt.registerLazySingleton<ConnectionBloc>(() => ConnectionBloc());
    getIt.registerLazySingleton<GrpcConnectionBloc>(
        () => GrpcConnectionBloc(getIt<GrpcClient>(), getIt<ConnectionBloc>()));
    getIt.registerLazySingleton<UserBloc>(() => UserBloc());
    getIt.registerLazySingleton<ChatBloc>(
        () => ChatBloc(userBloc: getIt<UserBloc>()));
    getIt.registerLazySingleton<MessageBloc>(() => MessageBloc(
        grpcClient: getIt<GrpcClient>(),
        grpcConnection: getIt<GrpcConnectionBloc>()));
    getIt.registerLazySingleton<MessageIdInMainBloc>(
        () => MessageIdInMainBloc());
    getIt.registerLazySingleton<ChangeThemeBloc>(() => ChangeThemeBloc());
    getIt.registerFactory<GrpcMessagesClient>(() => GrpcMessagesClient(getIt<GrpcClient>().channel));
  }
}

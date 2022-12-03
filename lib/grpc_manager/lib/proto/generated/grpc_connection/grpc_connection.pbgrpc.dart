///
//  Generated code. Do not modify.
//  source: grpc_connection.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'grpc_connection.pb.dart' as $0;
export 'grpc_connection.pb.dart';

class ConnectionServiceClient extends $grpc.Client {
  static final _$checkConnection = $grpc.ClientMethod<$0.Message, $0.Message>(
      '/ConnectionService/checkConnection',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  ConnectionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Message> checkConnection($0.Message request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkConnection, request, options: options);
  }
}

abstract class ConnectionServiceBase extends $grpc.Service {
  $core.String get $name => 'ConnectionService';

  ConnectionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Message>(
        'checkConnection',
        checkConnection_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.Message> checkConnection_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
    return checkConnection(call, await request);
  }

  $async.Future<$0.Message> checkConnection(
      $grpc.ServiceCall call, $0.Message request);
}

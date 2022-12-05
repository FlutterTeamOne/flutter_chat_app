///
//  Generated code. Do not modify.
//  source: grpc_chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'grpc_chat.pb.dart' as $0;
export 'grpc_chat.pb.dart';

class GrpcChatClient extends $grpc.Client {
  static final _$connecting = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/GrpcChat/connecting',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$createMessage = $grpc.ClientMethod<$0.Message, $0.MessageBase>(
      '/GrpcChat/createMessage',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MessageBase.fromBuffer(value));
  static final _$createNessages =
      $grpc.ClientMethod<$0.Message, $0.MessageBase>(
          '/GrpcChat/createNessages',
          ($0.Message value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.MessageBase.fromBuffer(value));

  GrpcChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> connecting($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connecting, request, options: options);
  }

  $grpc.ResponseFuture<$0.MessageBase> createMessage($0.Message request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.MessageBase> createNessages(
      $async.Stream<$0.Message> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createNessages, request, options: options);
  }
}

abstract class GrpcChatServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcChat';

  GrpcChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'connecting',
        connecting_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Message, $0.MessageBase>(
        'createMessage',
        createMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.MessageBase value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Message, $0.MessageBase>(
        'createNessages',
        createNessages,
        true,
        true,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.MessageBase value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> connecting_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return connecting(call, await request);
  }

  $async.Future<$0.MessageBase> createMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
    return createMessage(call, await request);
  }

  $async.Future<$0.Empty> connecting($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.MessageBase> createMessage(
      $grpc.ServiceCall call, $0.Message request);
  $async.Stream<$0.MessageBase> createNessages(
      $grpc.ServiceCall call, $async.Stream<$0.Message> request);
}

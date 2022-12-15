///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'messages.pb.dart' as $0;
export 'messages.pb.dart';

class GrpcMessagesClient extends $grpc.Client {
  static final _$connecting = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/GrpcMessages/connecting',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$createMessage =
      $grpc.ClientMethod<$0.CreateMessageRequest, $0.CreateMessageResponse>(
          '/GrpcMessages/createMessage',
          ($0.CreateMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateMessageResponse.fromBuffer(value));
  static final _$updateMessage =
      $grpc.ClientMethod<$0.UpdateMessageRequest, $0.UpdateMessageResponse>(
          '/GrpcMessages/updateMessage',
          ($0.UpdateMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateMessageResponse.fromBuffer(value));
  static final _$deleteMessage =
      $grpc.ClientMethod<$0.DeleteMessageRequest, $0.DeleteMessageResponse>(
          '/GrpcMessages/deleteMessage',
          ($0.DeleteMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteMessageResponse.fromBuffer(value));
  static final _$synchronization =
      $grpc.ClientMethod<$0.LastMessage, $0.MessageFromBase>(
          '/GrpcMessages/synchronization',
          ($0.LastMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MessageFromBase.fromBuffer(value));

  GrpcMessagesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> connecting($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connecting, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateMessageResponse> createMessage(
      $0.CreateMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateMessageResponse> updateMessage(
      $0.UpdateMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteMessageResponse> deleteMessage(
      $0.DeleteMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.MessageFromBase> synchronization(
      $0.LastMessage request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$synchronization, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class GrpcMessagesServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcMessages';

  GrpcMessagesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'connecting',
        connecting_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateMessageRequest, $0.CreateMessageResponse>(
            'createMessage',
            createMessage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateMessageRequest.fromBuffer(value),
            ($0.CreateMessageResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateMessageRequest, $0.UpdateMessageResponse>(
            'updateMessage',
            updateMessage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateMessageRequest.fromBuffer(value),
            ($0.UpdateMessageResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteMessageRequest, $0.DeleteMessageResponse>(
            'deleteMessage',
            deleteMessage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteMessageRequest.fromBuffer(value),
            ($0.DeleteMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LastMessage, $0.MessageFromBase>(
        'synchronization',
        synchronization_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.LastMessage.fromBuffer(value),
        ($0.MessageFromBase value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> connecting_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return connecting(call, await request);
  }

  $async.Future<$0.CreateMessageResponse> createMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateMessageRequest> request) async {
    return createMessage(call, await request);
  }

  $async.Future<$0.UpdateMessageResponse> updateMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateMessageRequest> request) async {
    return updateMessage(call, await request);
  }

  $async.Future<$0.DeleteMessageResponse> deleteMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteMessageRequest> request) async {
    return deleteMessage(call, await request);
  }

  $async.Stream<$0.MessageFromBase> synchronization_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LastMessage> request) async* {
    yield* synchronization(call, await request);
  }

  $async.Future<$0.Empty> connecting($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.CreateMessageResponse> createMessage(
      $grpc.ServiceCall call, $0.CreateMessageRequest request);
  $async.Future<$0.UpdateMessageResponse> updateMessage(
      $grpc.ServiceCall call, $0.UpdateMessageRequest request);
  $async.Future<$0.DeleteMessageResponse> deleteMessage(
      $grpc.ServiceCall call, $0.DeleteMessageRequest request);
  $async.Stream<$0.MessageFromBase> synchronization(
      $grpc.ServiceCall call, $0.LastMessage request);
}

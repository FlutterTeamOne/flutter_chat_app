///
//  Generated code. Do not modify.
//  source: grpc_manager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'grpc_manager.pb.dart' as $0;
export 'grpc_manager.pb.dart';

class GrpcChatClient extends $grpc.Client {
  static final _$connecting = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/GrpcChat/connecting',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
<<<<<<< HEAD
  static final _$getAllUsers = $grpc.ClientMethod<$0.Empty, $0.AllUsers>(
      '/GrpcChat/getAllUsers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AllUsers.fromBuffer(value));
  static final _$createMessage = $grpc.ClientMethod<$0.Message, $0.MessageBase>(
      '/GrpcChat/createMessage',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MessageBase.fromBuffer(value));
  static final _$createMessages =
      $grpc.ClientMethod<$0.Message, $0.MessageBase>(
          '/GrpcChat/createMessages',
          ($0.Message value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.MessageBase.fromBuffer(value));
=======
  static final _$createMessage =
      $grpc.ClientMethod<$0.CreateMessageRequest, $0.CreateMessageResponse>(
          '/GrpcChat/createMessage',
          ($0.CreateMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateMessageResponse.fromBuffer(value));
  static final _$updateMessage =
      $grpc.ClientMethod<$0.UpdateMessageRequest, $0.UpdateMessageResponse>(
          '/GrpcChat/updateMessage',
          ($0.UpdateMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateMessageResponse.fromBuffer(value));
  static final _$deleteMessage =
      $grpc.ClientMethod<$0.DeleteMessageRequest, $0.DeleteMessageResponse>(
          '/GrpcChat/deleteMessage',
          ($0.DeleteMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteMessageResponse.fromBuffer(value));
>>>>>>> main
  static final _$synchronization =
      $grpc.ClientMethod<$0.LastMessage, $0.MessageFromBase>(
          '/GrpcChat/synchronization',
          ($0.LastMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MessageFromBase.fromBuffer(value));

  GrpcChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> connecting($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connecting, request, options: options);
  }

<<<<<<< HEAD
  $grpc.ResponseFuture<$0.AllUsers> getAllUsers($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.MessageBase> createMessage($0.Message request,
=======
  $grpc.ResponseFuture<$0.CreateMessageResponse> createMessage(
      $0.CreateMessageRequest request,
>>>>>>> main
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
<<<<<<< HEAD
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.AllUsers>(
        'getAllUsers',
        getAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.AllUsers value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Message, $0.MessageBase>(
        'createMessage',
        createMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.MessageBase value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Message, $0.MessageBase>(
        'createMessages',
        createMessages,
        true,
        true,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.MessageBase value) => value.writeToBuffer()));
=======
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
>>>>>>> main
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

<<<<<<< HEAD
  $async.Future<$0.AllUsers> getAllUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllUsers(call, await request);
  }

  $async.Future<$0.MessageBase> createMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
=======
  $async.Future<$0.CreateMessageResponse> createMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateMessageRequest> request) async {
>>>>>>> main
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
<<<<<<< HEAD
  $async.Future<$0.AllUsers> getAllUsers(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.MessageBase> createMessage(
      $grpc.ServiceCall call, $0.Message request);
  $async.Stream<$0.MessageBase> createMessages(
      $grpc.ServiceCall call, $async.Stream<$0.Message> request);
=======
  $async.Future<$0.CreateMessageResponse> createMessage(
      $grpc.ServiceCall call, $0.CreateMessageRequest request);
  $async.Future<$0.UpdateMessageResponse> updateMessage(
      $grpc.ServiceCall call, $0.UpdateMessageRequest request);
  $async.Future<$0.DeleteMessageResponse> deleteMessage(
      $grpc.ServiceCall call, $0.DeleteMessageRequest request);
>>>>>>> main
  $async.Stream<$0.MessageFromBase> synchronization(
      $grpc.ServiceCall call, $0.LastMessage request);
}

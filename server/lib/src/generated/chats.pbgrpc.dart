///
//  Generated code. Do not modify.
//  source: chats.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chats.pb.dart' as $0;
export 'chats.pb.dart';

class GrpcChatsClient extends $grpc.Client {
  static final _$getChat =
      $grpc.ClientMethod<$0.GetChatRequest, $0.GetChatResponse>(
          '/GrpcChats/getChat',
          ($0.GetChatRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetChatResponse.fromBuffer(value));
  static final _$createChat =
      $grpc.ClientMethod<$0.CreateChatRequest, $0.CreateChatResponse>(
          '/GrpcChats/createChat',
          ($0.CreateChatRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateChatResponse.fromBuffer(value));
  static final _$updateChat =
      $grpc.ClientMethod<$0.UpdateChatRequest, $0.UpdateChatResponse>(
          '/GrpcChats/updateChat',
          ($0.UpdateChatRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateChatResponse.fromBuffer(value));
  static final _$deleteChat =
      $grpc.ClientMethod<$0.DeleteChatRequest, $0.DeleteChatResponse>(
          '/GrpcChats/deleteChat',
          ($0.DeleteChatRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteChatResponse.fromBuffer(value));

  GrpcChatsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetChatResponse> getChat($0.GetChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateChatResponse> createChat(
      $0.CreateChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateChatResponse> updateChat(
      $0.UpdateChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteChatResponse> deleteChat(
      $0.DeleteChatRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteChat, request, options: options);
  }
}

abstract class GrpcChatsServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcChats';

  GrpcChatsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetChatRequest, $0.GetChatResponse>(
        'getChat',
        getChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetChatRequest.fromBuffer(value),
        ($0.GetChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateChatRequest, $0.CreateChatResponse>(
        'createChat',
        createChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateChatRequest.fromBuffer(value),
        ($0.CreateChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateChatRequest, $0.UpdateChatResponse>(
        'updateChat',
        updateChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateChatRequest.fromBuffer(value),
        ($0.UpdateChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteChatRequest, $0.DeleteChatResponse>(
        'deleteChat',
        deleteChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteChatRequest.fromBuffer(value),
        ($0.DeleteChatResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetChatResponse> getChat_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetChatRequest> request) async {
    return getChat(call, await request);
  }

  $async.Future<$0.CreateChatResponse> createChat_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateChatRequest> request) async {
    return createChat(call, await request);
  }

  $async.Future<$0.UpdateChatResponse> updateChat_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateChatRequest> request) async {
    return updateChat(call, await request);
  }

  $async.Future<$0.DeleteChatResponse> deleteChat_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteChatRequest> request) async {
    return deleteChat(call, await request);
  }

  $async.Future<$0.GetChatResponse> getChat(
      $grpc.ServiceCall call, $0.GetChatRequest request);
  $async.Future<$0.CreateChatResponse> createChat(
      $grpc.ServiceCall call, $0.CreateChatRequest request);
  $async.Future<$0.UpdateChatResponse> updateChat(
      $grpc.ServiceCall call, $0.UpdateChatRequest request);
  $async.Future<$0.DeleteChatResponse> deleteChat(
      $grpc.ServiceCall call, $0.DeleteChatRequest request);
}

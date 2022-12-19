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
  static final _$streamMessage =
      $grpc.ClientMethod<$0.DynamicRequest, $0.DynamicResponse>(
          '/GrpcMessages/streamMessage',
          ($0.DynamicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DynamicResponse.fromBuffer(value));

  GrpcMessagesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.DynamicResponse> streamMessage(
      $async.Stream<$0.DynamicRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamMessage, request, options: options);
  }
}

abstract class GrpcMessagesServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcMessages';

  GrpcMessagesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DynamicRequest, $0.DynamicResponse>(
        'streamMessage',
        streamMessage,
        true,
        true,
        ($core.List<$core.int> value) => $0.DynamicRequest.fromBuffer(value),
        ($0.DynamicResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.DynamicResponse> streamMessage(
      $grpc.ServiceCall call, $async.Stream<$0.DynamicRequest> request);
}

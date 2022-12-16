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
  static final _$streamMessage = $grpc.ClientMethod<$0.Dynamic, $0.Dynamic>(
      '/GrpcMessages/streamMessage',
      ($0.Dynamic value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Dynamic.fromBuffer(value));

  GrpcMessagesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Dynamic> streamMessage(
      $async.Stream<$0.Dynamic> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamMessage, request, options: options);
  }
}

abstract class GrpcMessagesServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcMessages';

  GrpcMessagesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Dynamic, $0.Dynamic>(
        'streamMessage',
        streamMessage,
        true,
        true,
        ($core.List<$core.int> value) => $0.Dynamic.fromBuffer(value),
        ($0.Dynamic value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Dynamic> streamMessage(
      $grpc.ServiceCall call, $async.Stream<$0.Dynamic> request);
}

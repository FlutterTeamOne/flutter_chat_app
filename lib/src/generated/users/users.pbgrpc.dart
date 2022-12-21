///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $0;
export 'users.pb.dart';

class GrpcUsersClient extends $grpc.Client {
  static final _$usersSync =
      $grpc.ClientMethod<$0.UsersRequest, $0.UsersResponse>(
          '/GrpcUsers/UsersSync',
          ($0.UsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UsersResponse.fromBuffer(value));

  GrpcUsersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UsersResponse> usersSync($0.UsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$usersSync, request, options: options);
  }
}

abstract class GrpcUsersServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcUsers';

  GrpcUsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UsersRequest, $0.UsersResponse>(
        'UsersSync',
        usersSync_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UsersRequest.fromBuffer(value),
        ($0.UsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UsersResponse> usersSync_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UsersRequest> request) async {
    return usersSync(call, await request);
  }

  $async.Future<$0.UsersResponse> usersSync(
      $grpc.ServiceCall call, $0.UsersRequest request);
}

///
//  Generated code. Do not modify.
//  source: grpc_chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'userMainId1', '3': 1, '4': 1, '5': 5, '10': 'userMainId1'},
    const {'1': 'userMainId2', '3': 2, '4': 1, '5': 5, '10': 'userMainId2'},
    const {'1': 'senderMainId', '3': 3, '4': 1, '5': 5, '10': 'senderMainId'},
    const {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEiAKC3VzZXJNYWluSWQxGAEgASgFUgt1c2VyTWFpbklkMRIgCgt1c2VyTWFpbklkMhgCIAEoBVILdXNlck1haW5JZDISIgoMc2VuZGVyTWFpbklkGAMgASgFUgxzZW5kZXJNYWluSWQSGAoHY29udGVudBgEIAEoCVIHY29udGVudA==');
@$core.Deprecated('Use messageBaseDescriptor instead')
const MessageBase$json = const {
  '1': 'MessageBase',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

/// Descriptor for `MessageBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageBaseDescriptor = $convert.base64Decode('CgtNZXNzYWdlQmFzZRIOCgJvaxgBIAEoCFICb2s=');

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
    const {'1': 'chatIdMaint', '3': 1, '4': 1, '5': 5, '10': 'chatIdMaint'},
    const {'1': 'senderMainId', '3': 2, '4': 1, '5': 5, '10': 'senderMainId'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'date', '3': 4, '4': 1, '5': 9, '10': 'date'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEiAKC2NoYXRJZE1haW50GAEgASgFUgtjaGF0SWRNYWludBIiCgxzZW5kZXJNYWluSWQYAiABKAVSDHNlbmRlck1haW5JZBIYCgdjb250ZW50GAMgASgJUgdjb250ZW50EhIKBGRhdGUYBCABKAlSBGRhdGU=');
@$core.Deprecated('Use messageBaseDescriptor instead')
const MessageBase$json = const {
  '1': 'MessageBase',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
    const {'1': 'mainMessagesId', '3': 2, '4': 1, '5': 5, '10': 'mainMessagesId'},
  ],
};

/// Descriptor for `MessageBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageBaseDescriptor = $convert.base64Decode('CgtNZXNzYWdlQmFzZRIOCgJvaxgBIAEoCFICb2sSJgoObWFpbk1lc3NhZ2VzSWQYAiABKAVSDm1haW5NZXNzYWdlc0lk');
@$core.Deprecated('Use lastMessageDescriptor instead')
const LastMessage$json = const {
  '1': 'LastMessage',
  '2': const [
    const {'1': 'mainIdMessage', '3': 1, '4': 1, '5': 5, '10': 'mainIdMessage'},
    const {'1': 'mainIdUser', '3': 2, '4': 1, '5': 5, '10': 'mainIdUser'},
  ],
};

/// Descriptor for `LastMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastMessageDescriptor = $convert.base64Decode('CgtMYXN0TWVzc2FnZRIkCg1tYWluSWRNZXNzYWdlGAEgASgFUg1tYWluSWRNZXNzYWdlEh4KCm1haW5JZFVzZXIYAiABKAVSCm1haW5JZFVzZXI=');
@$core.Deprecated('Use messageFromBaseDescriptor instead')
const MessageFromBase$json = const {
  '1': 'MessageFromBase',
  '2': const [
    const {'1': 'chatIdMain', '3': 1, '4': 1, '5': 5, '10': 'chatIdMain'},
    const {'1': 'senderMainId', '3': 2, '4': 1, '5': 5, '10': 'senderMainId'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'date', '3': 4, '4': 1, '5': 9, '10': 'date'},
    const {'1': 'mainIdMessage', '3': 5, '4': 1, '5': 5, '10': 'mainIdMessage'},
  ],
};

/// Descriptor for `MessageFromBase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageFromBaseDescriptor = $convert.base64Decode('Cg9NZXNzYWdlRnJvbUJhc2USHgoKY2hhdElkTWFpbhgBIAEoBVIKY2hhdElkTWFpbhIiCgxzZW5kZXJNYWluSWQYAiABKAVSDHNlbmRlck1haW5JZBIYCgdjb250ZW50GAMgASgJUgdjb250ZW50EhIKBGRhdGUYBCABKAlSBGRhdGUSJAoNbWFpbklkTWVzc2FnZRgFIAEoBVINbWFpbklkTWVzc2FnZQ==');

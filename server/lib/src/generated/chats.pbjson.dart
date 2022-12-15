///
//  Generated code. Do not modify.
//  source: chats.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getChatRequestDescriptor instead')
const GetChatRequest$json = const {
  '1': 'GetChatRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRequestDescriptor = $convert.base64Decode('Cg5HZXRDaGF0UmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use getChatResponseDescriptor instead')
const GetChatResponse$json = const {
  '1': 'GetChatResponse',
  '2': const [
    const {'1': 'friend1Id', '3': 1, '4': 1, '5': 5, '10': 'friend1Id'},
    const {'1': 'friend2Id', '3': 2, '4': 1, '5': 5, '10': 'friend2Id'},
    const {'1': 'createdDate', '3': 3, '4': 1, '5': 9, '10': 'createdDate'},
  ],
};

/// Descriptor for `GetChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatResponseDescriptor = $convert.base64Decode('Cg9HZXRDaGF0UmVzcG9uc2USHAoJZnJpZW5kMUlkGAEgASgFUglmcmllbmQxSWQSHAoJZnJpZW5kMklkGAIgASgFUglmcmllbmQySWQSIAoLY3JlYXRlZERhdGUYAyABKAlSC2NyZWF0ZWREYXRl');
@$core.Deprecated('Use createChatRequestDescriptor instead')
const CreateChatRequest$json = const {
  '1': 'CreateChatRequest',
  '2': const [
    const {'1': 'friend1Id', '3': 1, '4': 1, '5': 5, '10': 'friend1Id'},
    const {'1': 'friend2Id', '3': 2, '4': 1, '5': 5, '10': 'friend2Id'},
  ],
};

/// Descriptor for `CreateChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVDaGF0UmVxdWVzdBIcCglmcmllbmQxSWQYASABKAVSCWZyaWVuZDFJZBIcCglmcmllbmQySWQYAiABKAVSCWZyaWVuZDJJZA==');
@$core.Deprecated('Use createChatResponseDescriptor instead')
const CreateChatResponse$json = const {
  '1': 'CreateChatResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'createdDate', '3': 2, '4': 1, '5': 9, '10': 'createdDate'},
  ],
};

/// Descriptor for `CreateChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVDaGF0UmVzcG9uc2USDgoCaWQYASABKAVSAmlkEiAKC2NyZWF0ZWREYXRlGAIgASgJUgtjcmVhdGVkRGF0ZQ==');
@$core.Deprecated('Use updateChatRequestDescriptor instead')
const UpdateChatRequest$json = const {
  '1': 'UpdateChatRequest',
};

/// Descriptor for `UpdateChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVDaGF0UmVxdWVzdA==');
@$core.Deprecated('Use updateChatResponseDescriptor instead')
const UpdateChatResponse$json = const {
  '1': 'UpdateChatResponse',
};

/// Descriptor for `UpdateChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatResponseDescriptor = $convert.base64Decode('ChJVcGRhdGVDaGF0UmVzcG9uc2U=');
@$core.Deprecated('Use deleteChatRequestDescriptor instead')
const DeleteChatRequest$json = const {
  '1': 'DeleteChatRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatRequestDescriptor = $convert.base64Decode('ChFEZWxldGVDaGF0UmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use deleteChatResponseDescriptor instead')
const DeleteChatResponse$json = const {
  '1': 'DeleteChatResponse',
  '2': const [
    const {'1': 'dateDeleted', '3': 1, '4': 1, '5': 9, '10': 'dateDeleted'},
  ],
};

/// Descriptor for `DeleteChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatResponseDescriptor = $convert.base64Decode('ChJEZWxldGVDaGF0UmVzcG9uc2USIAoLZGF0ZURlbGV0ZWQYASABKAlSC2RhdGVEZWxldGVk');

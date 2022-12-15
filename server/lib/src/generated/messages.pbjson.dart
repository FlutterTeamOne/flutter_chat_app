///
//  Generated code. Do not modify.
//  source: messages.proto
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
@$core.Deprecated('Use createMessageRequestDescriptor instead')
const CreateMessageRequest$json = const {
  '1': 'CreateMessageRequest',
  '2': const [
    const {'1': 'chatIdMain', '3': 1, '4': 1, '5': 5, '10': 'chatIdMain'},
    const {'1': 'senderMainId', '3': 2, '4': 1, '5': 5, '10': 'senderMainId'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `CreateMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMessageRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVNZXNzYWdlUmVxdWVzdBIeCgpjaGF0SWRNYWluGAEgASgFUgpjaGF0SWRNYWluEiIKDHNlbmRlck1haW5JZBgCIAEoBVIMc2VuZGVyTWFpbklkEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQ=');
@$core.Deprecated('Use createMessageResponseDescriptor instead')
const CreateMessageResponse$json = const {
  '1': 'CreateMessageResponse',
  '2': const [
    const {'1': 'mainMessagesId', '3': 1, '4': 1, '5': 5, '10': 'mainMessagesId'},
    const {'1': 'dateCreate', '3': 2, '4': 1, '5': 9, '10': 'dateCreate'},
    const {'1': 'isWritten', '3': 3, '4': 1, '5': 8, '10': 'isWritten'},
  ],
};

/// Descriptor for `CreateMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMessageResponseDescriptor = $convert.base64Decode('ChVDcmVhdGVNZXNzYWdlUmVzcG9uc2USJgoObWFpbk1lc3NhZ2VzSWQYASABKAVSDm1haW5NZXNzYWdlc0lkEh4KCmRhdGVDcmVhdGUYAiABKAlSCmRhdGVDcmVhdGUSHAoJaXNXcml0dGVuGAMgASgIUglpc1dyaXR0ZW4=');
@$core.Deprecated('Use updateMessageRequestDescriptor instead')
const UpdateMessageRequest$json = const {
  '1': 'UpdateMessageRequest',
  '2': const [
    const {'1': 'idMessageMain', '3': 1, '4': 1, '5': 5, '10': 'idMessageMain'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UpdateMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMessageRequestDescriptor = $convert.base64Decode('ChRVcGRhdGVNZXNzYWdlUmVxdWVzdBIkCg1pZE1lc3NhZ2VNYWluGAEgASgFUg1pZE1lc3NhZ2VNYWluEhgKB2NvbnRlbnQYAiABKAlSB2NvbnRlbnQ=');
@$core.Deprecated('Use updateMessageResponseDescriptor instead')
const UpdateMessageResponse$json = const {
  '1': 'UpdateMessageResponse',
  '2': const [
    const {'1': 'idMessageMain', '3': 1, '4': 1, '5': 5, '10': 'idMessageMain'},
    const {'1': 'dateUpdate', '3': 2, '4': 1, '5': 9, '10': 'dateUpdate'},
  ],
};

/// Descriptor for `UpdateMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMessageResponseDescriptor = $convert.base64Decode('ChVVcGRhdGVNZXNzYWdlUmVzcG9uc2USJAoNaWRNZXNzYWdlTWFpbhgBIAEoBVINaWRNZXNzYWdlTWFpbhIeCgpkYXRlVXBkYXRlGAIgASgJUgpkYXRlVXBkYXRl');
@$core.Deprecated('Use deleteMessageRequestDescriptor instead')
const DeleteMessageRequest$json = const {
  '1': 'DeleteMessageRequest',
  '2': const [
    const {'1': 'idMessageMain', '3': 1, '4': 1, '5': 5, '10': 'idMessageMain'},
  ],
};

/// Descriptor for `DeleteMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageRequestDescriptor = $convert.base64Decode('ChREZWxldGVNZXNzYWdlUmVxdWVzdBIkCg1pZE1lc3NhZ2VNYWluGAEgASgFUg1pZE1lc3NhZ2VNYWlu');
@$core.Deprecated('Use deleteMessageResponseDescriptor instead')
const DeleteMessageResponse$json = const {
  '1': 'DeleteMessageResponse',
  '2': const [
    const {'1': 'idMessageMain', '3': 1, '4': 1, '5': 5, '10': 'idMessageMain'},
    const {'1': 'dateDelete', '3': 2, '4': 1, '5': 9, '10': 'dateDelete'},
  ],
};

/// Descriptor for `DeleteMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageResponseDescriptor = $convert.base64Decode('ChVEZWxldGVNZXNzYWdlUmVzcG9uc2USJAoNaWRNZXNzYWdlTWFpbhgBIAEoBVINaWRNZXNzYWdlTWFpbhIeCgpkYXRlRGVsZXRlGAIgASgJUgpkYXRlRGVsZXRl');
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

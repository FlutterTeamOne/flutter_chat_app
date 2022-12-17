///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use messageStateEnumDescriptor instead')
const MessageStateEnum$json = const {
  '1': 'MessageStateEnum',
  '2': const [
    const {'1': 'connecting', '2': 0},
    const {'1': 'isReadMessage', '2': 1},
    const {'1': 'isCreateMessage', '2': 2},
    const {'1': 'isUpdateMessage', '2': 3},
    const {'1': 'isDelteMesage', '2': 4},
  ],
};

/// Descriptor for `MessageStateEnum`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageStateEnumDescriptor = $convert.base64Decode('ChBNZXNzYWdlU3RhdGVFbnVtEg4KCmNvbm5lY3RpbmcQABIRCg1pc1JlYWRNZXNzYWdlEAESEwoPaXNDcmVhdGVNZXNzYWdlEAISEwoPaXNVcGRhdGVNZXNzYWdlEAMSEQoNaXNEZWx0ZU1lc2FnZRAE');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use dynamicDescriptor instead')
const Dynamic$json = const {
  '1': 'Dynamic',
  '2': const [
    const {'1': 'createMessage', '3': 1, '4': 1, '5': 11, '6': '.CreateMessageRequest', '10': 'createMessage'},
    const {'1': 'updateMessage', '3': 2, '4': 1, '5': 11, '6': '.UpdateMessageRequest', '10': 'updateMessage'},
    const {'1': 'deleteMessage', '3': 3, '4': 1, '5': 11, '6': '.DeleteMessageRequest', '10': 'deleteMessage'},
    const {'1': 'readMessage', '3': 4, '4': 1, '5': 11, '6': '.ReadMessageRequest', '10': 'readMessage'},
    const {'1': 'messageState', '3': 5, '4': 1, '5': 14, '6': '.MessageStateEnum', '10': 'messageState'},
  ],
};

/// Descriptor for `Dynamic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dynamicDescriptor = $convert.base64Decode('CgdEeW5hbWljEjsKDWNyZWF0ZU1lc3NhZ2UYASABKAsyFS5DcmVhdGVNZXNzYWdlUmVxdWVzdFINY3JlYXRlTWVzc2FnZRI7Cg11cGRhdGVNZXNzYWdlGAIgASgLMhUuVXBkYXRlTWVzc2FnZVJlcXVlc3RSDXVwZGF0ZU1lc3NhZ2USOwoNZGVsZXRlTWVzc2FnZRgDIAEoCzIVLkRlbGV0ZU1lc3NhZ2VSZXF1ZXN0Ug1kZWxldGVNZXNzYWdlEjUKC3JlYWRNZXNzYWdlGAQgASgLMhMuUmVhZE1lc3NhZ2VSZXF1ZXN0UgtyZWFkTWVzc2FnZRI1CgxtZXNzYWdlU3RhdGUYBSABKA4yES5NZXNzYWdlU3RhdGVFbnVtUgxtZXNzYWdlU3RhdGU=');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'messageId', '3': 1, '4': 1, '5': 5, '10': 'messageId'},
    const {'1': 'chatId', '3': 2, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'senderId', '3': 3, '4': 1, '5': 5, '10': 'senderId'},
    const {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'dateCreate', '3': 5, '4': 1, '5': 9, '10': 'dateCreate'},
    const {'1': 'dateUpdate', '3': 6, '4': 1, '5': 9, '10': 'dateUpdate'},
    const {'1': 'dateDelete', '3': 7, '4': 1, '5': 9, '10': 'dateDelete'},
    const {'1': 'isRead', '3': 8, '4': 1, '5': 5, '10': 'isRead'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEhwKCW1lc3NhZ2VJZBgBIAEoBVIJbWVzc2FnZUlkEhYKBmNoYXRJZBgCIAEoBVIGY2hhdElkEhoKCHNlbmRlcklkGAMgASgFUghzZW5kZXJJZBIYCgdjb250ZW50GAQgASgJUgdjb250ZW50Eh4KCmRhdGVDcmVhdGUYBSABKAlSCmRhdGVDcmVhdGUSHgoKZGF0ZVVwZGF0ZRgGIAEoCVIKZGF0ZVVwZGF0ZRIeCgpkYXRlRGVsZXRlGAcgASgJUgpkYXRlRGVsZXRlEhYKBmlzUmVhZBgIIAEoBVIGaXNSZWFk');
@$core.Deprecated('Use readMessageRequestDescriptor instead')
const ReadMessageRequest$json = const {
  '1': 'ReadMessageRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.Message', '10': 'message'},
  ],
};

/// Descriptor for `ReadMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readMessageRequestDescriptor = $convert.base64Decode('ChJSZWFkTWVzc2FnZVJlcXVlc3QSIgoHbWVzc2FnZRgBIAEoCzIILk1lc3NhZ2VSB21lc3NhZ2U=');
@$core.Deprecated('Use readMessageResponseDescriptor instead')
const ReadMessageResponse$json = const {
  '1': 'ReadMessageResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.Message', '10': 'message'},
    const {'1': 'isWritten', '3': 2, '4': 1, '5': 8, '10': 'isWritten'},
  ],
};

/// Descriptor for `ReadMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readMessageResponseDescriptor = $convert.base64Decode('ChNSZWFkTWVzc2FnZVJlc3BvbnNlEiIKB21lc3NhZ2UYASABKAsyCC5NZXNzYWdlUgdtZXNzYWdlEhwKCWlzV3JpdHRlbhgCIAEoCFIJaXNXcml0dGVu');
@$core.Deprecated('Use createMessageRequestDescriptor instead')
const CreateMessageRequest$json = const {
  '1': 'CreateMessageRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.Message', '10': 'message'},
  ],
};

/// Descriptor for `CreateMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMessageRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVNZXNzYWdlUmVxdWVzdBIiCgdtZXNzYWdlGAEgASgLMgguTWVzc2FnZVIHbWVzc2FnZQ==');
@$core.Deprecated('Use createMessageResponseDescriptor instead')
const CreateMessageResponse$json = const {
  '1': 'CreateMessageResponse',
  '2': const [
    const {'1': 'isWritten', '3': 2, '4': 1, '5': 8, '10': 'isWritten'},
  ],
};

/// Descriptor for `CreateMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMessageResponseDescriptor = $convert.base64Decode('ChVDcmVhdGVNZXNzYWdlUmVzcG9uc2USHAoJaXNXcml0dGVuGAIgASgIUglpc1dyaXR0ZW4=');
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

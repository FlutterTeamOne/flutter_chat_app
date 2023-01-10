///
//  Generated code. Do not modify.
//  source: grpcsynh.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use contentTypeSynchDescriptor instead')
const ContentTypeSynch$json = const {
  '1': 'ContentTypeSynch',
  '2': const [
    const {'1': 'isText', '2': 0},
    const {'1': 'isMedia', '2': 1},
    const {'1': 'isMediaText', '2': 2},
  ],
};

/// Descriptor for `ContentTypeSynch`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List contentTypeSynchDescriptor = $convert.base64Decode('ChBDb250ZW50VHlwZVN5bmNoEgoKBmlzVGV4dBAAEgsKB2lzTWVkaWEQARIPCgtpc01lZGlhVGV4dBAC');
@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = const {
  '1': 'UserRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'updatedDate', '3': 2, '4': 1, '5': 9, '10': 'updatedDate'},
  ],
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert.base64Decode('CgtVc2VyUmVxdWVzdBIWCgZ1c2VySWQYASABKAVSBnVzZXJJZBIgCgt1cGRhdGVkRGF0ZRgCIAEoCVILdXBkYXRlZERhdGU=');
@$core.Deprecated('Use chatRequestDescriptor instead')
const ChatRequest$json = const {
  '1': 'ChatRequest',
  '2': const [
    const {'1': 'chatId', '3': 1, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'updatedDate', '3': 2, '4': 1, '5': 9, '10': 'updatedDate'},
  ],
};

/// Descriptor for `ChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRequestDescriptor = $convert.base64Decode('CgtDaGF0UmVxdWVzdBIWCgZjaGF0SWQYASABKAVSBmNoYXRJZBIgCgt1cGRhdGVkRGF0ZRgCIAEoCVILdXBkYXRlZERhdGU=');
@$core.Deprecated('Use messageRequestDescriptor instead')
const MessageRequest$json = const {
  '1': 'MessageRequest',
  '2': const [
    const {'1': 'messageId', '3': 1, '4': 1, '5': 5, '10': 'messageId'},
    const {'1': 'updatedDate', '3': 2, '4': 1, '5': 9, '10': 'updatedDate'},
  ],
};

/// Descriptor for `MessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageRequestDescriptor = $convert.base64Decode('Cg5NZXNzYWdlUmVxdWVzdBIcCgltZXNzYWdlSWQYASABKAVSCW1lc3NhZ2VJZBIgCgt1cGRhdGVkRGF0ZRgCIAEoCVILdXBkYXRlZERhdGU=');
@$core.Deprecated('Use usersRequestDescriptor instead')
const UsersRequest$json = const {
  '1': 'UsersRequest',
  '2': const [
    const {'1': 'mainUser', '3': 1, '4': 1, '5': 5, '10': 'mainUser'},
    const {'1': 'usersForUpdate', '3': 2, '4': 3, '5': 11, '6': '.UserRequest', '10': 'usersForUpdate'},
  ],
};

/// Descriptor for `UsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersRequestDescriptor = $convert.base64Decode('CgxVc2Vyc1JlcXVlc3QSGgoIbWFpblVzZXIYASABKAVSCG1haW5Vc2VyEjQKDnVzZXJzRm9yVXBkYXRlGAIgAygLMgwuVXNlclJlcXVlc3RSDnVzZXJzRm9yVXBkYXRl');
@$core.Deprecated('Use chatsRequestDescriptor instead')
const ChatsRequest$json = const {
  '1': 'ChatsRequest',
  '2': const [
    const {'1': 'maxChatId', '3': 1, '4': 1, '5': 5, '10': 'maxChatId'},
    const {'1': 'chatsForUpdate', '3': 2, '4': 3, '5': 11, '6': '.ChatRequest', '10': 'chatsForUpdate'},
  ],
};

/// Descriptor for `ChatsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatsRequestDescriptor = $convert.base64Decode('CgxDaGF0c1JlcXVlc3QSHAoJbWF4Q2hhdElkGAEgASgFUgltYXhDaGF0SWQSNAoOY2hhdHNGb3JVcGRhdGUYAiADKAsyDC5DaGF0UmVxdWVzdFIOY2hhdHNGb3JVcGRhdGU=');
@$core.Deprecated('Use messagesRequestDescriptor instead')
const MessagesRequest$json = const {
  '1': 'MessagesRequest',
  '2': const [
    const {'1': 'maxMessageId', '3': 1, '4': 1, '5': 5, '10': 'maxMessageId'},
    const {'1': 'messageForUpdate', '3': 2, '4': 3, '5': 11, '6': '.MessageRequest', '10': 'messageForUpdate'},
  ],
};

/// Descriptor for `MessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagesRequestDescriptor = $convert.base64Decode('Cg9NZXNzYWdlc1JlcXVlc3QSIgoMbWF4TWVzc2FnZUlkGAEgASgFUgxtYXhNZXNzYWdlSWQSOwoQbWVzc2FnZUZvclVwZGF0ZRgCIAMoCzIPLk1lc3NhZ2VSZXF1ZXN0UhBtZXNzYWdlRm9yVXBkYXRl');
@$core.Deprecated('Use mainUserRequestDescriptor instead')
const MainUserRequest$json = const {
  '1': 'MainUserRequest',
  '2': const [
    const {'1': 'users', '3': 1, '4': 1, '5': 11, '6': '.UsersRequest', '10': 'users'},
    const {'1': 'chats', '3': 2, '4': 1, '5': 11, '6': '.ChatsRequest', '10': 'chats'},
    const {'1': 'messages', '3': 3, '4': 1, '5': 11, '6': '.MessagesRequest', '10': 'messages'},
  ],
};

/// Descriptor for `MainUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mainUserRequestDescriptor = $convert.base64Decode('Cg9NYWluVXNlclJlcXVlc3QSIwoFdXNlcnMYASABKAsyDS5Vc2Vyc1JlcXVlc3RSBXVzZXJzEiMKBWNoYXRzGAIgASgLMg0uQ2hhdHNSZXF1ZXN0UgVjaGF0cxIsCghtZXNzYWdlcxgDIAEoCzIQLk1lc3NhZ2VzUmVxdWVzdFIIbWVzc2FnZXM=');
@$core.Deprecated('Use synhUserDescriptor instead')
const SynhUser$json = const {
  '1': 'SynhUser',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'created_date', '3': 4, '4': 1, '5': 9, '10': 'createdDate'},
    const {'1': 'picture', '3': 5, '4': 1, '5': 9, '10': 'picture'},
    const {'1': 'deleted_date', '3': 6, '4': 1, '5': 9, '10': 'deletedDate'},
    const {'1': 'update_date', '3': 7, '4': 1, '5': 9, '10': 'updateDate'},
  ],
};

/// Descriptor for `SynhUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List synhUserDescriptor = $convert.base64Decode('CghTeW5oVXNlchISCgRuYW1lGAEgASgJUgRuYW1lEhcKB3VzZXJfaWQYAiABKAVSBnVzZXJJZBIUCgVlbWFpbBgDIAEoCVIFZW1haWwSIQoMY3JlYXRlZF9kYXRlGAQgASgJUgtjcmVhdGVkRGF0ZRIYCgdwaWN0dXJlGAUgASgJUgdwaWN0dXJlEiEKDGRlbGV0ZWRfZGF0ZRgGIAEoCVILZGVsZXRlZERhdGUSHwoLdXBkYXRlX2RhdGUYByABKAlSCnVwZGF0ZURhdGU=');
@$core.Deprecated('Use synhChatDescriptor instead')
const SynhChat$json = const {
  '1': 'SynhChat',
  '2': const [
    const {'1': 'chat_id', '3': 1, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'created_date', '3': 3, '4': 1, '5': 9, '10': 'createdDate'},
    const {'1': 'deleted_date', '3': 4, '4': 1, '5': 9, '10': 'deletedDate'},
    const {'1': 'update_date', '3': 5, '4': 1, '5': 9, '10': 'updateDate'},
  ],
};

/// Descriptor for `SynhChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List synhChatDescriptor = $convert.base64Decode('CghTeW5oQ2hhdBIXCgdjaGF0X2lkGAEgASgFUgZjaGF0SWQSFwoHdXNlcl9pZBgCIAEoBVIGdXNlcklkEiEKDGNyZWF0ZWRfZGF0ZRgDIAEoCVILY3JlYXRlZERhdGUSIQoMZGVsZXRlZF9kYXRlGAQgASgJUgtkZWxldGVkRGF0ZRIfCgt1cGRhdGVfZGF0ZRgFIAEoCVIKdXBkYXRlRGF0ZQ==');
@$core.Deprecated('Use synhMessageDescriptor instead')
const SynhMessage$json = const {
  '1': 'SynhMessage',
  '2': const [
    const {'1': 'local_message_id', '3': 1, '4': 1, '5': 5, '10': 'localMessageId'},
    const {'1': 'sender_id', '3': 2, '4': 1, '5': 5, '10': 'senderId'},
    const {'1': 'chat_id', '3': 3, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'created_date', '3': 4, '4': 1, '5': 9, '10': 'createdDate'},
    const {'1': 'message_id', '3': 5, '4': 1, '5': 5, '10': 'messageId'},
    const {'1': 'content', '3': 6, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'updated_date', '3': 7, '4': 1, '5': 9, '10': 'updatedDate'},
    const {'1': 'deleted_date', '3': 8, '4': 1, '5': 9, '10': 'deletedDate'},
    const {'1': 'is_read', '3': 9, '4': 1, '5': 5, '10': 'isRead'},
    const {'1': 'attachmentId', '3': 10, '4': 1, '5': 5, '10': 'attachmentId'},
    const {'1': 'contentType', '3': 11, '4': 1, '5': 14, '6': '.ContentTypeSynch', '10': 'contentType'},
  ],
};

/// Descriptor for `SynhMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List synhMessageDescriptor = $convert.base64Decode('CgtTeW5oTWVzc2FnZRIoChBsb2NhbF9tZXNzYWdlX2lkGAEgASgFUg5sb2NhbE1lc3NhZ2VJZBIbCglzZW5kZXJfaWQYAiABKAVSCHNlbmRlcklkEhcKB2NoYXRfaWQYAyABKAVSBmNoYXRJZBIhCgxjcmVhdGVkX2RhdGUYBCABKAlSC2NyZWF0ZWREYXRlEh0KCm1lc3NhZ2VfaWQYBSABKAVSCW1lc3NhZ2VJZBIYCgdjb250ZW50GAYgASgJUgdjb250ZW50EiEKDHVwZGF0ZWRfZGF0ZRgHIAEoCVILdXBkYXRlZERhdGUSIQoMZGVsZXRlZF9kYXRlGAggASgJUgtkZWxldGVkRGF0ZRIXCgdpc19yZWFkGAkgASgFUgZpc1JlYWQSIgoMYXR0YWNobWVudElkGAogASgFUgxhdHRhY2htZW50SWQSMwoLY29udGVudFR5cGUYCyABKA4yES5Db250ZW50VHlwZVN5bmNoUgtjb250ZW50VHlwZQ==');
@$core.Deprecated('Use usersResponseDescriptor instead')
const UsersResponse$json = const {
  '1': 'UsersResponse',
  '2': const [
    const {'1': 'usersNew', '3': 1, '4': 3, '5': 11, '6': '.SynhUser', '10': 'usersNew'},
    const {'1': 'usersUpdated', '3': 2, '4': 3, '5': 11, '6': '.SynhUser', '10': 'usersUpdated'},
  ],
};

/// Descriptor for `UsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersResponseDescriptor = $convert.base64Decode('Cg1Vc2Vyc1Jlc3BvbnNlEiUKCHVzZXJzTmV3GAEgAygLMgkuU3luaFVzZXJSCHVzZXJzTmV3Ei0KDHVzZXJzVXBkYXRlZBgCIAMoCzIJLlN5bmhVc2VyUgx1c2Vyc1VwZGF0ZWQ=');
@$core.Deprecated('Use chatsResponseDescriptor instead')
const ChatsResponse$json = const {
  '1': 'ChatsResponse',
  '2': const [
    const {'1': 'chatsNew', '3': 1, '4': 3, '5': 11, '6': '.SynhChat', '10': 'chatsNew'},
    const {'1': 'chatsUpdated', '3': 2, '4': 3, '5': 11, '6': '.SynhChat', '10': 'chatsUpdated'},
  ],
};

/// Descriptor for `ChatsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatsResponseDescriptor = $convert.base64Decode('Cg1DaGF0c1Jlc3BvbnNlEiUKCGNoYXRzTmV3GAEgAygLMgkuU3luaENoYXRSCGNoYXRzTmV3Ei0KDGNoYXRzVXBkYXRlZBgCIAMoCzIJLlN5bmhDaGF0UgxjaGF0c1VwZGF0ZWQ=');
@$core.Deprecated('Use messagesResponseDescriptor instead')
const MessagesResponse$json = const {
  '1': 'MessagesResponse',
  '2': const [
    const {'1': 'messagesNew', '3': 1, '4': 3, '5': 11, '6': '.SynhMessage', '10': 'messagesNew'},
    const {'1': 'messagesUpdated', '3': 2, '4': 3, '5': 11, '6': '.SynhMessage', '10': 'messagesUpdated'},
  ],
};

/// Descriptor for `MessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagesResponseDescriptor = $convert.base64Decode('ChBNZXNzYWdlc1Jlc3BvbnNlEi4KC21lc3NhZ2VzTmV3GAEgAygLMgwuU3luaE1lc3NhZ2VSC21lc3NhZ2VzTmV3EjYKD21lc3NhZ2VzVXBkYXRlZBgCIAMoCzIMLlN5bmhNZXNzYWdlUg9tZXNzYWdlc1VwZGF0ZWQ=');
@$core.Deprecated('Use dataDBResponseDescriptor instead')
const DataDBResponse$json = const {
  '1': 'DataDBResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 1, '5': 11, '6': '.UsersResponse', '10': 'users'},
    const {'1': 'chats', '3': 2, '4': 1, '5': 11, '6': '.ChatsResponse', '10': 'chats'},
    const {'1': 'messages', '3': 3, '4': 1, '5': 11, '6': '.MessagesResponse', '10': 'messages'},
  ],
};

/// Descriptor for `DataDBResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataDBResponseDescriptor = $convert.base64Decode('Cg5EYXRhREJSZXNwb25zZRIkCgV1c2VycxgBIAEoCzIOLlVzZXJzUmVzcG9uc2VSBXVzZXJzEiQKBWNoYXRzGAIgASgLMg4uQ2hhdHNSZXNwb25zZVIFY2hhdHMSLQoIbWVzc2FnZXMYAyABKAsyES5NZXNzYWdlc1Jlc3BvbnNlUghtZXNzYWdlcw==');

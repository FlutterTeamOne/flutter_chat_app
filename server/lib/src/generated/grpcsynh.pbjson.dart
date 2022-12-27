///
//  Generated code. Do not modify.
//  source: grpcsynh.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

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
@$core.Deprecated('Use usersRequestDescriptor instead')
const UsersRequest$json = const {
  '1': 'UsersRequest',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.UserRequest', '10': 'users'},
  ],
};

/// Descriptor for `UsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersRequestDescriptor = $convert.base64Decode('CgxVc2Vyc1JlcXVlc3QSIgoFdXNlcnMYASADKAsyDC5Vc2VyUmVxdWVzdFIFdXNlcnM=');
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

@$core.Deprecated('Use synhMainUserDescriptor instead')
const SynhMainUser$json = const {
  '1': 'SynhMainUser',
  '2': const [
    const {'1': 'mainUserId', '3': 1, '4': 1, '5': 5, '10': 'mainUserId'},
    const {'1': 'chatId', '3': 2, '4': 1, '5': 5, '10': 'chatId'},
    const {'1': 'messageId', '3': 3, '4': 1, '5': 5, '10': 'messageId'},
    const {'1': 'users', '3': 4, '4': 1, '5': 11, '6': '.UsersRequest', '10': 'users'},
  ],
};

/// Descriptor for `SynhMainUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List synhMainUserDescriptor = $convert.base64Decode('CgxTeW5oTWFpblVzZXISHgoKbWFpblVzZXJJZBgBIAEoBVIKbWFpblVzZXJJZBIWCgZjaGF0SWQYAiABKAVSBmNoYXRJZBIcCgltZXNzYWdlSWQYAyABKAVSCW1lc3NhZ2VJZBIjCgV1c2VycxgEIAEoCzINLlVzZXJzUmVxdWVzdFIFdXNlcnM=');
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
@$core.Deprecated('Use dataDBResponseDescriptor instead')
const DataDBResponse$json = const {
  '1': 'DataDBResponse',
  '2': const [
    const {'1': 'newUsers', '3': 1, '4': 3, '5': 11, '6': '.SynhUser', '10': 'newUsers'},
    const {'1': 'updatedUsers', '3': 4, '4': 3, '5': 11, '6': '.SynhUser', '10': 'updatedUsers'},
    const {'1': 'chats', '3': 2, '4': 3, '5': 11, '6': '.SynhChat', '10': 'chats'},
    const {'1': 'messages', '3': 3, '4': 3, '5': 11, '6': '.SynhMessage', '10': 'messages'},
  ],
};

/// Descriptor for `DataDBResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataDBResponseDescriptor = $convert.base64Decode('Cg5EYXRhREJSZXNwb25zZRIlCghuZXdVc2VycxgBIAMoCzIJLlN5bmhVc2VyUghuZXdVc2VycxItCgx1cGRhdGVkVXNlcnMYBCADKAsyCS5TeW5oVXNlclIMdXBkYXRlZFVzZXJzEh8KBWNoYXRzGAIgAygLMgkuU3luaENoYXRSBWNoYXRzEigKCG1lc3NhZ2VzGAMgAygLMgwuU3luaE1lc3NhZ2VSCG1lc3NhZ2Vz');

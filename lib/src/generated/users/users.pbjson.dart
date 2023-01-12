///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = const {
  '1': 'GetUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'dateCreation', '3': 4, '4': 1, '5': 9, '10': 'dateCreation'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode('Cg5HZXRVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSIgoMZGF0ZUNyZWF0aW9uGAQgASgJUgxkYXRlQ3JlYXRpb24=');
@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = const {
  '1': 'GetUserResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'dateUpdated', '3': 2, '4': 1, '5': 9, '10': 'dateUpdated'},
    const {'1': 'dateDeleted', '3': 3, '4': 1, '5': 9, '10': 'dateDeleted'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode('Cg9HZXRVc2VyUmVzcG9uc2USDgoCaWQYASABKAVSAmlkEiAKC2RhdGVVcGRhdGVkGAIgASgJUgtkYXRlVXBkYXRlZBIgCgtkYXRlRGVsZXRlZBgDIAEoCVILZGF0ZURlbGV0ZWQ=');
@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = const {
  '1': 'CreateUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'dateCreated', '3': 6, '4': 1, '5': 9, '10': 'dateCreated'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSJAoNcHJvZmlsZVBpY1VybBgEIAEoCVINcHJvZmlsZVBpY1VybBIaCghwYXNzd29yZBgFIAEoCVIIcGFzc3dvcmQSIAoLZGF0ZUNyZWF0ZWQYBiABKAlSC2RhdGVDcmVhdGVk');
@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = const {
  '1': 'CreateUserResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'dateCreated', '3': 6, '4': 1, '5': 9, '10': 'dateCreated'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVVc2VyUmVzcG9uc2USDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEiQKDXByb2ZpbGVQaWNVcmwYBCABKAlSDXByb2ZpbGVQaWNVcmwSGgoIcGFzc3dvcmQYBSABKAlSCHBhc3N3b3JkEiAKC2RhdGVDcmVhdGVkGAYgASgJUgtkYXRlQ3JlYXRlZA==');
@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = const {
  '1': 'UpdateUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSJAoNcHJvZmlsZVBpY1VybBgEIAEoCVINcHJvZmlsZVBpY1VybA==');
@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = const {
  '1': 'UpdateUserResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'dateUpdated', '3': 5, '4': 1, '5': 9, '10': 'dateUpdated'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode('ChJVcGRhdGVVc2VyUmVzcG9uc2USFgoGdXNlcklkGAEgASgFUgZ1c2VySWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSJAoNcHJvZmlsZVBpY1VybBgEIAEoCVINcHJvZmlsZVBpY1VybBIgCgtkYXRlVXBkYXRlZBgFIAEoCVILZGF0ZVVwZGF0ZWQ=');
@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = const {
  '1': 'DeleteUserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'dateDeleted', '3': 2, '4': 1, '5': 9, '10': 'dateDeleted'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode('ChFEZWxldGVVc2VyUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSIAoLZGF0ZURlbGV0ZWQYAiABKAlSC2RhdGVEZWxldGVk');
@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = const {
  '1': 'DeleteUserResponse',
  '2': const [
    const {'1': 'isDeleted', '3': 1, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor = $convert.base64Decode('ChJEZWxldGVVc2VyUmVzcG9uc2USHAoJaXNEZWxldGVkGAEgASgIUglpc0RlbGV0ZWQ=');
@$core.Deprecated('Use passwordRequestDescriptor instead')
const PasswordRequest$json = const {
  '1': 'PasswordRequest',
  '2': const [
    const {'1': 'userId', '3': 3, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'oldPassword', '3': 1, '4': 1, '5': 9, '10': 'oldPassword'},
    const {'1': 'newPassword', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `PasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordRequestDescriptor = $convert.base64Decode('Cg9QYXNzd29yZFJlcXVlc3QSFgoGdXNlcklkGAMgASgFUgZ1c2VySWQSIAoLb2xkUGFzc3dvcmQYASABKAlSC29sZFBhc3N3b3JkEiAKC25ld1Bhc3N3b3JkGAIgASgJUgtuZXdQYXNzd29yZA==');
@$core.Deprecated('Use passwordResponseDescriptor instead')
const PasswordResponse$json = const {
  '1': 'PasswordResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

/// Descriptor for `PasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordResponseDescriptor = $convert.base64Decode('ChBQYXNzd29yZFJlc3BvbnNlEg4KAm9rGAEgASgIUgJvaw==');

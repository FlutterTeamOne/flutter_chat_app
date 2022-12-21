///
//  Generated code. Do not modify.
//  source: users.proto
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
@$core.Deprecated('Use newUserResponseDescriptor instead')
const NewUserResponse$json = const {
  '1': 'NewUserResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'dateCreate', '3': 5, '4': 1, '5': 9, '10': 'dateCreate'},
    const {'1': 'dateUpdate', '3': 6, '4': 1, '5': 9, '10': 'dateUpdate'},
    const {'1': 'dateDelete', '3': 7, '4': 1, '5': 9, '10': 'dateDelete'},
  ],
};

/// Descriptor for `NewUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserResponseDescriptor = $convert.base64Decode('Cg9OZXdVc2VyUmVzcG9uc2USFgoGdXNlcklkGAEgASgFUgZ1c2VySWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSJAoNcHJvZmlsZVBpY1VybBgEIAEoCVINcHJvZmlsZVBpY1VybBIeCgpkYXRlQ3JlYXRlGAUgASgJUgpkYXRlQ3JlYXRlEh4KCmRhdGVVcGRhdGUYBiABKAlSCmRhdGVVcGRhdGUSHgoKZGF0ZURlbGV0ZRgHIAEoCVIKZGF0ZURlbGV0ZQ==');
@$core.Deprecated('Use updatedUserResponseDescriptor instead')
const UpdatedUserResponse$json = const {
  '1': 'UpdatedUserResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'profilePicUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePicUrl'},
    const {'1': 'dateCreate', '3': 5, '4': 1, '5': 9, '10': 'dateCreate'},
    const {'1': 'dateUpdate', '3': 6, '4': 1, '5': 9, '10': 'dateUpdate'},
    const {'1': 'dateDelete', '3': 7, '4': 1, '5': 9, '10': 'dateDelete'},
  ],
};

/// Descriptor for `UpdatedUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatedUserResponseDescriptor = $convert.base64Decode('ChNVcGRhdGVkVXNlclJlc3BvbnNlEhYKBnVzZXJJZBgBIAEoBVIGdXNlcklkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFZW1haWwYAyABKAlSBWVtYWlsEiQKDXByb2ZpbGVQaWNVcmwYBCABKAlSDXByb2ZpbGVQaWNVcmwSHgoKZGF0ZUNyZWF0ZRgFIAEoCVIKZGF0ZUNyZWF0ZRIeCgpkYXRlVXBkYXRlGAYgASgJUgpkYXRlVXBkYXRlEh4KCmRhdGVEZWxldGUYByABKAlSCmRhdGVEZWxldGU=');
@$core.Deprecated('Use usersResponseDescriptor instead')
const UsersResponse$json = const {
  '1': 'UsersResponse',
  '2': const [
    const {'1': 'usersNew', '3': 1, '4': 3, '5': 11, '6': '.NewUserResponse', '10': 'usersNew'},
    const {'1': 'usersUpdated', '3': 2, '4': 3, '5': 11, '6': '.UpdatedUserResponse', '10': 'usersUpdated'},
  ],
};

/// Descriptor for `UsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersResponseDescriptor = $convert.base64Decode('Cg1Vc2Vyc1Jlc3BvbnNlEiwKCHVzZXJzTmV3GAEgAygLMhAuTmV3VXNlclJlc3BvbnNlUgh1c2Vyc05ldxI4Cgx1c2Vyc1VwZGF0ZWQYAiADKAsyFC5VcGRhdGVkVXNlclJlc3BvbnNlUgx1c2Vyc1VwZGF0ZWQ=');

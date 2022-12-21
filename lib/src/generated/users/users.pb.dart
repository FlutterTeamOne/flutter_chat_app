///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedDate', protoName: 'updatedDate')
    ..hasRequiredFields = false
  ;

  UserRequest._() : super();
  factory UserRequest({
    $core.int? userId,
    $core.String? updatedDate,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (updatedDate != null) {
      _result.updatedDate = updatedDate;
    }
    return _result;
  }
  factory UserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRequest clone() => UserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRequest copyWith(void Function(UserRequest) updates) => super.copyWith((message) => updates(message as UserRequest)) as UserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRequest create() => UserRequest._();
  UserRequest createEmptyInstance() => create();
  static $pb.PbList<UserRequest> createRepeated() => $pb.PbList<UserRequest>();
  @$core.pragma('dart2js:noInline')
  static UserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRequest>(create);
  static UserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get updatedDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set updatedDate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatedDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedDate() => clearField(2);
}

class UsersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UsersRequest', createEmptyInstance: create)
    ..pc<UserRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserRequest.create)
    ..hasRequiredFields = false
  ;

  UsersRequest._() : super();
  factory UsersRequest({
    $core.Iterable<UserRequest>? users,
  }) {
    final _result = create();
    if (users != null) {
      _result.users.addAll(users);
    }
    return _result;
  }
  factory UsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsersRequest clone() => UsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsersRequest copyWith(void Function(UsersRequest) updates) => super.copyWith((message) => updates(message as UsersRequest)) as UsersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UsersRequest create() => UsersRequest._();
  UsersRequest createEmptyInstance() => create();
  static $pb.PbList<UsersRequest> createRepeated() => $pb.PbList<UsersRequest>();
  @$core.pragma('dart2js:noInline')
  static UsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsersRequest>(create);
  static UsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserRequest> get users => $_getList(0);
}

class NewUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewUserResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicUrl', protoName: 'profilePicUrl')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateCreate', protoName: 'dateCreate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateUpdate', protoName: 'dateUpdate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateDelete', protoName: 'dateDelete')
    ..hasRequiredFields = false
  ;

  NewUserResponse._() : super();
  factory NewUserResponse({
    $core.int? userId,
    $core.String? name,
    $core.String? email,
    $core.String? profilePicUrl,
    $core.String? dateCreate,
    $core.String? dateUpdate,
    $core.String? dateDelete,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (email != null) {
      _result.email = email;
    }
    if (profilePicUrl != null) {
      _result.profilePicUrl = profilePicUrl;
    }
    if (dateCreate != null) {
      _result.dateCreate = dateCreate;
    }
    if (dateUpdate != null) {
      _result.dateUpdate = dateUpdate;
    }
    if (dateDelete != null) {
      _result.dateDelete = dateDelete;
    }
    return _result;
  }
  factory NewUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewUserResponse clone() => NewUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewUserResponse copyWith(void Function(NewUserResponse) updates) => super.copyWith((message) => updates(message as NewUserResponse)) as NewUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserResponse create() => NewUserResponse._();
  NewUserResponse createEmptyInstance() => create();
  static $pb.PbList<NewUserResponse> createRepeated() => $pb.PbList<NewUserResponse>();
  @$core.pragma('dart2js:noInline')
  static NewUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewUserResponse>(create);
  static NewUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get profilePicUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set profilePicUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProfilePicUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearProfilePicUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dateCreate => $_getSZ(4);
  @$pb.TagNumber(5)
  set dateCreate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateCreate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateCreate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dateUpdate => $_getSZ(5);
  @$pb.TagNumber(6)
  set dateUpdate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDateUpdate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateUpdate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get dateDelete => $_getSZ(6);
  @$pb.TagNumber(7)
  set dateDelete($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDateDelete() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateDelete() => clearField(7);
}

class UpdatedUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatedUserResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicUrl', protoName: 'profilePicUrl')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateCreate', protoName: 'dateCreate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateUpdate', protoName: 'dateUpdate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateDelete', protoName: 'dateDelete')
    ..hasRequiredFields = false
  ;

  UpdatedUserResponse._() : super();
  factory UpdatedUserResponse({
    $core.int? userId,
    $core.String? name,
    $core.String? email,
    $core.String? profilePicUrl,
    $core.String? dateCreate,
    $core.String? dateUpdate,
    $core.String? dateDelete,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (email != null) {
      _result.email = email;
    }
    if (profilePicUrl != null) {
      _result.profilePicUrl = profilePicUrl;
    }
    if (dateCreate != null) {
      _result.dateCreate = dateCreate;
    }
    if (dateUpdate != null) {
      _result.dateUpdate = dateUpdate;
    }
    if (dateDelete != null) {
      _result.dateDelete = dateDelete;
    }
    return _result;
  }
  factory UpdatedUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatedUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatedUserResponse clone() => UpdatedUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatedUserResponse copyWith(void Function(UpdatedUserResponse) updates) => super.copyWith((message) => updates(message as UpdatedUserResponse)) as UpdatedUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatedUserResponse create() => UpdatedUserResponse._();
  UpdatedUserResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatedUserResponse> createRepeated() => $pb.PbList<UpdatedUserResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatedUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatedUserResponse>(create);
  static UpdatedUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get profilePicUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set profilePicUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProfilePicUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearProfilePicUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dateCreate => $_getSZ(4);
  @$pb.TagNumber(5)
  set dateCreate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateCreate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateCreate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dateUpdate => $_getSZ(5);
  @$pb.TagNumber(6)
  set dateUpdate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDateUpdate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateUpdate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get dateDelete => $_getSZ(6);
  @$pb.TagNumber(7)
  set dateDelete($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDateDelete() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateDelete() => clearField(7);
}

class UsersResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UsersResponse', createEmptyInstance: create)
    ..pc<NewUserResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersNew', $pb.PbFieldType.PM, protoName: 'usersNew', subBuilder: NewUserResponse.create)
    ..pc<UpdatedUserResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersUpdated', $pb.PbFieldType.PM, protoName: 'usersUpdated', subBuilder: UpdatedUserResponse.create)
    ..hasRequiredFields = false
  ;

  UsersResponse._() : super();
  factory UsersResponse({
    $core.Iterable<NewUserResponse>? usersNew,
    $core.Iterable<UpdatedUserResponse>? usersUpdated,
  }) {
    final _result = create();
    if (usersNew != null) {
      _result.usersNew.addAll(usersNew);
    }
    if (usersUpdated != null) {
      _result.usersUpdated.addAll(usersUpdated);
    }
    return _result;
  }
  factory UsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsersResponse clone() => UsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsersResponse copyWith(void Function(UsersResponse) updates) => super.copyWith((message) => updates(message as UsersResponse)) as UsersResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UsersResponse create() => UsersResponse._();
  UsersResponse createEmptyInstance() => create();
  static $pb.PbList<UsersResponse> createRepeated() => $pb.PbList<UsersResponse>();
  @$core.pragma('dart2js:noInline')
  static UsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsersResponse>(create);
  static UsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewUserResponse> get usersNew => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<UpdatedUserResponse> get usersUpdated => $_getList(1);
}


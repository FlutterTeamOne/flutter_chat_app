///
//  Generated code. Do not modify.
//  source: chats.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetChatRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetChatRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetChatRequest._() : super();
  factory GetChatRequest({
    $core.int? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatRequest clone() => GetChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatRequest copyWith(void Function(GetChatRequest) updates) => super.copyWith((message) => updates(message as GetChatRequest)) as GetChatRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetChatRequest create() => GetChatRequest._();
  GetChatRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatRequest> createRepeated() => $pb.PbList<GetChatRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatRequest>(create);
  static GetChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetChatResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetChatResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friend1Id', $pb.PbFieldType.O3, protoName: 'friend1Id')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friend2Id', $pb.PbFieldType.O3, protoName: 'friend2Id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate', protoName: 'createdDate')
    ..hasRequiredFields = false
  ;

  GetChatResponse._() : super();
  factory GetChatResponse({
    $core.int? friend1Id,
    $core.int? friend2Id,
    $core.String? createdDate,
  }) {
    final _result = create();
    if (friend1Id != null) {
      _result.friend1Id = friend1Id;
    }
    if (friend2Id != null) {
      _result.friend2Id = friend2Id;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    return _result;
  }
  factory GetChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatResponse clone() => GetChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatResponse copyWith(void Function(GetChatResponse) updates) => super.copyWith((message) => updates(message as GetChatResponse)) as GetChatResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetChatResponse create() => GetChatResponse._();
  GetChatResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatResponse> createRepeated() => $pb.PbList<GetChatResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatResponse>(create);
  static GetChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get friend1Id => $_getIZ(0);
  @$pb.TagNumber(1)
  set friend1Id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFriend1Id() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriend1Id() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get friend2Id => $_getIZ(1);
  @$pb.TagNumber(2)
  set friend2Id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriend2Id() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriend2Id() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get createdDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set createdDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedDate() => clearField(3);
}

class CreateChatRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateChatRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friend1Id', $pb.PbFieldType.O3, protoName: 'friend1Id')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friend2Id', $pb.PbFieldType.O3, protoName: 'friend2Id')
    ..hasRequiredFields = false
  ;

  CreateChatRequest._() : super();
  factory CreateChatRequest({
    $core.int? friend1Id,
    $core.int? friend2Id,
  }) {
    final _result = create();
    if (friend1Id != null) {
      _result.friend1Id = friend1Id;
    }
    if (friend2Id != null) {
      _result.friend2Id = friend2Id;
    }
    return _result;
  }
  factory CreateChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatRequest clone() => CreateChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatRequest copyWith(void Function(CreateChatRequest) updates) => super.copyWith((message) => updates(message as CreateChatRequest)) as CreateChatRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateChatRequest create() => CreateChatRequest._();
  CreateChatRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChatRequest> createRepeated() => $pb.PbList<CreateChatRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatRequest>(create);
  static CreateChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get friend1Id => $_getIZ(0);
  @$pb.TagNumber(1)
  set friend1Id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFriend1Id() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriend1Id() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get friend2Id => $_getIZ(1);
  @$pb.TagNumber(2)
  set friend2Id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriend2Id() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriend2Id() => clearField(2);
}

class CreateChatResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateChatResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate', protoName: 'createdDate')
    ..hasRequiredFields = false
  ;

  CreateChatResponse._() : super();
  factory CreateChatResponse({
    $core.int? id,
    $core.String? createdDate,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    return _result;
  }
  factory CreateChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatResponse clone() => CreateChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatResponse copyWith(void Function(CreateChatResponse) updates) => super.copyWith((message) => updates(message as CreateChatResponse)) as CreateChatResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateChatResponse create() => CreateChatResponse._();
  CreateChatResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChatResponse> createRepeated() => $pb.PbList<CreateChatResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatResponse>(create);
  static CreateChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get createdDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set createdDate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedDate() => clearField(2);
}

class UpdateChatRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateChatRequest', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateChatRequest._() : super();
  factory UpdateChatRequest() => create();
  factory UpdateChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatRequest clone() => UpdateChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatRequest copyWith(void Function(UpdateChatRequest) updates) => super.copyWith((message) => updates(message as UpdateChatRequest)) as UpdateChatRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateChatRequest create() => UpdateChatRequest._();
  UpdateChatRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateChatRequest> createRepeated() => $pb.PbList<UpdateChatRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatRequest>(create);
  static UpdateChatRequest? _defaultInstance;
}

class UpdateChatResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateChatResponse', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateChatResponse._() : super();
  factory UpdateChatResponse() => create();
  factory UpdateChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatResponse clone() => UpdateChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatResponse copyWith(void Function(UpdateChatResponse) updates) => super.copyWith((message) => updates(message as UpdateChatResponse)) as UpdateChatResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateChatResponse create() => UpdateChatResponse._();
  UpdateChatResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateChatResponse> createRepeated() => $pb.PbList<UpdateChatResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatResponse>(create);
  static UpdateChatResponse? _defaultInstance;
}

class DeleteChatRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteChatRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeleteChatRequest._() : super();
  factory DeleteChatRequest({
    $core.int? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatRequest clone() => DeleteChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatRequest copyWith(void Function(DeleteChatRequest) updates) => super.copyWith((message) => updates(message as DeleteChatRequest)) as DeleteChatRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteChatRequest create() => DeleteChatRequest._();
  DeleteChatRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteChatRequest> createRepeated() => $pb.PbList<DeleteChatRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatRequest>(create);
  static DeleteChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteChatResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteChatResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateDeleted', protoName: 'dateDeleted')
    ..hasRequiredFields = false
  ;

  DeleteChatResponse._() : super();
  factory DeleteChatResponse({
    $core.String? dateDeleted,
  }) {
    final _result = create();
    if (dateDeleted != null) {
      _result.dateDeleted = dateDeleted;
    }
    return _result;
  }
  factory DeleteChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatResponse clone() => DeleteChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatResponse copyWith(void Function(DeleteChatResponse) updates) => super.copyWith((message) => updates(message as DeleteChatResponse)) as DeleteChatResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteChatResponse create() => DeleteChatResponse._();
  DeleteChatResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteChatResponse> createRepeated() => $pb.PbList<DeleteChatResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatResponse>(create);
  static DeleteChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dateDeleted => $_getSZ(0);
  @$pb.TagNumber(1)
  set dateDeleted($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDateDeleted() => $_has(0);
  @$pb.TagNumber(1)
  void clearDateDeleted() => clearField(1);
}


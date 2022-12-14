///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class CreateMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMessageRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatIdMain', $pb.PbFieldType.O3, protoName: 'chatIdMain')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderMainId', $pb.PbFieldType.O3, protoName: 'senderMainId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..hasRequiredFields = false
  ;

  CreateMessageRequest._() : super();
  factory CreateMessageRequest({
    $core.int? chatIdMain,
    $core.int? senderMainId,
    $core.String? content,
  }) {
    final _result = create();
    if (chatIdMain != null) {
      _result.chatIdMain = chatIdMain;
    }
    if (senderMainId != null) {
      _result.senderMainId = senderMainId;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory CreateMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMessageRequest clone() => CreateMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMessageRequest copyWith(void Function(CreateMessageRequest) updates) => super.copyWith((message) => updates(message as CreateMessageRequest)) as CreateMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateMessageRequest create() => CreateMessageRequest._();
  CreateMessageRequest createEmptyInstance() => create();
  static $pb.PbList<CreateMessageRequest> createRepeated() => $pb.PbList<CreateMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMessageRequest>(create);
  static CreateMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatIdMain => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatIdMain($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatIdMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatIdMain() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get senderMainId => $_getIZ(1);
  @$pb.TagNumber(2)
  set senderMainId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderMainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderMainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
}

class CreateMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMessageResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainMessagesId', $pb.PbFieldType.O3, protoName: 'mainMessagesId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateCreate', protoName: 'dateCreate')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isWritten', protoName: 'isWritten')
    ..hasRequiredFields = false
  ;

  CreateMessageResponse._() : super();
  factory CreateMessageResponse({
    $core.int? mainMessagesId,
    $core.String? dateCreate,
    $core.bool? isWritten,
  }) {
    final _result = create();
    if (mainMessagesId != null) {
      _result.mainMessagesId = mainMessagesId;
    }
    if (dateCreate != null) {
      _result.dateCreate = dateCreate;
    }
    if (isWritten != null) {
      _result.isWritten = isWritten;
    }
    return _result;
  }
  factory CreateMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMessageResponse clone() => CreateMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMessageResponse copyWith(void Function(CreateMessageResponse) updates) => super.copyWith((message) => updates(message as CreateMessageResponse)) as CreateMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateMessageResponse create() => CreateMessageResponse._();
  CreateMessageResponse createEmptyInstance() => create();
  static $pb.PbList<CreateMessageResponse> createRepeated() => $pb.PbList<CreateMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMessageResponse>(create);
  static CreateMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainMessagesId => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainMessagesId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMainMessagesId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainMessagesId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dateCreate => $_getSZ(1);
  @$pb.TagNumber(2)
  set dateCreate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDateCreate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateCreate() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isWritten => $_getBF(2);
  @$pb.TagNumber(3)
  set isWritten($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsWritten() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsWritten() => clearField(3);
}

class UpdateMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMessageRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idMessageMain', $pb.PbFieldType.O3, protoName: 'idMessageMain')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..hasRequiredFields = false
  ;

  UpdateMessageRequest._() : super();
  factory UpdateMessageRequest({
    $core.int? idMessageMain,
    $core.String? content,
  }) {
    final _result = create();
    if (idMessageMain != null) {
      _result.idMessageMain = idMessageMain;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory UpdateMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMessageRequest clone() => UpdateMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMessageRequest copyWith(void Function(UpdateMessageRequest) updates) => super.copyWith((message) => updates(message as UpdateMessageRequest)) as UpdateMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageRequest create() => UpdateMessageRequest._();
  UpdateMessageRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageRequest> createRepeated() => $pb.PbList<UpdateMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMessageRequest>(create);
  static UpdateMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idMessageMain => $_getIZ(0);
  @$pb.TagNumber(1)
  set idMessageMain($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdMessageMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdMessageMain() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class UpdateMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMessageResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idMessageMain', $pb.PbFieldType.O3, protoName: 'idMessageMain')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateUpdate', protoName: 'dateUpdate')
    ..hasRequiredFields = false
  ;

  UpdateMessageResponse._() : super();
  factory UpdateMessageResponse({
    $core.int? idMessageMain,
    $core.String? dateUpdate,
  }) {
    final _result = create();
    if (idMessageMain != null) {
      _result.idMessageMain = idMessageMain;
    }
    if (dateUpdate != null) {
      _result.dateUpdate = dateUpdate;
    }
    return _result;
  }
  factory UpdateMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMessageResponse clone() => UpdateMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMessageResponse copyWith(void Function(UpdateMessageResponse) updates) => super.copyWith((message) => updates(message as UpdateMessageResponse)) as UpdateMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMessageResponse create() => UpdateMessageResponse._();
  UpdateMessageResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateMessageResponse> createRepeated() => $pb.PbList<UpdateMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMessageResponse>(create);
  static UpdateMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idMessageMain => $_getIZ(0);
  @$pb.TagNumber(1)
  set idMessageMain($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdMessageMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdMessageMain() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dateUpdate => $_getSZ(1);
  @$pb.TagNumber(2)
  set dateUpdate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDateUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateUpdate() => clearField(2);
}

class DeleteMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteMessageRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idMessageMain', $pb.PbFieldType.O3, protoName: 'idMessageMain')
    ..hasRequiredFields = false
  ;

  DeleteMessageRequest._() : super();
  factory DeleteMessageRequest({
    $core.int? idMessageMain,
  }) {
    final _result = create();
    if (idMessageMain != null) {
      _result.idMessageMain = idMessageMain;
    }
    return _result;
  }
  factory DeleteMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMessageRequest clone() => DeleteMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMessageRequest copyWith(void Function(DeleteMessageRequest) updates) => super.copyWith((message) => updates(message as DeleteMessageRequest)) as DeleteMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteMessageRequest create() => DeleteMessageRequest._();
  DeleteMessageRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteMessageRequest> createRepeated() => $pb.PbList<DeleteMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMessageRequest>(create);
  static DeleteMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idMessageMain => $_getIZ(0);
  @$pb.TagNumber(1)
  set idMessageMain($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdMessageMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdMessageMain() => clearField(1);
}

class DeleteMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteMessageResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idMessageMain', $pb.PbFieldType.O3, protoName: 'idMessageMain')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateDelete', protoName: 'dateDelete')
    ..hasRequiredFields = false
  ;

  DeleteMessageResponse._() : super();
  factory DeleteMessageResponse({
    $core.int? idMessageMain,
    $core.String? dateDelete,
  }) {
    final _result = create();
    if (idMessageMain != null) {
      _result.idMessageMain = idMessageMain;
    }
    if (dateDelete != null) {
      _result.dateDelete = dateDelete;
    }
    return _result;
  }
  factory DeleteMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMessageResponse clone() => DeleteMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMessageResponse copyWith(void Function(DeleteMessageResponse) updates) => super.copyWith((message) => updates(message as DeleteMessageResponse)) as DeleteMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteMessageResponse create() => DeleteMessageResponse._();
  DeleteMessageResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteMessageResponse> createRepeated() => $pb.PbList<DeleteMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMessageResponse>(create);
  static DeleteMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idMessageMain => $_getIZ(0);
  @$pb.TagNumber(1)
  set idMessageMain($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdMessageMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdMessageMain() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dateDelete => $_getSZ(1);
  @$pb.TagNumber(2)
  set dateDelete($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDateDelete() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateDelete() => clearField(2);
}

class MessageBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageBase', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainMessagesId', $pb.PbFieldType.O3, protoName: 'mainMessagesId')
    ..hasRequiredFields = false
  ;

  MessageBase._() : super();
  factory MessageBase({
    $core.bool? ok,
    $core.int? mainMessagesId,
  }) {
    final _result = create();
    if (ok != null) {
      _result.ok = ok;
    }
    if (mainMessagesId != null) {
      _result.mainMessagesId = mainMessagesId;
    }
    return _result;
  }
  factory MessageBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageBase clone() => MessageBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageBase copyWith(void Function(MessageBase) updates) => super.copyWith((message) => updates(message as MessageBase)) as MessageBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageBase create() => MessageBase._();
  MessageBase createEmptyInstance() => create();
  static $pb.PbList<MessageBase> createRepeated() => $pb.PbList<MessageBase>();
  @$core.pragma('dart2js:noInline')
  static MessageBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageBase>(create);
  static MessageBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mainMessagesId => $_getIZ(1);
  @$pb.TagNumber(2)
  set mainMessagesId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMainMessagesId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainMessagesId() => clearField(2);
}

class LastMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LastMessage', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainIdMessage', $pb.PbFieldType.O3, protoName: 'mainIdMessage')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainIdUser', $pb.PbFieldType.O3, protoName: 'mainIdUser')
    ..hasRequiredFields = false
  ;

  LastMessage._() : super();
  factory LastMessage({
    $core.int? mainIdMessage,
    $core.int? mainIdUser,
  }) {
    final _result = create();
    if (mainIdMessage != null) {
      _result.mainIdMessage = mainIdMessage;
    }
    if (mainIdUser != null) {
      _result.mainIdUser = mainIdUser;
    }
    return _result;
  }
  factory LastMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LastMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LastMessage clone() => LastMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LastMessage copyWith(void Function(LastMessage) updates) => super.copyWith((message) => updates(message as LastMessage)) as LastMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LastMessage create() => LastMessage._();
  LastMessage createEmptyInstance() => create();
  static $pb.PbList<LastMessage> createRepeated() => $pb.PbList<LastMessage>();
  @$core.pragma('dart2js:noInline')
  static LastMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LastMessage>(create);
  static LastMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainIdMessage => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainIdMessage($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMainIdMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainIdMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mainIdUser => $_getIZ(1);
  @$pb.TagNumber(2)
  set mainIdUser($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMainIdUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainIdUser() => clearField(2);
}

class MessageFromBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageFromBase', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatIdMain', $pb.PbFieldType.O3, protoName: 'chatIdMain')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderMainId', $pb.PbFieldType.O3, protoName: 'senderMainId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainIdMessage', $pb.PbFieldType.O3, protoName: 'mainIdMessage')
    ..hasRequiredFields = false
  ;

  MessageFromBase._() : super();
  factory MessageFromBase({
    $core.int? chatIdMain,
    $core.int? senderMainId,
    $core.String? content,
    $core.String? date,
    $core.int? mainIdMessage,
  }) {
    final _result = create();
    if (chatIdMain != null) {
      _result.chatIdMain = chatIdMain;
    }
    if (senderMainId != null) {
      _result.senderMainId = senderMainId;
    }
    if (content != null) {
      _result.content = content;
    }
    if (date != null) {
      _result.date = date;
    }
    if (mainIdMessage != null) {
      _result.mainIdMessage = mainIdMessage;
    }
    return _result;
  }
  factory MessageFromBase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageFromBase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageFromBase clone() => MessageFromBase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageFromBase copyWith(void Function(MessageFromBase) updates) => super.copyWith((message) => updates(message as MessageFromBase)) as MessageFromBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageFromBase create() => MessageFromBase._();
  MessageFromBase createEmptyInstance() => create();
  static $pb.PbList<MessageFromBase> createRepeated() => $pb.PbList<MessageFromBase>();
  @$core.pragma('dart2js:noInline')
  static MessageFromBase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageFromBase>(create);
  static MessageFromBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatIdMain => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatIdMain($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatIdMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatIdMain() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get senderMainId => $_getIZ(1);
  @$pb.TagNumber(2)
  set senderMainId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderMainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderMainId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get date => $_getSZ(3);
  @$pb.TagNumber(4)
  set date($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get mainIdMessage => $_getIZ(4);
  @$pb.TagNumber(5)
  set mainIdMessage($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMainIdMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMainIdMessage() => clearField(5);
}


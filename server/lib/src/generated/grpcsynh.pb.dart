///
//  Generated code. Do not modify.
//  source: grpcsynh.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'grpcsynh.pbenum.dart';

export 'grpcsynh.pbenum.dart';

class SynhMainUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SynhMainUser', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3, protoName: 'chatId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3, protoName: 'messageId')
    ..hasRequiredFields = false
  ;

  SynhMainUser._() : super();
  factory SynhMainUser({
    $core.int? id,
    $core.int? chatId,
    $core.int? messageId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    return _result;
  }
  factory SynhMainUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SynhMainUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SynhMainUser clone() => SynhMainUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SynhMainUser copyWith(void Function(SynhMainUser) updates) => super.copyWith((message) => updates(message as SynhMainUser)) as SynhMainUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SynhMainUser create() => SynhMainUser._();
  SynhMainUser createEmptyInstance() => create();
  static $pb.PbList<SynhMainUser> createRepeated() => $pb.PbList<SynhMainUser>();
  @$core.pragma('dart2js:noInline')
  static SynhMainUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SynhMainUser>(create);
  static SynhMainUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chatId => $_getIZ(1);
  @$pb.TagNumber(2)
  set chatId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get messageId => $_getIZ(2);
  @$pb.TagNumber(3)
  set messageId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageId() => clearField(3);
}

class SynhUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SynhUser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'picture')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deletedDate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateDate')
    ..hasRequiredFields = false
  ;

  SynhUser._() : super();
  factory SynhUser({
    $core.String? name,
    $core.int? userId,
    $core.String? email,
    $core.String? createdDate,
    $core.String? picture,
    $core.String? deletedDate,
    $core.String? updateDate,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (email != null) {
      _result.email = email;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    if (picture != null) {
      _result.picture = picture;
    }
    if (deletedDate != null) {
      _result.deletedDate = deletedDate;
    }
    if (updateDate != null) {
      _result.updateDate = updateDate;
    }
    return _result;
  }
  factory SynhUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SynhUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SynhUser clone() => SynhUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SynhUser copyWith(void Function(SynhUser) updates) => super.copyWith((message) => updates(message as SynhUser)) as SynhUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SynhUser create() => SynhUser._();
  SynhUser createEmptyInstance() => create();
  static $pb.PbList<SynhUser> createRepeated() => $pb.PbList<SynhUser>();
  @$core.pragma('dart2js:noInline')
  static SynhUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SynhUser>(create);
  static SynhUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get picture => $_getSZ(4);
  @$pb.TagNumber(5)
  set picture($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPicture() => $_has(4);
  @$pb.TagNumber(5)
  void clearPicture() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deletedDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set deletedDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeletedDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeletedDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updateDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set updateDate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateDate() => clearField(7);
}

class SynhChat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SynhChat', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deletedDate')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateDate')
    ..hasRequiredFields = false
  ;

  SynhChat._() : super();
  factory SynhChat({
    $core.int? chatId,
    $core.int? userId,
    $core.String? createdDate,
    $core.String? deletedDate,
    $core.String? updateDate,
  }) {
    final _result = create();
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    if (deletedDate != null) {
      _result.deletedDate = deletedDate;
    }
    if (updateDate != null) {
      _result.updateDate = updateDate;
    }
    return _result;
  }
  factory SynhChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SynhChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SynhChat clone() => SynhChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SynhChat copyWith(void Function(SynhChat) updates) => super.copyWith((message) => updates(message as SynhChat)) as SynhChat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SynhChat create() => SynhChat._();
  SynhChat createEmptyInstance() => create();
  static $pb.PbList<SynhChat> createRepeated() => $pb.PbList<SynhChat>();
  @$core.pragma('dart2js:noInline')
  static SynhChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SynhChat>(create);
  static SynhChat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get createdDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set createdDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deletedDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set deletedDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeletedDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeletedDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get updateDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set updateDate($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateDate() => clearField(5);
}

class SynhMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SynhMessage', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'localMessageId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdDate')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedDate')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deletedDate')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRead', $pb.PbFieldType.O3)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attachmentId', $pb.PbFieldType.O3, protoName: 'attachmentId')
    ..e<ContentTypeSynch>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType', $pb.PbFieldType.OE, protoName: 'contentType', defaultOrMaker: ContentTypeSynch.isText, valueOf: ContentTypeSynch.valueOf, enumValues: ContentTypeSynch.values)
    ..hasRequiredFields = false
  ;

  SynhMessage._() : super();
  factory SynhMessage({
    $core.int? localMessageId,
    $core.int? senderId,
    $core.int? chatId,
    $core.String? createdDate,
    $core.int? messageId,
    $core.String? content,
    $core.String? updatedDate,
    $core.String? deletedDate,
    $core.int? isRead,
    $core.int? attachmentId,
    ContentTypeSynch? contentType,
  }) {
    final _result = create();
    if (localMessageId != null) {
      _result.localMessageId = localMessageId;
    }
    if (senderId != null) {
      _result.senderId = senderId;
    }
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (createdDate != null) {
      _result.createdDate = createdDate;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (content != null) {
      _result.content = content;
    }
    if (updatedDate != null) {
      _result.updatedDate = updatedDate;
    }
    if (deletedDate != null) {
      _result.deletedDate = deletedDate;
    }
    if (isRead != null) {
      _result.isRead = isRead;
    }
    if (attachmentId != null) {
      _result.attachmentId = attachmentId;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    return _result;
  }
  factory SynhMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SynhMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SynhMessage clone() => SynhMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SynhMessage copyWith(void Function(SynhMessage) updates) => super.copyWith((message) => updates(message as SynhMessage)) as SynhMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SynhMessage create() => SynhMessage._();
  SynhMessage createEmptyInstance() => create();
  static $pb.PbList<SynhMessage> createRepeated() => $pb.PbList<SynhMessage>();
  @$core.pragma('dart2js:noInline')
  static SynhMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SynhMessage>(create);
  static SynhMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get localMessageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set localMessageId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get senderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set senderId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get chatId => $_getIZ(2);
  @$pb.TagNumber(3)
  set chatId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get messageId => $_getIZ(4);
  @$pb.TagNumber(5)
  set messageId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updatedDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set updatedDate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedDate() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get deletedDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set deletedDate($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDeletedDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeletedDate() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get isRead => $_getIZ(8);
  @$pb.TagNumber(9)
  set isRead($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsRead() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsRead() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get attachmentId => $_getIZ(9);
  @$pb.TagNumber(10)
  set attachmentId($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAttachmentId() => $_has(9);
  @$pb.TagNumber(10)
  void clearAttachmentId() => clearField(10);

  @$pb.TagNumber(11)
  ContentTypeSynch get contentType => $_getN(10);
  @$pb.TagNumber(11)
  set contentType(ContentTypeSynch v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasContentType() => $_has(10);
  @$pb.TagNumber(11)
  void clearContentType() => clearField(11);
}

class DataDBResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataDBResponse', createEmptyInstance: create)
    ..pc<SynhUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', $pb.PbFieldType.PM, subBuilder: SynhUser.create)
    ..pc<SynhChat>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chats', $pb.PbFieldType.PM, subBuilder: SynhChat.create)
    ..pc<SynhMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: SynhMessage.create)
    ..hasRequiredFields = false
  ;

  DataDBResponse._() : super();
  factory DataDBResponse({
    $core.Iterable<SynhUser>? users,
    $core.Iterable<SynhChat>? chats,
    $core.Iterable<SynhMessage>? messages,
  }) {
    final _result = create();
    if (users != null) {
      _result.users.addAll(users);
    }
    if (chats != null) {
      _result.chats.addAll(chats);
    }
    if (messages != null) {
      _result.messages.addAll(messages);
    }
    return _result;
  }
  factory DataDBResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataDBResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataDBResponse clone() => DataDBResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataDBResponse copyWith(void Function(DataDBResponse) updates) => super.copyWith((message) => updates(message as DataDBResponse)) as DataDBResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataDBResponse create() => DataDBResponse._();
  DataDBResponse createEmptyInstance() => create();
  static $pb.PbList<DataDBResponse> createRepeated() => $pb.PbList<DataDBResponse>();
  @$core.pragma('dart2js:noInline')
  static DataDBResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataDBResponse>(create);
  static DataDBResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SynhUser> get users => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SynhChat> get chats => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<SynhMessage> get messages => $_getList(2);
}


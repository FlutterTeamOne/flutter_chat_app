///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

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

class DynamicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DynamicRequest', createEmptyInstance: create)
    ..aOM<CreateMessageRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createMessage', protoName: 'createMessage', subBuilder: CreateMessageRequest.create)
    ..aOM<UpdateMessageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateMessage', protoName: 'updateMessage', subBuilder: UpdateMessageRequest.create)
    ..aOM<DeleteMessageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteMessage', protoName: 'deleteMessage', subBuilder: DeleteMessageRequest.create)
    ..aOM<ReadMessageRequest>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readMessage', protoName: 'readMessage', subBuilder: ReadMessageRequest.create)
    ..e<MessageStateEnum>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageState', $pb.PbFieldType.OE, protoName: 'messageState', defaultOrMaker: MessageStateEnum.connecting, valueOf: MessageStateEnum.valueOf, enumValues: MessageStateEnum.values)
    ..hasRequiredFields = false
  ;

  DynamicRequest._() : super();
  factory DynamicRequest({
    CreateMessageRequest? createMessage,
    UpdateMessageRequest? updateMessage,
    DeleteMessageRequest? deleteMessage,
    ReadMessageRequest? readMessage,
    MessageStateEnum? messageState,
  }) {
    final _result = create();
    if (createMessage != null) {
      _result.createMessage = createMessage;
    }
    if (updateMessage != null) {
      _result.updateMessage = updateMessage;
    }
    if (deleteMessage != null) {
      _result.deleteMessage = deleteMessage;
    }
    if (readMessage != null) {
      _result.readMessage = readMessage;
    }
    if (messageState != null) {
      _result.messageState = messageState;
    }
    return _result;
  }
  factory DynamicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DynamicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DynamicRequest clone() => DynamicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DynamicRequest copyWith(void Function(DynamicRequest) updates) => super.copyWith((message) => updates(message as DynamicRequest)) as DynamicRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DynamicRequest create() => DynamicRequest._();
  DynamicRequest createEmptyInstance() => create();
  static $pb.PbList<DynamicRequest> createRepeated() => $pb.PbList<DynamicRequest>();
  @$core.pragma('dart2js:noInline')
  static DynamicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DynamicRequest>(create);
  static DynamicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  CreateMessageRequest get createMessage => $_getN(0);
  @$pb.TagNumber(1)
  set createMessage(CreateMessageRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateMessage() => clearField(1);
  @$pb.TagNumber(1)
  CreateMessageRequest ensureCreateMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  UpdateMessageRequest get updateMessage => $_getN(1);
  @$pb.TagNumber(2)
  set updateMessage(UpdateMessageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdateMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMessage() => clearField(2);
  @$pb.TagNumber(2)
  UpdateMessageRequest ensureUpdateMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  DeleteMessageRequest get deleteMessage => $_getN(2);
  @$pb.TagNumber(3)
  set deleteMessage(DeleteMessageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeleteMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleteMessage() => clearField(3);
  @$pb.TagNumber(3)
  DeleteMessageRequest ensureDeleteMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  ReadMessageRequest get readMessage => $_getN(3);
  @$pb.TagNumber(4)
  set readMessage(ReadMessageRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReadMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearReadMessage() => clearField(4);
  @$pb.TagNumber(4)
  ReadMessageRequest ensureReadMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  MessageStateEnum get messageState => $_getN(4);
  @$pb.TagNumber(5)
  set messageState(MessageStateEnum v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessageState() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageState() => clearField(5);
}

class DynamicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DynamicResponse', createEmptyInstance: create)
    ..aOM<CreateMessageResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createMessage', protoName: 'createMessage', subBuilder: CreateMessageResponse.create)
    ..aOM<UpdateMessageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateMessage', protoName: 'updateMessage', subBuilder: UpdateMessageResponse.create)
    ..aOM<DeleteMessageResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteMessage', protoName: 'deleteMessage', subBuilder: DeleteMessageResponse.create)
    ..aOM<ReadMessageResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readMessage', protoName: 'readMessage', subBuilder: ReadMessageResponse.create)
    ..e<MessageStateEnum>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageState', $pb.PbFieldType.OE, protoName: 'messageState', defaultOrMaker: MessageStateEnum.connecting, valueOf: MessageStateEnum.valueOf, enumValues: MessageStateEnum.values)
    ..hasRequiredFields = false
  ;

  DynamicResponse._() : super();
  factory DynamicResponse({
    CreateMessageResponse? createMessage,
    UpdateMessageResponse? updateMessage,
    DeleteMessageResponse? deleteMessage,
    ReadMessageResponse? readMessage,
    MessageStateEnum? messageState,
  }) {
    final _result = create();
    if (createMessage != null) {
      _result.createMessage = createMessage;
    }
    if (updateMessage != null) {
      _result.updateMessage = updateMessage;
    }
    if (deleteMessage != null) {
      _result.deleteMessage = deleteMessage;
    }
    if (readMessage != null) {
      _result.readMessage = readMessage;
    }
    if (messageState != null) {
      _result.messageState = messageState;
    }
    return _result;
  }
  factory DynamicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DynamicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DynamicResponse clone() => DynamicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DynamicResponse copyWith(void Function(DynamicResponse) updates) => super.copyWith((message) => updates(message as DynamicResponse)) as DynamicResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DynamicResponse create() => DynamicResponse._();
  DynamicResponse createEmptyInstance() => create();
  static $pb.PbList<DynamicResponse> createRepeated() => $pb.PbList<DynamicResponse>();
  @$core.pragma('dart2js:noInline')
  static DynamicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DynamicResponse>(create);
  static DynamicResponse? _defaultInstance;

  @$pb.TagNumber(1)
  CreateMessageResponse get createMessage => $_getN(0);
  @$pb.TagNumber(1)
  set createMessage(CreateMessageResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateMessage() => clearField(1);
  @$pb.TagNumber(1)
  CreateMessageResponse ensureCreateMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  UpdateMessageResponse get updateMessage => $_getN(1);
  @$pb.TagNumber(2)
  set updateMessage(UpdateMessageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdateMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMessage() => clearField(2);
  @$pb.TagNumber(2)
  UpdateMessageResponse ensureUpdateMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  DeleteMessageResponse get deleteMessage => $_getN(2);
  @$pb.TagNumber(3)
  set deleteMessage(DeleteMessageResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeleteMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleteMessage() => clearField(3);
  @$pb.TagNumber(3)
  DeleteMessageResponse ensureDeleteMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  ReadMessageResponse get readMessage => $_getN(3);
  @$pb.TagNumber(4)
  set readMessage(ReadMessageResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReadMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearReadMessage() => clearField(4);
  @$pb.TagNumber(4)
  ReadMessageResponse ensureReadMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  MessageStateEnum get messageState => $_getN(4);
  @$pb.TagNumber(5)
  set messageState(MessageStateEnum v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessageState() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessageState() => clearField(5);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Message', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3, protoName: 'messageId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3, protoName: 'chatId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderId', $pb.PbFieldType.O3, protoName: 'senderId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateCreate', protoName: 'dateCreate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateUpdate', protoName: 'dateUpdate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateDelete', protoName: 'dateDelete')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRead', $pb.PbFieldType.O3, protoName: 'isRead')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'localMessgaeId', $pb.PbFieldType.O3, protoName: 'localMessgaeId')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attachmentId', $pb.PbFieldType.O3, protoName: 'attachmentId')
    ..e<ContentType>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType', $pb.PbFieldType.OE, protoName: 'contentType', defaultOrMaker: ContentType.isText, valueOf: ContentType.valueOf, enumValues: ContentType.values)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message({
    $core.int? messageId,
    $core.int? chatId,
    $core.int? senderId,
    $core.String? content,
    $core.String? dateCreate,
    $core.String? dateUpdate,
    $core.String? dateDelete,
    $core.int? isRead,
    $core.int? localMessgaeId,
    $core.int? attachmentId,
    ContentType? contentType,
  }) {
    final _result = create();
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (senderId != null) {
      _result.senderId = senderId;
    }
    if (content != null) {
      _result.content = content;
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
    if (isRead != null) {
      _result.isRead = isRead;
    }
    if (localMessgaeId != null) {
      _result.localMessgaeId = localMessgaeId;
    }
    if (attachmentId != null) {
      _result.attachmentId = attachmentId;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    return _result;
  }
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chatId => $_getIZ(1);
  @$pb.TagNumber(2)
  set chatId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get senderId => $_getIZ(2);
  @$pb.TagNumber(3)
  set senderId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSenderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

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

  @$pb.TagNumber(8)
  $core.int get isRead => $_getIZ(7);
  @$pb.TagNumber(8)
  set isRead($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsRead() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsRead() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get localMessgaeId => $_getIZ(8);
  @$pb.TagNumber(9)
  set localMessgaeId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLocalMessgaeId() => $_has(8);
  @$pb.TagNumber(9)
  void clearLocalMessgaeId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get attachmentId => $_getIZ(9);
  @$pb.TagNumber(10)
  set attachmentId($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAttachmentId() => $_has(9);
  @$pb.TagNumber(10)
  void clearAttachmentId() => clearField(10);

  @$pb.TagNumber(11)
  ContentType get contentType => $_getN(10);
  @$pb.TagNumber(11)
  set contentType(ContentType v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasContentType() => $_has(10);
  @$pb.TagNumber(11)
  void clearContentType() => clearField(11);
}

class ReadMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadMessageRequest', createEmptyInstance: create)
    ..aOM<Message>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  ReadMessageRequest._() : super();
  factory ReadMessageRequest({
    Message? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ReadMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadMessageRequest clone() => ReadMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadMessageRequest copyWith(void Function(ReadMessageRequest) updates) => super.copyWith((message) => updates(message as ReadMessageRequest)) as ReadMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadMessageRequest create() => ReadMessageRequest._();
  ReadMessageRequest createEmptyInstance() => create();
  static $pb.PbList<ReadMessageRequest> createRepeated() => $pb.PbList<ReadMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadMessageRequest>(create);
  static ReadMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);
}

class ReadMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadMessageResponse', createEmptyInstance: create)
    ..aOM<Message>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: Message.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isWritten', protoName: 'isWritten')
    ..hasRequiredFields = false
  ;

  ReadMessageResponse._() : super();
  factory ReadMessageResponse({
    Message? message,
    $core.bool? isWritten,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (isWritten != null) {
      _result.isWritten = isWritten;
    }
    return _result;
  }
  factory ReadMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadMessageResponse clone() => ReadMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadMessageResponse copyWith(void Function(ReadMessageResponse) updates) => super.copyWith((message) => updates(message as ReadMessageResponse)) as ReadMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadMessageResponse create() => ReadMessageResponse._();
  ReadMessageResponse createEmptyInstance() => create();
  static $pb.PbList<ReadMessageResponse> createRepeated() => $pb.PbList<ReadMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadMessageResponse>(create);
  static ReadMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isWritten => $_getBF(1);
  @$pb.TagNumber(2)
  set isWritten($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsWritten() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsWritten() => clearField(2);
}

class CreateMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMessageRequest', createEmptyInstance: create)
    ..aOM<Message>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  CreateMessageRequest._() : super();
  factory CreateMessageRequest({
    Message? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
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
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);
}

class CreateMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMessageResponse', createEmptyInstance: create)
    ..aOM<Message>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: Message.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isWriten', $pb.PbFieldType.O3, protoName: 'isWriten')
    ..hasRequiredFields = false
  ;

  CreateMessageResponse._() : super();
  factory CreateMessageResponse({
    Message? message,
    $core.int? isWriten,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (isWriten != null) {
      _result.isWriten = isWriten;
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
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get isWriten => $_getIZ(1);
  @$pb.TagNumber(2)
  set isWriten($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsWriten() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsWriten() => clearField(2);
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
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateUpdate', protoName: 'dateUpdate')
    ..hasRequiredFields = false
  ;

  UpdateMessageResponse._() : super();
  factory UpdateMessageResponse({
    $core.int? idMessageMain,
    $core.String? content,
    $core.String? dateUpdate,
  }) {
    final _result = create();
    if (idMessageMain != null) {
      _result.idMessageMain = idMessageMain;
    }
    if (content != null) {
      _result.content = content;
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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dateUpdate => $_getSZ(2);
  @$pb.TagNumber(3)
  set dateUpdate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateUpdate() => clearField(3);
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


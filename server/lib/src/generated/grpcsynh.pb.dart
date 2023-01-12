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

class ChatRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatId', $pb.PbFieldType.O3, protoName: 'chatId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedDate', protoName: 'updatedDate')
    ..hasRequiredFields = false
  ;

  ChatRequest._() : super();
  factory ChatRequest({
    $core.int? chatId,
    $core.String? updatedDate,
  }) {
    final _result = create();
    if (chatId != null) {
      _result.chatId = chatId;
    }
    if (updatedDate != null) {
      _result.updatedDate = updatedDate;
    }
    return _result;
  }
  factory ChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatRequest clone() => ChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatRequest copyWith(void Function(ChatRequest) updates) => super.copyWith((message) => updates(message as ChatRequest)) as ChatRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatRequest create() => ChatRequest._();
  ChatRequest createEmptyInstance() => create();
  static $pb.PbList<ChatRequest> createRepeated() => $pb.PbList<ChatRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatRequest>(create);
  static ChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get updatedDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set updatedDate($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatedDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedDate() => clearField(2);
}

class MessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageId', $pb.PbFieldType.O3, protoName: 'messageId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedDate', protoName: 'updatedDate')
    ..hasRequiredFields = false
  ;

  MessageRequest._() : super();
  factory MessageRequest({
    $core.int? messageId,
    $core.String? updatedDate,
  }) {
    final _result = create();
    if (messageId != null) {
      _result.messageId = messageId;
    }
    if (updatedDate != null) {
      _result.updatedDate = updatedDate;
    }
    return _result;
  }
  factory MessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageRequest clone() => MessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageRequest copyWith(void Function(MessageRequest) updates) => super.copyWith((message) => updates(message as MessageRequest)) as MessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageRequest create() => MessageRequest._();
  MessageRequest createEmptyInstance() => create();
  static $pb.PbList<MessageRequest> createRepeated() => $pb.PbList<MessageRequest>();
  @$core.pragma('dart2js:noInline')
  static MessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageRequest>(create);
  static MessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

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
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainUser', $pb.PbFieldType.O3, protoName: 'mainUser')
    ..pc<UserRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersForUpdate', $pb.PbFieldType.PM, protoName: 'usersForUpdate', subBuilder: UserRequest.create)
    ..hasRequiredFields = false
  ;

  UsersRequest._() : super();
  factory UsersRequest({
    $core.int? mainUser,
    $core.Iterable<UserRequest>? usersForUpdate,
  }) {
    final _result = create();
    if (mainUser != null) {
      _result.mainUser = mainUser;
    }
    if (usersForUpdate != null) {
      _result.usersForUpdate.addAll(usersForUpdate);
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
  $core.int get mainUser => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainUser($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMainUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainUser() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<UserRequest> get usersForUpdate => $_getList(1);
}

class ChatsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatsRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxChatId', $pb.PbFieldType.O3, protoName: 'maxChatId')
    ..pc<ChatRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatsForUpdate', $pb.PbFieldType.PM, protoName: 'chatsForUpdate', subBuilder: ChatRequest.create)
    ..hasRequiredFields = false
  ;

  ChatsRequest._() : super();
  factory ChatsRequest({
    $core.int? maxChatId,
    $core.Iterable<ChatRequest>? chatsForUpdate,
  }) {
    final _result = create();
    if (maxChatId != null) {
      _result.maxChatId = maxChatId;
    }
    if (chatsForUpdate != null) {
      _result.chatsForUpdate.addAll(chatsForUpdate);
    }
    return _result;
  }
  factory ChatsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatsRequest clone() => ChatsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatsRequest copyWith(void Function(ChatsRequest) updates) => super.copyWith((message) => updates(message as ChatsRequest)) as ChatsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatsRequest create() => ChatsRequest._();
  ChatsRequest createEmptyInstance() => create();
  static $pb.PbList<ChatsRequest> createRepeated() => $pb.PbList<ChatsRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatsRequest>(create);
  static ChatsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxChatId => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxChatId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxChatId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ChatRequest> get chatsForUpdate => $_getList(1);
}

class MessagesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessagesRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxMessageId', $pb.PbFieldType.O3, protoName: 'maxMessageId')
    ..pc<MessageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageForUpdate', $pb.PbFieldType.PM, protoName: 'messageForUpdate', subBuilder: MessageRequest.create)
    ..hasRequiredFields = false
  ;

  MessagesRequest._() : super();
  factory MessagesRequest({
    $core.int? maxMessageId,
    $core.Iterable<MessageRequest>? messageForUpdate,
  }) {
    final _result = create();
    if (maxMessageId != null) {
      _result.maxMessageId = maxMessageId;
    }
    if (messageForUpdate != null) {
      _result.messageForUpdate.addAll(messageForUpdate);
    }
    return _result;
  }
  factory MessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessagesRequest clone() => MessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessagesRequest copyWith(void Function(MessagesRequest) updates) => super.copyWith((message) => updates(message as MessagesRequest)) as MessagesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessagesRequest create() => MessagesRequest._();
  MessagesRequest createEmptyInstance() => create();
  static $pb.PbList<MessagesRequest> createRepeated() => $pb.PbList<MessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static MessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessagesRequest>(create);
  static MessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxMessageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxMessageId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<MessageRequest> get messageForUpdate => $_getList(1);
}

class MainUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MainUserRequest', createEmptyInstance: create)
    ..aOM<UsersRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', subBuilder: UsersRequest.create)
    ..aOM<ChatsRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chats', subBuilder: ChatsRequest.create)
    ..aOM<MessagesRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messages', subBuilder: MessagesRequest.create)
    ..hasRequiredFields = false
  ;

  MainUserRequest._() : super();
  factory MainUserRequest({
    UsersRequest? users,
    ChatsRequest? chats,
    MessagesRequest? messages,
  }) {
    final _result = create();
    if (users != null) {
      _result.users = users;
    }
    if (chats != null) {
      _result.chats = chats;
    }
    if (messages != null) {
      _result.messages = messages;
    }
    return _result;
  }
  factory MainUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MainUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MainUserRequest clone() => MainUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MainUserRequest copyWith(void Function(MainUserRequest) updates) => super.copyWith((message) => updates(message as MainUserRequest)) as MainUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MainUserRequest create() => MainUserRequest._();
  MainUserRequest createEmptyInstance() => create();
  static $pb.PbList<MainUserRequest> createRepeated() => $pb.PbList<MainUserRequest>();
  @$core.pragma('dart2js:noInline')
  static MainUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MainUserRequest>(create);
  static MainUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  UsersRequest get users => $_getN(0);
  @$pb.TagNumber(1)
  set users(UsersRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsers() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsers() => clearField(1);
  @$pb.TagNumber(1)
  UsersRequest ensureUsers() => $_ensure(0);

  @$pb.TagNumber(2)
  ChatsRequest get chats => $_getN(1);
  @$pb.TagNumber(2)
  set chats(ChatsRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChats() => $_has(1);
  @$pb.TagNumber(2)
  void clearChats() => clearField(2);
  @$pb.TagNumber(2)
  ChatsRequest ensureChats() => $_ensure(1);

  @$pb.TagNumber(3)
  MessagesRequest get messages => $_getN(2);
  @$pb.TagNumber(3)
  set messages(MessagesRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessages() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessages() => clearField(3);
  @$pb.TagNumber(3)
  MessagesRequest ensureMessages() => $_ensure(2);
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

class UsersResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UsersResponse', createEmptyInstance: create)
    ..pc<SynhUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersNew', $pb.PbFieldType.PM, protoName: 'usersNew', subBuilder: SynhUser.create)
    ..pc<SynhUser>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersUpdated', $pb.PbFieldType.PM, protoName: 'usersUpdated', subBuilder: SynhUser.create)
    ..hasRequiredFields = false
  ;

  UsersResponse._() : super();
  factory UsersResponse({
    $core.Iterable<SynhUser>? usersNew,
    $core.Iterable<SynhUser>? usersUpdated,
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
  $core.List<SynhUser> get usersNew => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SynhUser> get usersUpdated => $_getList(1);
}

class ChatsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatsResponse', createEmptyInstance: create)
    ..pc<SynhChat>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatsNew', $pb.PbFieldType.PM, protoName: 'chatsNew', subBuilder: SynhChat.create)
    ..pc<SynhChat>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatsUpdated', $pb.PbFieldType.PM, protoName: 'chatsUpdated', subBuilder: SynhChat.create)
    ..hasRequiredFields = false
  ;

  ChatsResponse._() : super();
  factory ChatsResponse({
    $core.Iterable<SynhChat>? chatsNew,
    $core.Iterable<SynhChat>? chatsUpdated,
  }) {
    final _result = create();
    if (chatsNew != null) {
      _result.chatsNew.addAll(chatsNew);
    }
    if (chatsUpdated != null) {
      _result.chatsUpdated.addAll(chatsUpdated);
    }
    return _result;
  }
  factory ChatsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatsResponse clone() => ChatsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatsResponse copyWith(void Function(ChatsResponse) updates) => super.copyWith((message) => updates(message as ChatsResponse)) as ChatsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatsResponse create() => ChatsResponse._();
  ChatsResponse createEmptyInstance() => create();
  static $pb.PbList<ChatsResponse> createRepeated() => $pb.PbList<ChatsResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatsResponse>(create);
  static ChatsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SynhChat> get chatsNew => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SynhChat> get chatsUpdated => $_getList(1);
}

class MessagesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessagesResponse', createEmptyInstance: create)
    ..pc<SynhMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messagesNew', $pb.PbFieldType.PM, protoName: 'messagesNew', subBuilder: SynhMessage.create)
    ..pc<SynhMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messagesUpdated', $pb.PbFieldType.PM, protoName: 'messagesUpdated', subBuilder: SynhMessage.create)
    ..hasRequiredFields = false
  ;

  MessagesResponse._() : super();
  factory MessagesResponse({
    $core.Iterable<SynhMessage>? messagesNew,
    $core.Iterable<SynhMessage>? messagesUpdated,
  }) {
    final _result = create();
    if (messagesNew != null) {
      _result.messagesNew.addAll(messagesNew);
    }
    if (messagesUpdated != null) {
      _result.messagesUpdated.addAll(messagesUpdated);
    }
    return _result;
  }
  factory MessagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessagesResponse clone() => MessagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessagesResponse copyWith(void Function(MessagesResponse) updates) => super.copyWith((message) => updates(message as MessagesResponse)) as MessagesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessagesResponse create() => MessagesResponse._();
  MessagesResponse createEmptyInstance() => create();
  static $pb.PbList<MessagesResponse> createRepeated() => $pb.PbList<MessagesResponse>();
  @$core.pragma('dart2js:noInline')
  static MessagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessagesResponse>(create);
  static MessagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SynhMessage> get messagesNew => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SynhMessage> get messagesUpdated => $_getList(1);
}

class DataDBResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataDBResponse', createEmptyInstance: create)
    ..aOM<UsersResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', subBuilder: UsersResponse.create)
    ..aOM<ChatsResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chats', subBuilder: ChatsResponse.create)
    ..aOM<MessagesResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messages', subBuilder: MessagesResponse.create)
    ..hasRequiredFields = false
  ;

  DataDBResponse._() : super();
  factory DataDBResponse({
    UsersResponse? users,
    ChatsResponse? chats,
    MessagesResponse? messages,
  }) {
    final _result = create();
    if (users != null) {
      _result.users = users;
    }
    if (chats != null) {
      _result.chats = chats;
    }
    if (messages != null) {
      _result.messages = messages;
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
  UsersResponse get users => $_getN(0);
  @$pb.TagNumber(1)
  set users(UsersResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsers() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsers() => clearField(1);
  @$pb.TagNumber(1)
  UsersResponse ensureUsers() => $_ensure(0);

  @$pb.TagNumber(2)
  ChatsResponse get chats => $_getN(1);
  @$pb.TagNumber(2)
  set chats(ChatsResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChats() => $_has(1);
  @$pb.TagNumber(2)
  void clearChats() => clearField(2);
  @$pb.TagNumber(2)
  ChatsResponse ensureChats() => $_ensure(1);

  @$pb.TagNumber(3)
  MessagesResponse get messages => $_getN(2);
  @$pb.TagNumber(3)
  set messages(MessagesResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessages() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessages() => clearField(3);
  @$pb.TagNumber(3)
  MessagesResponse ensureMessages() => $_ensure(2);
}


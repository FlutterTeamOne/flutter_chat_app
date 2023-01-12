///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name, depend_on_referenced_packages

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ContentType extends $pb.ProtobufEnum {
  static const ContentType isText = ContentType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isText');
  static const ContentType isMedia = ContentType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isMedia');
  static const ContentType isMediaText = ContentType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isMediaText');

  static const $core.List<ContentType> values = <ContentType>[
    isText,
    isMedia,
    isMediaText,
  ];

  static final $core.Map<$core.int, ContentType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ContentType? valueOf($core.int value) => _byValue[value];

  const ContentType._($core.int v, $core.String n) : super(v, n);
}

class MessageStateEnum extends $pb.ProtobufEnum {
  static const MessageStateEnum connecting = MessageStateEnum._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'connecting');
  static const MessageStateEnum isReadMessage = MessageStateEnum._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isReadMessage');
  static const MessageStateEnum isCreateMessage = MessageStateEnum._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isCreateMessage');
  static const MessageStateEnum isUpdateMessage = MessageStateEnum._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isUpdateMessage');
  static const MessageStateEnum isDeleteMesage = MessageStateEnum._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'isDeleteMesage');

  static const $core.List<MessageStateEnum> values = <MessageStateEnum>[
    connecting,
    isReadMessage,
    isCreateMessage,
    isUpdateMessage,
    isDeleteMesage,
  ];

  static final $core.Map<$core.int, MessageStateEnum> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static MessageStateEnum? valueOf($core.int value) => _byValue[value];

  const MessageStateEnum._($core.int v, $core.String n) : super(v, n);
}

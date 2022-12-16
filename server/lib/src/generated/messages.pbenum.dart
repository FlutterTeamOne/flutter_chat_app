///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class MessageStateEnum extends $pb.ProtobufEnum {
  static const MessageStateEnum connecting = MessageStateEnum._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'connecting');
  static const MessageStateEnum isReadMessage = MessageStateEnum._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isReadMessage');
  static const MessageStateEnum isCreateMessage = MessageStateEnum._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isCreateMessage');
  static const MessageStateEnum isUpdateMessage = MessageStateEnum._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isUpdateMessage');
  static const MessageStateEnum isDelteMesage = MessageStateEnum._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isDelteMesage');

  static const $core.List<MessageStateEnum> values = <MessageStateEnum> [
    connecting,
    isReadMessage,
    isCreateMessage,
    isUpdateMessage,
    isDelteMesage,
  ];

  static final $core.Map<$core.int, MessageStateEnum> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageStateEnum? valueOf($core.int value) => _byValue[value];

  const MessageStateEnum._($core.int v, $core.String n) : super(v, n);
}


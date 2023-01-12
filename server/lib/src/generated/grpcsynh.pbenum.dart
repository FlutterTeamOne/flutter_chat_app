///
//  Generated code. Do not modify.
//  source: grpcsynh.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ContentTypeSynch extends $pb.ProtobufEnum {
  static const ContentTypeSynch isText = ContentTypeSynch._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isText');
  static const ContentTypeSynch isMedia = ContentTypeSynch._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isMedia');
  static const ContentTypeSynch isMediaText = ContentTypeSynch._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'isMediaText');

  static const $core.List<ContentTypeSynch> values = <ContentTypeSynch> [
    isText,
    isMedia,
    isMediaText,
  ];

  static final $core.Map<$core.int, ContentTypeSynch> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContentTypeSynch? valueOf($core.int value) => _byValue[value];

  const ContentTypeSynch._($core.int v, $core.String n) : super(v, n);
}


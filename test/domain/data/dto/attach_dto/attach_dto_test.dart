import 'package:chat_app/domain/data/dto/attach_dto/attach_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AttachModel attachModel = AttachModel(id: 1, meta: 'meta');

  group("AttachDto tests", () {
    test('CopyWith response', () {
      var actual = attachModel.copyWith();
      expect(actual, attachModel);

      actual = attachModel.copyWith(id: 2);
      expect(actual, AttachModel(id: 2, meta: 'meta'));
    });

    test('Test operator == ', () {
      AttachModel attachModel1 = AttachModel(id: 1, meta: 'meta');

      AttachModel attachModel2 = AttachModel(id: 2, meta: 'meta');
      AttachModel attachModel3 = AttachModel(id: 1, meta: 'meta');
      var actual = attachModel1 == attachModel3;
      expect(actual, true);
      actual = attachModel1 == attachModel2;
      expect(actual, false);
    });

    test('Test for getter hashCode', () {
      var actual = attachModel.hashCode;

      expect(actual, attachModel.id.hashCode ^ attachModel.meta.hashCode);
    });

    test('ToString', () {
      var actual = attachModel.toString();

      expect(actual, 'AttachModel(attachment_id: 1, attachment_meta: meta)');
    });

    test('ToMap', () {
      var actual = attachModel.toMap();

      expect(actual, {
        'attachment_id': 1,
        'attachment_meta': 'meta',
      });
    });

    test('FromMap', () async {
      var map = attachModel.toMap();
      var actual = AttachModel.fromMap(map);

      expect(actual, attachModel);
    });

    test('toJson', () {
      var actual = attachModel.toJson();

      expect(actual, '{"attachment_id":1,"attachment_meta":"meta"}');
    });

    test('fromJson', () {
      var toJson = attachModel.toJson();
      var actual = AttachModel.fromJson(toJson);

      expect(actual, attachModel);
    });
  });
}

import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/src/constants/user_constants.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/textfield_dialog.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ShowTextFieldDialog {
  static Future<dynamic> showTextFieldDialog(
      {required BuildContext context,
      required UserNotifier userPod,
      required EnumUserInfo enumUserInfo,
      required UserDto userMain,
      required String insertText}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController newController = TextEditingController();
          switch (enumUserInfo.index) {
            case 0:
              newController.text = userMain.name;
              break;
            case 1:
              newController.text = userMain.email;
              break;
            default:
              newController.text = '';
          }
          final text = 'Insert new $insertText';
          return TextFormDialog(
            controller: newController,
            text: text,
            onPressed: () async {
              String updatedDate = DateTime.now().toIso8601String();
              late String newValue = newController.text;
              //TODO: Проверка на те же данные которые введены
              if (newController.text.isNotEmpty) {
                if (enumUserInfo == EnumUserInfo.avatar &&
                    !(await _validateImage(newValue))) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) => const ErrorDialog(
                            textTitle: 'Ошибка',
                            textContent: 'Кривая ссылка',
                          ));
                } else if (!((enumUserInfo == EnumUserInfo.email) ==
                    EmailValidator.validate(newController.text))) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) => const ErrorDialog(
                            textTitle: 'Ошибка',
                            textContent: 'Невалидный email',
                          ));
                } else {
                  final updatedUser = UserDto(
                      userId: userMain.userId,
                      name: enumUserInfo != EnumUserInfo.name
                          ? userMain.name
                          : newValue,
                      email: enumUserInfo != EnumUserInfo.email
                          ? userMain.email
                          : newValue,
                      createdDate: userMain.createdDate,
                      profilePicLink: enumUserInfo != EnumUserInfo.avatar
                          ? userMain.profilePicLink
                          : newValue,
                      updatedDate: updatedDate);
                  userPod.updateMainUser(updatedUser);

                  //TODO: Убрать Принт
                  print("NEW ${enumUserInfo}: $newValue");
                  Navigator.pop(context);
                }
              } else {
                showDialog(
                    context: context,
                    builder: (context) => const ErrorDialog(
                          textTitle: 'Ошибка',
                          textContent: 'Введите данные',
                        ));
              }
            },
          );
        }).onError((error, stackTrace) => null);
  }

  static Future<bool> _validateImage(String imageUrl) async {
    var res;
    try {
      res = await Dio().get(imageUrl);
    } catch (e) {
      return false;
    }

    if (res.statusCode != 200) return false;
    var data = res.headers;
    //TODO: Убрать принты
    print("IMAGE $data");
    print(data['content-type'][0]);
    return _checkIfImage(data['content-type'][0]);
  }

  static bool _checkIfImage(String param) {
    if (param == 'image/jpeg' ||
        param == 'image/png' ||
        param == 'image/gif' ||
        param == 'image/webp') {
      return true;
    }
    return false;
  }
}

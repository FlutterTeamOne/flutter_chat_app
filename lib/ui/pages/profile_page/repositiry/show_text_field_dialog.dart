import 'package:chat_app/modules/client/custom_exception.dart';
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
              String textContentError = '';
              //TODO: Проверка на те же данные которые введены
              if (newController.text.isNotEmpty) {
                if (enumUserInfo == EnumUserInfo.avatar) {
                  if (!(await _validateImage(newValue))) {
                    textContentError = 'Link broken';
                  } else if (newController.text == userMain.profilePicLink) {
                    textContentError = 'Enter new picture URL';
                  }
                } else if (enumUserInfo == EnumUserInfo.email) {
                  if (!EmailValidator.validate(newController.text)) {
                    textContentError = 'Invalid email';
                  } else if (newController.text == userMain.email) {
                    textContentError = 'Enter new email';
                  }
                } else if (enumUserInfo == EnumUserInfo.name &&
                    newController.text == userMain.name) {
                  textContentError = 'Enter new name';
                }
              } else {
                textContentError = 'Enter data';
              }
              if (textContentError != '') {
                await showDialog(
                    context: context,
                    builder: (context) => ErrorDialog(
                        textTitle: 'Error', textContent: textContentError));
              } else {
                try {
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
                  await userPod.updateMainUser(updatedUser);
                } on CustomException catch (e) {
                  await showDialog(
                      context: context,
                      builder: (context) =>
                          ErrorDialog(textTitle: 'Error', textContent: '$e'));
                }
                //TODO: Убрать Принт
                print("NEW ${enumUserInfo}: $newValue");
                Navigator.pop(context);
              }
            },
          );
        });
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

import 'package:chat_app/src/constants/user_constants.dart';
import 'package:chat_app/ui/pages/change_password_page/change_password_page.dart';
import 'package:chat_app/ui/pages/profile_page/repositiry/show_text_field_dialog.dart';
import 'package:flutter/material.dart';

class FieldWithChange extends StatelessWidget {
  const FieldWithChange({Key? key, required this.info}) : super(key: key);

  final Map<String, dynamic> info;

  @override
  Widget build(BuildContext context) {
    //В контент положить то поле которое нужно отображать
    String content = info['enumUserInfo'] == EnumUserInfo.name
        ? info['userMain'].name
        : info['userMain'].email;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info['nameField'] as String,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 2),
        info['enumUserInfo'] == EnumUserInfo.password
            ? ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ))),
                onPressed: () {
                  Navigator.of(context).pushNamed(ChangePasswordPage.routeName);
                },
                child: Text("Смена пароля"))
            : Row(
                children: [
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  IconButton(
                    onPressed: () async {
                      await ShowTextFieldDialog.showTextFieldDialog(
                          context: context,
                          userPod: info['userPod'],
                          enumUserInfo: info['enumUserInfo'],
                          userMain: info['userMain'],
                          insertText: info['insertText']);
                    },
                    icon: const Icon(Icons.create_outlined),
                    iconSize: 15,
                  )
                ],
              ),
      ],
    );
  }
}

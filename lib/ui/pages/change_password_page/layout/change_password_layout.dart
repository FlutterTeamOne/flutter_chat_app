import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/ui/pages/change_password_page/repository/field_form_class.dart';
import 'package:chat_app/ui/pages/main_layout.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:chat_app/ui/widgets/custom_widgets/TextFormFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordLayout extends ConsumerStatefulWidget {
  ChangePasswordLayout({
    super.key,
  });

  @override
  ConsumerState<ChangePasswordLayout> createState() =>
      _ChangePasswordLayoutState();
}

class _ChangePasswordLayoutState extends ConsumerState<ChangePasswordLayout> {
  GlobalKey<FormState> _changePasswordKey = GlobalKey<FormState>();
  late TextEditingController oldPasswordController;

  late TextEditingController newPasswordController;

  late TextEditingController newRepPasswordController;

  late RegExp? regExpPass;

  @override
  void initState() {
    super.initState();
    //Инициализируем
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    newRepPasswordController = TextEditingController();

    ///
    ///r'^
    ///(?=.*[A-Z])       // should contain at least one upper case
    ///(?=.*[a-z])       // should contain at least one lower case
    ///(?=.*?[0-9])      // should contain at least one digit
    ///(?=.*?[!@#\$&*~]) // should contain at least one Special character
    ///
    //RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$');
  }

  @override
  Widget build(BuildContext context) {
    List<FieldFormClass> fieldsForm = [
      FieldFormClass(
          lableText: "Old Password",
          controller: oldPasswordController,
          validator: (password) {
            String? result;
            result = FieldFormClass.validatorPassword(password);
            return result;
          },
          inputFormatters:
              RegExp(r'^[A-Za-z0-9!@#\$&*~а-яА-Я]+', unicode: true),
          maxLength: 20,
          obscureText: true),
      FieldFormClass(
          lableText: "New Password",
          controller: newPasswordController,
          validator: (password) {
            String? result;
            result = FieldFormClass.validatorPassword(password);
            if (result != null) {
              return result;
            }
            result = FieldFormClass.validatorOldNewPassword(
                password!, oldPasswordController.text);
            return result;
          },
          inputFormatters:
              RegExp(r'^[A-Za-z0-9!@#\$&*~а-яА-Я]+', unicode: true),
          maxLength: 20,
          obscureText: true),
      FieldFormClass(
          lableText: "Confirm password",
          controller: newRepPasswordController,
          validator: (password) {
            String? result;
            result = FieldFormClass.validatorPassword(password);
            result = FieldFormClass.validatorNewPasswords(
                password!, newPasswordController.text);
            return result;
          },
          inputFormatters:
              RegExp(r'^[A-Za-z0-9!@#\$&*~а-яА-Я]+', unicode: true),
          maxLength: 20,
          obscureText: true)
    ];
    return Form(
      key: _changePasswordKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ListView.separated(
                  itemCount: fieldsForm.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) => TextFormFieldWidget(
                        lableText: fieldsForm[index].lableText,
                        validator: fieldsForm[index].validator,
                        controller: fieldsForm[index].controller,
                        inputFormatters: fieldsForm[index].inputFormatters,
                        maxLength: fieldsForm[index].maxLength,
                        obscureText: fieldsForm[index].obscureText,
                      )),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  if (!_changePasswordKey.currentState!.validate()) {
                    print("HEllo");
                    return;
                  }
                  bool result = false;
                  try {
                    result = await ref
                        .read(River.userPod.notifier)
                        .changePassword(
                            userId: UserPref.getUserId,
                            oldPassword: oldPasswordController.text,
                            newPassword: newPasswordController.text);
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            ErrorDialog(textTitle: "Error", textContent: '$e'));
                  }

                  _changePasswordKey.currentState!.save();
                  if (result == true) {
                    showDialog(
                        context: context,
                        builder: (context) => ErrorDialog(
                              textTitle: "Success",
                              textContent: 'Пароль успешно изменен',
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(MainLayout.routeName),
                            ));
                  }
                },
                child: const Text("Отправить"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    //Диспоузим
    oldPasswordController.dispose();
    newPasswordController.dispose();
    newRepPasswordController.dispose();
    super.dispose();
  }
}

import 'package:chat_app/ui/pages/change_password_page/repository/field_form_class.dart';
import 'package:chat_app/ui/widgets/custom_widgets/TextFormFieldWidget.dart';
import 'package:flutter/material.dart';

class ChangePasswordLayout extends StatefulWidget {
  ChangePasswordLayout({
    super.key,
  });

  @override
  State<ChangePasswordLayout> createState() => _ChangePasswordLayoutState();
}

class _ChangePasswordLayoutState extends State<ChangePasswordLayout> {
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
                onPressed: () {
                  if (!_changePasswordKey.currentState!.validate()) {
                    print("HEllo");
                    return;
                  }
                  _changePasswordKey.currentState!.save();
                  //TODO: Отправка на сервер запроса на смену пароля
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

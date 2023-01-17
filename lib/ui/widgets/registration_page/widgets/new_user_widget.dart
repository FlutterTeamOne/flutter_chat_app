import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:chat_app/ui/widgets/custom_widgets/field_form_class.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';

import '../models/new_user_model.dart';
import 'package:flutter/material.dart';

part 'form_widget.dart';

class NewUserWidget extends ConsumerStatefulWidget {
  const NewUserWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewUserWidgetState();
  }
}

class _NewUserWidgetState extends ConsumerState<NewUserWidget> {
  static const String newUserPictureUrl =
      """https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg""";
  static String newUserCreateDate = DateTime.now().toIso8601String();
  //Контроллеры
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController pictureUrlController;
  late TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    pictureUrlController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
    //Инициализируем
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    pictureUrlController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    //Диспоузим
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    pictureUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // если _isActive будет равен true то пароль скрыт
    final isActivePassword = ValueNotifier<bool>(true);
    final isActiveConfirm = ValueNotifier<bool>(true);
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create new user',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                // Форма для имени
                FormWidget(
                  key: const Key('createName'),
                  text: 'Name',
                  maxLength: 20,
                  //используем RegExp для сортировки по символам
                  inputFormatters: FieldFormClass.regExpName,
                  controller: nameController,
                  validator: (name) => FieldFormClass.validatorName(name),
                ),
                const SizedBox(height: 10),
                // Форма для мыло
                FormWidget(
                  key: const Key('createEmail'),
                  text: 'Email',
                  inputFormatters: FieldFormClass.regExpEmail,
                  maxLength: 36,
                  controller: emailController,
                  validator: (email) => FieldFormClass.validatorEmail(email),
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: isActivePassword,
                  builder: (context, value, child) => FormWidget(
                    key: const Key('createPassword'),
                    text: 'Password',
                    inputFormatters: FieldFormClass.regExpPassword,
                    controller: passwordController,
                    obscureText: isActivePassword.value,
                    suffix: isActivePassword.value == true
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    validator: (password) =>
                        FieldFormClass.validatorPassword(password),
                    suffixOnTap: () {
                      if (isActivePassword.value == true) {
                        isActivePassword.value = false;
                      } else {
                        isActivePassword.value = true;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                    valueListenable: isActiveConfirm,
                    builder: (context, value, child) {
                      // Форма для подтверждения пароля
                      return FormWidget(
                        key: const Key('createConfirmPassword'),
                        text: 'Сonfirm password',
                        inputFormatters: FieldFormClass.regExpPassword,
                        controller: confirmPasswordController,
                        obscureText: isActiveConfirm.value,
                        suffix: isActiveConfirm.value == true
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        validator: (confirm) =>
                            FieldFormClass.validatorNewPasswords(
                                confirm!, passwordController.text),
                        suffixOnTap: () {
                          if (isActiveConfirm.value == true) {
                            isActiveConfirm.value = false;
                          } else {
                            isActiveConfirm.value = true;
                          }
                        },
                      );
                    }),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCreateNewUserButton(
                      context,
                      nameController,
                      emailController,
                      passwordController,
                      _formKey,
                    ),
                    CloseButton(
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AuthPage.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCreateNewUserButton(BuildContext context, newUserNameText,
      newUserEmailText, newUserPasswordText, formKey) {
    return ElevatedButton(
        child: const Text('Create'),
        onPressed: () async {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            NewUserModel newUserModel = NewUserModel(
                name: newUserNameText.text,
                email: newUserEmailText.text,
                password: newUserPasswordText.text,
                registrationDate: newUserCreateDate,
                profilePicLink: newUserPictureUrl);
            UserDto? newUser;
            try {
              await ref
                  .read(River.synchUserPod.notifier)
                  .createUser(user: newUserModel);
              newUser = ref.read(River.synchUserPod).newUser;
              if (newUser == null) {
                throw CustomException("Registration Failed");
              }
            } on CustomException catch (e) {
              await showDialog(
                  context: context,
                  builder: (context) => ErrorDialog(
                      textTitle: 'Network Error',
                      textContent: e.message.toString()));
            } catch (e) {
              await showDialog(
                  context: context,
                  builder: (context) => ErrorDialog(
                      textTitle: 'Attention', textContent: e.toString()));
            }
            if (newUser != null) {
              await showDialog(
                  context: context,
                  builder: (context) => ErrorDialog(
                        textTitle: 'Success',
                        textContent: "User ${newUser!.name} Registered",
                        onPressed: () =>
                            Navigator.of(context).pushNamed(AuthPage.routeName),
                      ));
            }
          } else {
            return;
          }
        });
  }
}

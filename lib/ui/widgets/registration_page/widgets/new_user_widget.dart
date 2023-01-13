import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      """https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=2000""";
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
                  text: 'Name',
                  maxLength: 20,
                  //используем RegExp для сортировки по символам
                  inputFormatters: RegExp(r'^[A-Za-z0-9]+'),
                  controller: nameController,
                  validator: (name) {
                    if (name!.length < 3) {
                      //если длинна имени меньше 3 символов выводиим ошибку
                      return 'Name must contain at least 3 characters';
                    }
                    {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                // Форма для мыло
                FormWidget(
                  text: 'Email',
                  inputFormatters: RegExp(r"^[a-z0-9.a-z@]+"),
                  maxLength: 36,
                  controller: emailController,
                  validator: (email) {
                    if (email != null && !EmailValidator.validate(email)) {
                      // Валидация сделана при помощи пакета email_validator
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: isActivePassword,
                  builder: (context, value, child) => FormWidget(
                    text: 'Password',
                    inputFormatters: RegExp(r"^[a-z0-9_A-Z]+"),
                    controller: passwordController,
                    obscureText: isActivePassword.value,
                    suffix: isActivePassword.value == true
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    validator: (password) {
                      if (password!.length < 6) {
                        //если длинна пароля меньше 6 символов выводиим ошибку
                        return 'Password must contain at least 6 characters';
                      } else if (!password.contains(RegExp(r'[A-Z]'))) {
                        //если пароль не содержит хотя бы одну заглавную буквку выводим ошибку
                        return 'Password must contain at least one capital\nletter';
                      } else {
                        return null;
                      }
                    },
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
                        text: 'Сonfirm password',
                        inputFormatters: RegExp(r"^[a-z0-9_A-Z]+"),
                        controller: confirmPasswordController,
                        obscureText: isActiveConfirm.value,
                        suffix: isActiveConfirm.value == true
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        validator: (confirm) {
                          if (passwordController.text !=
                                  confirmPasswordController.text ||
                              passwordController.text.isEmpty) {
                            //если значение confirmPasswordController пустое или
                            //не совпадает с passwordController выводим ошибку
                            return 'Passwords do not match. Try again.';
                          } else {
                            return null;
                          }
                        },
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
                        Navigator.of(context).pushNamed('/');
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

  Padding buildCreateNewUserButton(BuildContext context, newUserNameText,
      newUserEmailText, newUserPasswordText, formKey) {
    late String newUserName;
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: Row(
        children: [
          ElevatedButton(
              // style: ButtonStyle(
              //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20.0),
              // ))),
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  // if (_nameKey.currentState!.validate() &&
                  //     _emailKey.currentState!.validate() &&
                  //     _passwordKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Creating new user')),
                  //   );
                  // }
                  late NewUserModel newUser = NewUserModel(
                      name: newUserNameText.text,
                      email: newUserEmailText.text,
                      password: newUserPasswordText.text,
                      registrationDate: newUserCreateDate,
                      profilePicLink: newUserPictureUrl);
                  ref.read(River.newUserPod.notifier).newUser(newUser: newUser);
                  ref.read(River.userPod.notifier).readUser();
                  Navigator.of(context).pushNamed(AuthPage.routeName);
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       newUserName =
                  //           context.watch<NewUserBloc>().state.newUser.name;
                  //       return Dialog(
                  //         // shape: RoundedRectangleBorder(
                  //         //   borderRadius: BorderRadius.circular(20.0),
                  //         // ),
                  //         child: SizedBox(
                  //           height: 80,
                  //           width: 50,
                  //           child: Column(
                  //             children: [
                  //               Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: context
                  //                               .read<NewUserBloc>()
                  //                               .state
                  //                               .newUser
                  //                               .name ==
                  //                           newUserNameText.text
                  //                       ? Text('User $newUserName created')
                  //                       : const Text('Error')),
                  //               Consumer(
                  //                 builder: (context, ref, _) {
                  //                   return ElevatedButton(
                  //                       // style: ButtonStyle(
                  //                       //     shape: MaterialStateProperty.all<
                  //                       //             RoundedRectangleBorder>(
                  //                       //         RoundedRectangleBorder(
                  //                       //   borderRadius:
                  //                       //       BorderRadius.circular(20.0),
                  //                       // ))),
                  //                       onPressed: () {
                  //                         ref
                  //                             .read(River.userPod.notifier)
                  //                             .readUser();

                  //                         Navigator.of(context)
                  //                             .pushNamed(AuthPage.routeName);
                  //                       },
                  //                       child: const Icon(Icons.check));
                  //                 },
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     });
                  // print(
                  //     '${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , ');
                }
              },
              child: const Text('Create new user')),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.close_rounded)),
        ],
      ),
    );
  }
}

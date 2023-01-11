import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../bloc/new_user_bloc.dart';
import '../bloc/new_user_event.dart';
import '../models/new_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/new_user_state.dart';
part 'form_widget.dart';

class NewUserWidget extends StatefulWidget {
  const NewUserWidget({Key? key}) : super(key: key);

  @override
  State<NewUserWidget> createState() => _NewUserWidgetState();
}

class _NewUserWidgetState extends State<NewUserWidget> {
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
    final _isActive = ValueNotifier<bool>(true);
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
                FormWidget(
                  text: 'Name',
                  maxLength: 20,
                  //используем RegExp для сортировки по символам
                  inputFormatters: RegExp(r'^[A-Za-z]+'),
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
                  valueListenable: _isActive,
                  builder: (context, value, child) => Column(
                    children: [
                      FormWidget(
                          text: 'Password',
                          inputFormatters: RegExp(r"^[a-z0-9_A-Z]+"),
                          controller: passwordController,
                          obscureText: _isActive.value,
                          suffix: _isActive.value == true
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
                            if (_isActive.value == true) {
                              _isActive.value = false;
                            } else {
                              _isActive.value = true;
                            }
                          }),
                      const SizedBox(height: 10),
                      FormWidget(
                        text: 'Сonfirm password',
                        inputFormatters: RegExp(r"^[a-z0-9_A-Z]+"),
                        controller: confirmPasswordController,
                        obscureText: _isActive.value,
                        validator: (confirm) {
                          if (passwordController.text !=
                                  confirmPasswordController.text ||
                              passwordController.text.isEmpty) {
                            //если значение confirmPasswordController пустое или не совпадает с passwordController выводим ошибку
                            return 'Passwords do not match. Try again.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCreateNewUserButton(context, nameController,
                        emailController, passwordController, _formKey),
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

  buildCreateNewUserButton(BuildContext context, newUserNameText,
      newUserEmailText, newUserPasswordText, formKey) {
    late String newUserName;
    return BlocConsumer<NewUserBloc, NewUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ElevatedButton(
            child: const Text('Create'),
            // style: ButtonStyle(
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            // ))),
            onPressed: () {
              final isValid = formKey.currentState!.validate();
              if (isValid) {
                late NewUserModel newUser = NewUserModel(
                    name: newUserNameText.text,
                    email: newUserEmailText.text,
                    password: newUserPasswordText.text,
                    registrationDate: newUserCreateDate,
                    profilePicLink: newUserPictureUrl);
                context.read<NewUserBloc>().add(SetNewUserEvent(user: newUser));
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      newUserName =
                          context.watch<NewUserBloc>().state.newUser.name;
                      return Dialog(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(20.0),
                        // ),
                        child: SizedBox(
                          height: 80,
                          width: 50,
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: context
                                              .read<NewUserBloc>()
                                              .state
                                              .newUser
                                              .name ==
                                          newUserNameText.text
                                      ? Text('User $newUserName created')
                                      : const Text('Error')),
                              Consumer(
                                builder: (context, ref, _) {
                                  return ElevatedButton(
                                      // style: ButtonStyle(
                                      //     shape: MaterialStateProperty.all<
                                      //             RoundedRectangleBorder>(
                                      //         RoundedRectangleBorder(
                                      //   borderRadius:
                                      //       BorderRadius.circular(20.0),
                                      // ))),
                                      onPressed: () {
                                        ref
                                            .read(River.userPod.notifier)
                                            .readUser();

                                        Navigator.of(context)
                                            .pushNamed(AuthPage.routeName);
                                      },
                                      child: const Icon(Icons.check));
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
                // print(
                //     '${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , ');}
              }
            });
      },
    );
  }
}

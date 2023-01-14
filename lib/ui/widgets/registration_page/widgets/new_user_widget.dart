import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:chat_app/ui/widgets/custom_widgets/field_form_class.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:grpc/grpc.dart';

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


  // @override
  // Widget build(BuildContext context) {
  //   // если _isActive будет равен true то пароль скрыт
  //   final isActivePassword = ValueNotifier<bool>(true);
  //   final isActiveConfirm = ValueNotifier<bool>(true);
  //   return Row(
  //     key: const Key('newUserWidgetRow'),
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Column(
  //         key: const Key('newUserWidgetColumn'),
  //         children: [
  //           const SizedBox(
  //             height: 200,
  //           ),
  //           Row(
  //             children: [
  //               Form(
  //                 key: _formKey,
  //                 child: Column(
  //                   key: const Key('newUserWidgetBodyColumn'),
  //                   children: [
  //                     buildNameRow(),
  //                     buildEmailRow(),
  //                     buildPasswordRow(),
  //                     const SizedBox(
  //                       height: 20,
  //                     ),
  //                     buildCreateNewUserButton(context, newUserNameText,
  //                         newUserEmailText, newUserPasswordText),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // SizedBox buildPasswordRow() {
  //   return SizedBox(
  //     key: const Key('password'),
  //     width: 300,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.only(right: textPadding),
  //           child: Text('Password'),
  //         ),
  //         SizedBox(
  //           width: textFieldWidth,
  //           child: TextFormField(
  //             key: _passwordKey,
  //             controller: newUserPasswordText,
  //             validator: (value) {
  //               if (value == null || value.isEmpty) {
  //                 return 'Enter password';
  //               } else if (value.length < 6) {
  //                 return 'Password length less then 6';
  //               }
  //               return null;
  //             },
  //             obscureText: true,
  //             onSaved: (value) {},
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // SizedBox buildEmailRow() {
  //   return SizedBox(
  //     key: const Key('email'),
  //     width: 300,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.only(right: textPadding),
  //           child: Text('Email'),
  //         ),
  //         SizedBox(
  //             width: textFieldWidth,
  //             child: TextFormField(
  //               key: _emailKey,
  //               controller: newUserEmailText,
  //               validator: (value) {
  //                 if (value == null ||
  //                     value.isEmpty ||
  //                     !EmailValidator.validate(value)) {
  //                   return 'Enter email';
  //                 }

  //                 return null;
  //               },
  //             )),
  //       ],
  //     ),
  //   );
  // }

  // SizedBox buildNameRow() {
  //   return SizedBox(
  //     key: const Key('name'),
  //     width: 300,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.only(right: textPadding),
  //           child: Text('Name'),
  //         ),
  //         SizedBox(
  //             width: textFieldWidth,
  //             child: TextFormField(
  //               key: _nameKey,
  //               controller: newUserNameText,
  //               validator: (value) {
  //                 if (value == null || value.isEmpty) {
  //                   return 'Enter name';
  //                 } else if (value.length < 3) {
  //                   return 'Name length less then 3';
  //                 }
  //                 return null;
  //               },
  //             )),
  //       ],
  //     ),
  //   );
  // }

  // Padding buildCreateNewUserButton(BuildContext context, newUserNameText,
  //     newUserEmailText, newUserPasswordText) {
  //   late String newUserName;
  //   return Padding(
  //     key: const Key('createUserWidget'),
  //     padding: const EdgeInsets.only(left: 100.0),
  //     child: Row(
  //       children: [
  //         BlocConsumer<NewUserBloc, NewUserState>(
  //           listener: (context, state) {},
  //           builder: (context, state) {
  //             return ElevatedButton(
  //                 key: const Key('createUserButton'),
  //                 // style: ButtonStyle(
  //                 //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                 //         RoundedRectangleBorder(
  //                 //   borderRadius: BorderRadius.circular(20.0),
  //                 // ))),
  //                 onPressed: () {
  //                   // if (_nameKey.currentState!.validate() &&
  //                   //     _emailKey.currentState!.validate() &&
  //                   //     _passwordKey.currentState!.validate()) {
  //                   //   ScaffoldMessenger.of(context).showSnackBar(
  //                   //     const SnackBar(content: Text('Creating new user')),
  //                   //   );
  //                   // }
  //                   late NewUserModel newUser = NewUserModel(
  //                       name: newUserNameText.text,
  //                       email: newUserEmailText.text,
  //                       password: newUserPasswordText.text,
  //                       registrationDate: newUserCreateDate,
  //                       profilePicLink: newUserPictureUrl);
  //                   context
  //                       .read<NewUserBloc>()
  //                       .add(SetNewUserEvent(user: newUser));
  //                   showDialog(
  //                       context: context,
  //                       builder: (BuildContext context) {
  //                         newUserName =
  //                             context.watch<NewUserBloc>().state.newUser.name;
  //                         return Dialog(
  //                           key: const Key('createUserDialog'),
  //                           // shape: RoundedRectangleBorder(
  //                           //   borderRadius: BorderRadius.circular(20.0),
  //                           // ),
  //                           child: SizedBox(
  //                             height: 80,
  //                             width: 50,
  //                             child: Column(
  //                               children: [
  //                                 Padding(
  //                                     padding: const EdgeInsets.all(8.0),
  //                                     child: context
  //                                                 .read<NewUserBloc>()
  //                                                 .state
  //                                                 .newUser
  //                                                 .name ==
  //                                             newUserNameText.text
  //                                         ? Text('User $newUserName created')
  //                                         : const Text('Error')),
  //                                 ElevatedButton(
  //                                     key: const Key('createUserDialogButton'),
  //                                     // style: ButtonStyle(
  //                                     //     shape: MaterialStateProperty.all<
  //                                     //             RoundedRectangleBorder>(
  //                                     //         RoundedRectangleBorder(
  //                                     //   borderRadius:
  //                                     //       BorderRadius.circular(20.0),
  //                                     // ))),
  //                                     onPressed: () => Navigator.of(context)
  //                                         .pushNamed(AuthPage.routeName),
  //                                     child: const Icon(Icons.check))
  //                               ],
  //                             ),
  //                           ),
  //                         );
  //                       });
  //                   // print(
  //                   //     '${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , ');
  //                 },
  //                 child: const Text('Create new user'));
  //           },
  //         ),
  //         IconButton(
  //             key: const Key('cancelUserCreateButton'),
  //             onPressed: () {
  //               Navigator.of(context).pushNamed(AuthPage.routeName);
  //             },
  //             icon: const Icon(Icons.close_rounded)),
  //       ],
  //     ),
  //   );
  // }


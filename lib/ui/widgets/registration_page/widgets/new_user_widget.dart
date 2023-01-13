import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/new_user_model.dart';
import 'package:flutter/material.dart';

part 'form_widget.dart';

class NewUserWidget extends ConsumerStatefulWidget {
  const NewUserWidget({Key? key}) : super(key: const Key('newUserWidget'));

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewUserWidgetState();
  }
}

class _NewUserWidgetState extends ConsumerState<NewUserWidget> {
  static const double textFieldWidth = 200;
  static const double textPadding = 15;

  static const String newUserPictureUrl =
      """https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=2000""";
  static String newUserCreateDate = DateTime.now().toIso8601String();
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
  }

  @override
  void dispose() {
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

  buildCreateNewUserButton(BuildContext context, newUserNameText,
      newUserEmailText, newUserPasswordText, formKey) {
    return ElevatedButton(
        child: const Text('Create'),
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            late NewUserModel newUser = NewUserModel(
                name: newUserNameText.text,
                email: newUserEmailText.text,
                password: newUserPasswordText.text,
                registrationDate: newUserCreateDate,
                profilePicLink: newUserPictureUrl);
            ref.read(River.newUserPod.notifier).newUser(newUser: newUser);
            ref.read(River.userPod.notifier).readUser();
            Navigator.of(context).pushNamed(AuthPage.routeName);
            // var stateNewName = ref.watch(River.newUserPod).newUser.name;
            // print('state new name: $stateNewName');
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     newUserName =
            //         ref.watch(River.newUserPod).newUser.name;
            //     return Dialog(
            //       // shape: RoundedRectangleBorder(
            //       //   borderRadius: BorderRadius.circular(20.0),
            //       // ),
            //       child: SizedBox(
            //         height: 80,
            //         width: 50,
            //         child: Column(
            //           children: [
            //             const SizedBox(height: 10),
            //             //Не работает создание юзера
            //             ref.watch(River.newUserPod).newUser.name ==
            //                     newUserNameText.text
            //                 ? Text('User $newUserName created')
            //                 : const Text('Error'),
            //             //
            //             const SizedBox(height: 10),
            //             Consumer(
            //               builder: (context, ref, _) {
            //                 return ElevatedButton(
            //                     // style: ButtonStyle(
            //                     //     shape: MaterialStateProperty.all<
            //                     //             RoundedRectangleBorder>(
            //                     //         RoundedRectangleBorder(
            //                     //   borderRadius:
            //                     //       BorderRadius.circular(20.0),
            //                     // ))),
            //                     onPressed: () {
            //                       ref
            //                           .read(River.userPod.notifier)
            //                           .readUser();
            //                       Navigator.of(context)
            //                           .pushNamed(AuthPage.routeName);
            //                     },
            //                     child: const Icon(Icons.check));
            //               },
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
            // print(
            // '${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , ');
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


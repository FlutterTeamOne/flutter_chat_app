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
  late TextEditingController newUserNameText;
  late TextEditingController newUserEmailText;
  late TextEditingController newUserPasswordText;
  late TextEditingController newUserPictureUrlText;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newUserNameText = TextEditingController();
    newUserEmailText = TextEditingController();
    newUserPasswordText = TextEditingController();
    newUserPictureUrlText = TextEditingController();
  }

  @override
  void dispose() {
    newUserNameText.dispose();
    newUserEmailText.dispose();
    newUserPasswordText.dispose();
    newUserPictureUrlText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isActive = ValueNotifier<bool>(true);
    return Center(
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
                inputFormatters: RegExp(r'[A-Za-z]+'),
                controller: newUserNameText,
                validator: (name) {
                  if (name!.length < 3) {
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
                controller: newUserEmailText,
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: _isActive,
                builder: (context, value, child) => FormWidget(
                  text: 'Password',
                  inputFormatters: RegExp(r"^[a-z0-9_A-Z]+"),
                  controller: newUserPasswordText,
                  obscureText: _isActive.value,
                  suffix: _isActive.value == true
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  validator: (password) {
                    if (password != null && password.length < 6) {
                      return 'Password must contain at least 6 characters';
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
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCreateNewUserButton(context, newUserNameText,
                      newUserEmailText, newUserPasswordText, _formKey),
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
    );
  }

  buildCreateNewUserButton(BuildContext context, newUserNameText,
      newUserEmailText, newUserPasswordText, _formKey) {
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
              final isValid = _formKey.currentState!.validate();
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

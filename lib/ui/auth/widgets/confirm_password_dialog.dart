part of '../authorization_page.dart';

class ConfirmPasswordDialog extends StatefulWidget {
  const ConfirmPasswordDialog({
    super.key,
    required this.user,
  });

  final UserDto user;

  @override
  State<ConfirmPasswordDialog> createState() => _ConfirmPasswordDialogState();
}

class _ConfirmPasswordDialogState extends State<ConfirmPasswordDialog> {
  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> confirmPasswordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isActivePassword = ValueNotifier<bool>(true);
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: confirmPasswordKey,
      child: Consumer(builder: (context, ref, _) {
        return AlertDialog(
          title: Row(
            children: [
              CachedImageWidget(
                height: 65,
                width: 65,
                url: widget.user.profilePicLink,
              ),
              // Image.network(
              //   widget.user.profilePicLink,
              //   height: 65,
              //   width: 65,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(width: 10),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SFERA Password',
                      style: textTheme.subtitle2?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Please enter your password for ',
                            style: textTheme.subtitle1?.copyWith(fontSize: 15),
                          ),
                          TextSpan(
                            text: widget.user.email,
                            style: textTheme.subtitle2?.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          content: ValueListenableBuilder(
            valueListenable: isActivePassword,
            builder: (context, value, child) {
              return FormWidget(
                text: 'Password',
                validator: (password) =>
                    FieldFormClass.validatorPassword(password),
                controller: controller,
                obscureText: isActivePassword.value,
                suffix: isActivePassword.value == true
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                suffixOnTap: () {
                  if (isActivePassword.value == true) {
                    isActivePassword.value = false;
                  } else {
                    isActivePassword.value = true;
                  }
                },
                inputFormatters: FieldFormClass.regExpPassword,
              );
            },
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(elevation: MaterialStateProperty.all(4)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  key: const Key('loginButton'),
                  style: ButtonStyle(elevation: MaterialStateProperty.all(4)),
                  onPressed: () async {
                    final isValid = confirmPasswordKey.currentState!.validate();
                    if (isValid) {
                      try {
                        await ref
                            .read(River.synchUserPod.notifier)
                            .confirmPassword(
                              password: controller.text,
                              userId: widget.user.userId!,
                            );
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushNamed(MainLayout.routeName);
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (context) => const ErrorDialog(
                            textTitle: 'Incorrect Password',
                            textContent: 'Try again',
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Log In'),
                ),
              ],
            )
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

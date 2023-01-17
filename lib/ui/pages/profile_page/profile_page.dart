import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/modules/signal_service/river/chat_ref/chat_notifier.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/src/constants/user_constants.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/pages/profile_page/repositiry/show_text_field_dialog.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:chat_app/ui/widgets/custom_widgets/cached_image_widget.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import '../../../modules/signal_service/river/river.dart';
import '../../../modules/storage_manager/db_helper/user_path.dart';
import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/field_with_change_widget.dart';

part 'widgets/change_user_pic.dart';
part 'widgets/load_method.dart';
part 'widgets/app_blured_image.dart';
part 'widgets/user_picture.dart';
part 'widgets/change_image_dialog_widget.dart';
part 'widgets/layout/profile_layout.dart';
part 'widgets/exit_button.dart';
part 'widgets/avatar_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final mainUser = ref.watch(River.userPod).mainUser;
          Logger().d('USER POD PROFILE: $mainUser');

          return mainUser != null
              ? const ProfileLayout(key: Key("ProfileLayout"))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

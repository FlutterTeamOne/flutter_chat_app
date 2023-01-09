import 'package:blur/blur.dart';
import 'package:chat_app/modules/signal_service/river/chat_ref/chat_notifier.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import '../../../modules/signal_service/library/library_signal_service.dart';
import '../../../modules/signal_service/river/river.dart';
import '../../../modules/storage_manager/db_helper/db_helper.dart';
import '../../../modules/storage_manager/db_helper/user_path.dart';
import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/authorization_page.dart';

part 'widgets/change_user_pic.dart';
part 'widgets/load_method.dart';
part 'widgets/app_blured_image.dart';
part 'widgets/_user_picture.dart';
part 'widgets/app_dialog.dart';
part 'widgets/layout/profile_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) =>
          ref.read(River.userPod).users?[0].name != null
              ? const _ProfileLayout()
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}

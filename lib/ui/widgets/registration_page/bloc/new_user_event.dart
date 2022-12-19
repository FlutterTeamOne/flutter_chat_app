import 'package:chat_app/ui/widgets/registration_page/models/new_user_model.dart';

abstract class NewUserEvent {}

class SetNewUserEvent extends NewUserEvent {
  final NewUserModel user;

  SetNewUserEvent({

    required this.user
  });
}
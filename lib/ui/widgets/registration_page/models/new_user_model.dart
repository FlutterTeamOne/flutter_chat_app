class NewUserModel {
  final String name;
  final String email;
  final String password;
  final String registrationDate;
  final String profilePicLink;
  NewUserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.registrationDate,
      required this.profilePicLink});
}

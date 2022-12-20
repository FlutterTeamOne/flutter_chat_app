class NewUserModel {
  final String? name;
  final String? email;
  final String? password;
  final String registrationDate;
  final String profilePicLink;
  NewUserModel(
      {this.name,
      this.email,
      this.password,
      required this.registrationDate,
      required this.profilePicLink});
}

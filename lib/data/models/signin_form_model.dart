class SignInFormModel {
  final String? email;
  final String? password;

  SignInFormModel({
    this.email,
    this.password,
  });

  SignInFormModel copyWith({
    String? email,
    String? password,
  }) =>
      SignInFormModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory SignInFormModel.fromJson(Map<String, dynamic> json) =>
      SignInFormModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

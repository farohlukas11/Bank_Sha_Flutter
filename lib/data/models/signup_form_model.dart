class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  SignUpFormModel copyWith({
    String? name,
    String? email,
    String? password,
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      SignUpFormModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );

  factory SignUpFormModel.fromJson(Map<String, dynamic> json) =>
      SignUpFormModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        pin: json["pin"],
        profilePicture: json["profile_picture"],
        ktp: json["ktp"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "pin": pin,
        "profile_picture": profilePicture,
        "ktp": ktp,
      };
}

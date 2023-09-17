import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final dynamic emailVerifiedAt;
  final int? verified;
  final String? profilePicture;
  final String? ktp;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;
  final int? tokenExpiresIn;
  final String? tokenType;

  UserModel({
     this.id,
     this.name,
     this.email,
     this.username,
     this.emailVerifiedAt,
     this.verified,
     this.profilePicture,
     this.ktp,
     this.createdAt,
     this.updatedAt,
     this.balance,
     this.cardNumber,
     this.pin,
     this.token,
     this.tokenExpiresIn,
     this.tokenType,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? username,
    dynamic emailVerifiedAt,
    int? verified,
    String? profilePicture,
    String? ktp,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? balance,
    String? cardNumber,
    String? pin,
    String? token,
    int? tokenExpiresIn,
    String? tokenType,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        username: username ?? this.username,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        verified: verified ?? this.verified,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        balance: balance ?? this.balance,
        cardNumber: cardNumber ?? this.cardNumber,
        pin: pin ?? this.pin,
        token: token ?? this.token,
        tokenExpiresIn: tokenExpiresIn ?? this.tokenExpiresIn,
        tokenType: tokenType ?? this.tokenType,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        emailVerifiedAt: json["email_verified_at"],
        verified: json["verified"],
        profilePicture: json["profile_picture"],
        ktp: json["ktp"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        balance: json["balance"],
        cardNumber: json["card_number"],
        pin: json["pin"],
        token: json["token"],
        tokenExpiresIn: json["token_expires_in"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "email_verified_at": emailVerifiedAt,
        "verified": verified,
        "profile_picture": profilePicture,
        "ktp": ktp,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "balance": balance,
        "card_number": cardNumber,
        "pin": pin,
        "token": token,
        "token_expires_in": tokenExpiresIn,
        "token_type": tokenType,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        username,
        emailVerifiedAt,
        verified,
        profilePicture,
        ktp,
        createdAt,
        updatedAt,
        balance,
        cardNumber,
        pin,
        token,
        tokenExpiresIn,
        tokenType,
      ];
}

class BankModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? status;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? time;

  BankModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.time,
  });

  BankModel copyWith({
    int? id,
    String? name,
    String? code,
    String? thumbnail,
    String? status,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
    String? time,
  }) =>
      BankModel(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        thumbnail: thumbnail ?? this.thumbnail,
        status: status ?? this.status,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        time: time ?? this.time,
      );

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "thumbnail": thumbnail,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "time": time,
      };
}

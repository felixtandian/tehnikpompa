class UserModel {
    String id;
    dynamic password;
    String roleId;
    String name;
    String shortName;
    String email;
    String noHp;
    dynamic updatedDate;
    dynamic deletedBy;
    dynamic deletedDate;

    UserModel({
        required this.id,
        required this.password,
        required this.roleId,
        required this.name,
        required this.shortName,
        required this.email,
        required this.noHp,
        required this.updatedDate,
        required this.deletedBy,
        required this.deletedDate,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        password: json["password"],
        roleId: json["roleID"],
        name: json["name"],
        shortName: json["shortName"],
        email: json["email"],
        noHp: json["noHP"],
        updatedDate: json["updatedDate"],
        deletedBy: json["deletedBy"],
        deletedDate: json["deletedDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "roleID": roleId,
        "name": name,
        "shortName": shortName,
        "email": email,
        "noHP": noHp,
        "updatedDate": updatedDate,
        "deletedBy": deletedBy,
        "deletedDate": deletedDate,
    };
}

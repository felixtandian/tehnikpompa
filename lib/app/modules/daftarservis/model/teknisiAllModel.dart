class DaftarTeknisiModel {
  DaftarTeknisiModel({
    required this.id,
    required this.name,
  });
  int id;
  String name;

  factory DaftarTeknisiModel.fromJson(Map<String, dynamic> json) =>
      DaftarTeknisiModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

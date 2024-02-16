class DaftarServisSayaModel {
    String id;
    String nama;
    String createdDate;
    String status;
    String teknisi1;
    String teknisi2;

    DaftarServisSayaModel({
        required this.id,
        required this.nama,
        required this.createdDate,
        required this.status,
        required this.teknisi1,
        required this.teknisi2,
    });

    factory DaftarServisSayaModel.fromJson(Map<String, dynamic> json) => DaftarServisSayaModel(
        id: json["id"],
        nama: json["nama"],
        createdDate: json["createdDate"],
        status: json["status"],
        teknisi1: json["teknisi1"].toString(),
        teknisi2: json["teknisi2"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "createdDate": createdDate,
        "status": status,
        "teknisi1": teknisi1,
        "teknisi2": teknisi2,
    };
}

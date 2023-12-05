class DaftarBarangModel {
    String namaBarang;
    String kodeBarang;
    int stokBarang;
    int totalBooking;
    int stokIndent;

    DaftarBarangModel({
        required this.namaBarang,
        required this.kodeBarang,
        required this.stokBarang,
        required this.totalBooking,
        required this.stokIndent,
    });

    factory DaftarBarangModel.fromJson(Map<String, dynamic> json) => DaftarBarangModel(
        namaBarang: json["namaBarang"],
        kodeBarang: json["kodeBarang"],
        stokBarang: json["stokBarang"],
        totalBooking: json["totalBooking"],
        stokIndent: json["stokIndent"],
    );

    Map<String, dynamic> toJson() => {
        "namaBarang": namaBarang,
        "kodeBarang": kodeBarang,
        "stokBarang": stokBarang,
        "totalBooking": totalBooking,
        "stokIndent": stokIndent,
    };
}

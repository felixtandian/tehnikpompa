class DaftarBarangModel {
    String namaBarang;
    String kodeBarang;
    int stokBarang;
    int totalBooking;
    int stokIndent;
    String noteBooking;

    DaftarBarangModel({
        required this.namaBarang,
        required this.kodeBarang,
        required this.stokBarang,
        required this.totalBooking,
        required this.stokIndent,
        required this.noteBooking
    });

    factory DaftarBarangModel.fromJson(Map<String, dynamic> json) => DaftarBarangModel(
        namaBarang: json["namaBarang"],
        kodeBarang: json["kodeBarang"],
        stokBarang: json["stokBarang"],
        totalBooking: json["totalBooking"],
        stokIndent: json["stokIndent"],
        noteBooking: json["noteBooking"],
    );

    Map<String, dynamic> toJson() => {
        "namaBarang": namaBarang,
        "kodeBarang": kodeBarang,
        "stokBarang": stokBarang,
        "totalBooking": totalBooking,
        "stokIndent": stokIndent,
        "noteBooking": noteBooking,
    };
}

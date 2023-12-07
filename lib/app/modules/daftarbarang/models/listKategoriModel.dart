class KategoriModel {
    String kodeKtgrBarang;
    String namaKtgrBarang;

    KategoriModel({
        required this.kodeKtgrBarang,
        required this.namaKtgrBarang,
    });

    factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        kodeKtgrBarang: json["kodeKtgrBarang"],
        namaKtgrBarang: json["namaKtgrBarang"],
    );

    Map<String, dynamic> toJson() => {
        "kodeKtgrBarang": kodeKtgrBarang,
        "namaKtgrBarang": namaKtgrBarang,
    };
}

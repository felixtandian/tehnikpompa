class DetailServisModel {
    String id;
    int userId;
    String statusId;
    String nama;
    String lokasi;
    String tipePompa;
    String reqTanggal;
    int jmlPompa;
    String cpNama;
    String cpTelp;
    String umurPompa;
    String keterangan;
    String tipeRequestId;
    String rekomendasiTeknisi;
    String tanggalAssign;
    String teknisi1;
    dynamic teknisi2;
    String createdBy;
    String createdDate;
    String updatedBy;
    String updatedDate;
    dynamic deletedBy;
    dynamic deletedDate;
    List<String> images;

    DetailServisModel({
        required this.id,
        required this.userId,
        required this.statusId,
        required this.nama,
        required this.lokasi,
        required this.tipePompa,
        required this.reqTanggal,
        required this.jmlPompa,
        required this.cpNama,
        required this.cpTelp,
        required this.umurPompa,
        required this.keterangan,
        required this.tipeRequestId,
        required this.rekomendasiTeknisi,
        required this.tanggalAssign,
        required this.teknisi1,
        required this.teknisi2,
        required this.createdBy,
        required this.createdDate,
        required this.updatedBy,
        required this.updatedDate,
        required this.deletedBy,
        required this.deletedDate,
        required this.images,
    });

    factory DetailServisModel.fromJson(Map<String, dynamic> json) => DetailServisModel(
        id: json["id"],
        userId: json["userID"],
        statusId: json["statusID"],
        nama: json["nama"],
        lokasi: json["lokasi"],
        tipePompa: json["tipePompa"],
        reqTanggal: json["reqTanggal"],
        jmlPompa: json["jmlPompa"],
        cpNama: json["CPNama"],
        cpTelp: json["CPTelp"],
        umurPompa: json["umurPompa"],
        keterangan: json["keterangan"],
        tipeRequestId: json["tipeRequestID"],
        rekomendasiTeknisi: json["rekomendasiTeknisi"].toString(),
        tanggalAssign: json["tanggalAssign"].toString(),
        teknisi1: json["teknisi1"].toString(),
        teknisi2: json["teknisi2"].toString(),
        createdBy: json["createdBy"].toString(),
        createdDate: json["createdDate"].toString(),
        updatedBy: json["updatedBy"].toString(),
        updatedDate: json["updatedDate"].toString(),
        deletedBy: json["deletedBy"].toString(),
        deletedDate: json["deletedDate"].toString(),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userId,
        "statusID": statusId,
        "nama": nama,
        "lokasi": lokasi,
        "tipePompa": tipePompa,
        "reqTanggal": reqTanggal,
        "jmlPompa": jmlPompa,
        "CPNama": cpNama,
        "CPTelp": cpTelp,
        "umurPompa": umurPompa,
        "keterangan": keterangan,
        "tipeRequestID": tipeRequestId,
        "rekomendasiTeknisi": rekomendasiTeknisi,
        "tanggalAssign": tanggalAssign,
        "teknisi1": teknisi1,
        "teknisi2": teknisi2,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "deletedBy": deletedBy,
        "deletedDate": deletedDate,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

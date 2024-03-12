class ResponViewDetailModel {
    String idRespon;
    DateTime tglTindakan;
    String keterangan;
    int jmlPompa;
    String tipePompa;
    String partNumber;
    String ketPompa;
    String power;
    String isolation;
    String voltageStandby;
    String voltageRunning;
    String ampere;
    String ketahanan;
    String konfirmasiKlien;
    String dicekOleh;

    ResponViewDetailModel({
        required this.idRespon,
        required this.tglTindakan,
        required this.keterangan,
        required this.jmlPompa,
        required this.tipePompa,
        required this.partNumber,
        required this.ketPompa,
        required this.power,
        required this.isolation,
        required this.voltageStandby,
        required this.voltageRunning,
        required this.ampere,
        required this.ketahanan,
        required this.konfirmasiKlien,
        required this.dicekOleh,
    });

    factory ResponViewDetailModel.fromJson(Map<String, dynamic> json) => ResponViewDetailModel(
        idRespon: json["ID_Respon"],
        tglTindakan: DateTime.parse(json["tglTindakan"]),
        keterangan: json["keterangan"],
        jmlPompa: json["jmlPompa"],
        tipePompa: json["tipePompa"],
        partNumber: json["partNumber"],
        ketPompa: json["ketPompa"].toString(),
        power: json["power"].toString(),
        isolation: json["isolation"].toString(),
        voltageStandby: json["voltageStandby"].toString(),
        voltageRunning: json["voltageRunning"],
        ampere: json["ampere"],
        ketahanan: json["ketahanan"],
        konfirmasiKlien: json["konfirmasiKlien"],
        dicekOleh: json["dicek_oleh"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "ID_Respon": idRespon,
        "tglTindakan": "${tglTindakan.year.toString().padLeft(4, '0')}-${tglTindakan.month.toString().padLeft(2, '0')}-${tglTindakan.day.toString().padLeft(2, '0')}",
        "keterangan": keterangan,
        "jmlPompa": jmlPompa,
        "tipePompa": tipePompa,
        "partNumber": partNumber,
        "ketPompa": ketPompa,
        "power": power,
        "isolation": isolation,
        "voltageStandby": voltageStandby,
        "voltageRunning": voltageRunning,
        "ampere": ampere,
        "ketahanan": ketahanan,
        "konfirmasiKlien": konfirmasiKlien,
        "dicek_oleh": dicekOleh,
    };
}

class ImageResponViewDetail {
    String id;
    String projectId;
    String title;
    dynamic flagDelete;

    ImageResponViewDetail({
        required this.id,
        required this.projectId,
        required this.title,
        required this.flagDelete,
    });

    factory ImageResponViewDetail.fromJson(Map<String, dynamic> json) => ImageResponViewDetail(
        id: json["id"].toString(),
        projectId: json["projectID"].toString(),
        title: json["title"].toString(),
        flagDelete: json["flagDelete"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "projectID": projectId,
        "title": title,
        "flagDelete": flagDelete,
    };
}

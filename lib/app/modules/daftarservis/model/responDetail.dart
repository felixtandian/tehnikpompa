class ResponDetail {
    int success;
    String message;
    ResponDetailData data;

    ResponDetail({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ResponDetail.fromJson(Map<String, dynamic> json) => ResponDetail(
        success: json["success"],
        message: json["message"],
        data: ResponDetailData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class ResponDetailData {
    String userId;
    String reportId;
    String tipePompa;
    String partnumber;
    String ketPompa;
    String konfKlien;
    String power;
    String isolasi;
    String voltStandby;
    String voltRunning;
    String ampere;
    String ketahanan;
    List<dynamic> image;

    ResponDetailData({
        required this.userId,
        required this.reportId,
        required this.tipePompa,
        required this.partnumber,
        required this.ketPompa,
        required this.konfKlien,
        required this.power,
        required this.isolasi,
        required this.voltStandby,
        required this.voltRunning,
        required this.ampere,
        required this.ketahanan,
        required this.image,
    });

    factory ResponDetailData.fromJson(Map<String, dynamic> json) => ResponDetailData(
        userId: json["userID"],
        reportId: json["reportID"],
        tipePompa: json["tipePompa"],
        partnumber: json["partnumber"],
        ketPompa: json["ketPompa"],
        konfKlien: json["konfKlien"],
        power: json["power"],
        isolasi: json["isolasi"],
        voltStandby: json["voltStandby"],
        voltRunning: json["voltRunning"],
        ampere: json["ampere"],
        ketahanan: json["ketahanan"],
        image: List<dynamic>.from(json["image"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "reportID": reportId,
        "tipePompa": tipePompa,
        "partnumber": partnumber,
        "ketPompa": ketPompa,
        "konfKlien": konfKlien,
        "power": power,
        "isolasi": isolasi,
        "voltStandby": voltStandby,
        "voltRunning": voltRunning,
        "ampere": ampere,
        "ketahanan": ketahanan,
        "image": List<dynamic>.from(image.map((x) => x)),
    };
}

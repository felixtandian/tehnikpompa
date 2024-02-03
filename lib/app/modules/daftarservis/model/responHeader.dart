class ResponHeaderModel {
    int success;
    String message;
    String data;

    ResponHeaderModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ResponHeaderModel.fromJson(Map<String, dynamic> json) => ResponHeaderModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
    };
}

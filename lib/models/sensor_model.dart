import 'dart:convert';

Sensor sensorFromJson(String str) => Sensor.fromJson(json.decode(str));

String sensorToJson(Sensor data) => json.encode(data.toJson());

class Sensor {
    List<Datum> data;

    Sensor({
        required this.data,
    });

    factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    num hr;
    num sys;
    num dys;
    double temp;
    num spo2;
    num ecg;
    DateTime waktu;
    int v;

    Datum({
        required this.id,
        required this.hr,
        required this.sys,
        required this.dys,
        required this.temp,
        required this.spo2,
        required this.ecg,
        required this.waktu,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        hr: json["hr"],
        sys: json["sys"],
        dys: json["dys"],
        temp: json["temp"]?.toDouble(),
        spo2: json["spo2"],
        ecg: json["ecg"],
        waktu: DateTime.parse(json["waktu"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "hr": hr,
        "sys": sys,
        "dys": dys,
        "temp": temp,
        "spo2": spo2,
        "ecg": ecg,
        "waktu": waktu.toIso8601String(),
        "__v": v,
    };
}

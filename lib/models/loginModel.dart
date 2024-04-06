// To parse this JSON data, do
//
//     final LoginModele = LoginModeleFromJson(jsonString);

import 'dart:convert';

LoginModele LoginModeleFromJson(String str) => LoginModele.fromJson(json.decode(str));

String LoginModeleToJson(LoginModele data) => json.encode(data.toJson());

class LoginModele {
    String task;
    int lid;
    String type;

    LoginModele({
        required this.task,
        required this.lid,
        required this.type,
    });

    factory LoginModele.fromJson(Map<String, dynamic> json) => LoginModele(
        task: json["task"],
        lid: json["lid"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "task": task,
        "lid": lid,
        "type": type,
    };
}

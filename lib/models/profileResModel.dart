// To parse this JSON data, do
//
//     final ProfileModel = ProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel ProfileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String ProfileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String address;
    String adharnum;
    String applydate;
    String consumernumber;
    String district;
    String email;
    String housenum;
    int id;
    String loginid;
    String name;
    int phnum;
    String photo;
    String pincode;

    ProfileModel({
        required this.address,
        required this.adharnum,
        required this.applydate,
        required this.consumernumber,
        required this.district,
        required this.email,
        required this.housenum,
        required this.id,
        required this.loginid,
        required this.name,
        required this.phnum,
        required this.photo,
        required this.pincode,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        address: json["address"],
        adharnum: json["adharnum"],
        applydate: json["applydate"],
        consumernumber: json["consumernumber"],
        district: json["district"],
        email: json["email"],
        housenum: json["housenum"],
        id: json["id"],
        loginid: json["loginid"],
        name: json["name"],
        phnum: json["phnum"],
        photo: json["photo"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "adharnum": adharnum,
        "applydate": applydate,
        "consumernumber": consumernumber,
        "district": district,
        "email": email,
        "housenum": housenum,
        "id": id,
        "loginid": loginid,
        "name": name,
        "phnum": phnum,
        "photo": photo,
        "pincode": pincode,
    };
}

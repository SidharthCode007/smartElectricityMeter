// To parse this JSON data, do
//
//     final BillHistoryModel = BillHistoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BillHistoryModel BillHistoryModelFromJson(String str) => BillHistoryModel.fromJson(json.decode(str));

String BillHistoryModelToJson(BillHistoryModel data) => json.encode(data.toJson());

class BillHistoryModel {
    int billamount;
    String billdate;
    String consumerNo;
    String currentreading;
    String discDate;
    String dueDate;
    int id;
    String name;
    String paymentstatus;
    String previousReading;

    BillHistoryModel({
        required this.billamount,
        required this.billdate,
        required this.consumerNo,
        required this.currentreading,
        required this.discDate,
        required this.dueDate,
        required this.id,
        required this.name,
        required this.paymentstatus,
        required this.previousReading,
    });

    factory BillHistoryModel.fromJson(Map<String, dynamic> json) => BillHistoryModel(
        billamount: json["billamount"],
        billdate: json["billdate"],
        consumerNo: json["consumer_no"],
        currentreading: json["currentreading"],
        discDate: json["disc_date"],
        dueDate: json["due_date"],
        id: json["id"],
        name: json["name"],
        paymentstatus: json["paymentstatus"],
        previousReading: json["previous_reading"],
    );

    Map<String, dynamic> toJson() => {
        "billamount": billamount,
        "billdate": billdate,
        "consumer_no": consumerNo,
        "currentreading": currentreading,
        "disc_date": discDate,
        "due_date": dueDate,
        "id": id,
        "name": name,
        "paymentstatus": paymentstatus,
        "previous_reading": previousReading,
    };
}

// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  String title;
  String description;
  int transactionType;
  int categoryType;
  int value;

  TransactionModel({
    required this.title,
    required this.description,
    required this.transactionType,
    required this.categoryType,
    required this.value
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    title: json["title"],
    description: json["description"],
    transactionType: json["transactionType"],
    categoryType: json["categoryType"],
    value: json["value"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "transactionType": transactionType,
    "categoryType": categoryType,
    "value": value
  };
}

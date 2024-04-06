import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartmeter/constants/globalVar.dart';
import 'package:smartmeter/constants/urls.dart';
import 'package:smartmeter/models/billHistory.dart';

Future<List<BillHistoryModel>?> viewpendingBillApi() async {
  try {
    final url = Uri.parse('$baseUrl/viewpendingbill?consumerno=$consumerno');
    final response = await http.get(url);
    print("Response Body: ${response.body}");
    print("Response Status Code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("success fully done");
      final resp = jsonDecode(response.body);
      final bill = (resp as List).map((e) => BillHistoryModel.fromJson(e)).toList();
      return bill;
    } else {
      print("else");
      print("Response Status Code: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Catch : ${e.toString()}");
    return null;
  }
}
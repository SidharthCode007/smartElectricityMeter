import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartmeter/constants/globalVar.dart';
import 'package:smartmeter/constants/urls.dart';
import 'package:smartmeter/models/profileResModel.dart';

Future<List<ProfileModel>?> getUserProfile() async {
  try {
    final url = Uri.parse('$baseUrl/viewuserbyid?conid=$consumerno');
    final response = await http.post(url);
    print("Response Body: ${response.body}");
    print("Response Status Code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("success fully done");
      final resp = jsonDecode(response.body);
      final status = (resp as List).map((e) => ProfileModel.fromJson(e)).toList();
      return status;
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
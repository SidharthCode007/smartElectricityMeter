
import 'package:http/http.dart' as http;
import 'package:smartmeter/constants/urls.dart';
import 'package:smartmeter/models/registrationModel.dart';



Future<String> adduserApi(UserRegModel user) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/userregistration'),
    );
    request.fields['name'] = user.name;
    request.fields['address'] = user.address;
    request.fields['district'] = user.district; 
    request.fields['pincode'] = user.pinnumber;
    request.fields['ph'] = user.phone;
    request.fields['email'] = user.email;
    request.fields['adhar'] = user.adharnum;
    request.fields['house'] = user.housenum;
    request.fields['applydate'] = DateTime.now().toString();
    request.files.add(await http.MultipartFile.fromPath(
      'photo',
      user.imgPath,
    ));

    print(user.imgPath);

    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201 ) {
      print('Menu item added successfully');
      return "success";
    } else {
      print('Failed to add menu item: ${response.statusCode}');
      return "failed";
    }
  } catch (e) {
    print('Error adding menu item: $e');
    return "failed";
  }
}
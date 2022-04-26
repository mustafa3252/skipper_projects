import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<VendorType> createDeptData(
    String vendorType, String des, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'vendorType': vendorType,
      'des': des,
      'status': statusValue,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return VendorType.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create vendor.');
  }
}

class VendorType {
  final String vendorType;
  final String des;
  final int statusValue;

  const VendorType(
      {required this.vendorType, required this.des, required this.statusValue});

  factory VendorType.fromJson(Map<String, dynamic> json) {
    return VendorType(
      vendorType: json['vendorType'],
      des: json['des'],
      statusValue: json['status'],
    );
  }
}

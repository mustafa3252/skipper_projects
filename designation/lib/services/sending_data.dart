import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DesignationData> createDesignationData(
    String desgData, String des, int statusValue, String department) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'desgData': desgData,
      'des': des,
      'status': statusValue,
      'department': department,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return DesignationData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create department.');
  }
}

class DesignationData {
  final String desgData;
  final String des;
  final String department;
  final int statusValue;

  const DesignationData(
      {required this.desgData,
      required this.des,
      required this.statusValue,
      required this.department});

  factory DesignationData.fromJson(Map<String, dynamic> json) {
    return DesignationData(
      desgData: json['desgData'],
      des: json['des'],
      statusValue: json['status'],
      department: json['department'],
    );
  }
}

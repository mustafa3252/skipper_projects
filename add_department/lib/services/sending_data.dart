import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DepartmentData> createDeptData(
    String deptName, String des, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'deptName': deptName,
      'des': des,
      'status': statusValue,
    }),

  );

  if (response.statusCode == 201) {

    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return DepartmentData.fromJson(jsonDecode(response.body));
  } else {

    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class DepartmentData {
  final String deptName;
  final String des;
  final int statusValue;

  const DepartmentData(
      {required this.deptName, required this.des, required this.statusValue});

  factory DepartmentData.fromJson(Map<String, dynamic> json) {
    return DepartmentData(
      deptName: json['deptName'],
      des: json['des'],
      statusValue: json['status'],
    );
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DistrictData> createDistrictData(
    String destName, String country, String state, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'destName': destName,
      'country': country,
      'state': state,
      'status': statusValue,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return DistrictData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class DistrictData {
  final String destName;
  final String country;
  final String state;
  final int statusValue;

  const DistrictData(
      {required this.destName,
      required this.country,
      required this.state,
      required this.statusValue});

  factory DistrictData.fromJson(Map<String, dynamic> json) {
    return DistrictData(
      destName: json['destName'],
      country: json['country'],
      state: json['state'],
      statusValue: json['status'],
    );
  }
}

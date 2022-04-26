import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<StateData> createStateData(
    String deptName, String des, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'state': deptName,
      'country': des,
      'status': statusValue,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return StateData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create states.');
  }
}

class StateData {
  final String state;
  final String country;
  final int statusValue;

  const StateData(
      {required this.state, required this.country, required this.statusValue});

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      state: json['state'],
      country: json['country'],
      statusValue: json['status'],
    );
  }
}

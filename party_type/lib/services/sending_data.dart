import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<PartyTypeData> createPartyTypeData(
    String partyType, String des, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'partyType': partyType,
      'des': des,
      'status': statusValue,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return PartyTypeData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create party type.');
  }
}

class PartyTypeData {
  final String partyType;
  final String des;
  final int statusValue;

  const PartyTypeData(
      {required this.partyType, required this.des, required this.statusValue});

  factory PartyTypeData.fromJson(Map<String, dynamic> json) {
    return PartyTypeData(
      partyType: json['partyType'],
      des: json['des'],
      statusValue: json['status'],
    );
  }
}

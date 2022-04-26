import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<KpiData> createKpiData(
    String kpiName, String des, String calBasis) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'kpiName': kpiName,
      'des': des,
      'calBasis': calBasis,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return KpiData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create kpi data.');
  }
}

class KpiData {
  final String kpiData;
  final String des;
  final int calBasis;

  const KpiData(
      {required this.kpiData, required this.des, required this.calBasis});

  factory KpiData.fromJson(Map<String, dynamic> json) {
    return KpiData(
      kpiData: json['kpiData'],
      des: json['des'],
      calBasis: json['calBasis'],
    );
  }
}

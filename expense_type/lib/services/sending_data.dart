import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ExpenseTypeData> createExpenseTypeData(
    String expenseType, String des, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'expenseType': expenseType,
      'des': des,
      'status': statusValue,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ExpenseTypeData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create expense type.');
  }
}

class ExpenseTypeData {
  final String expenseType;
  final String des;
  final int statusValue;

  const ExpenseTypeData(
      {required this.expenseType,
      required this.des,
      required this.statusValue});

  factory ExpenseTypeData.fromJson(Map<String, dynamic> json) {
    return ExpenseTypeData(
      expenseType: json['expenseType'],
      des: json['des'],
      statusValue: json['status'],
    );
  }
}

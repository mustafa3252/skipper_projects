import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<BlogData> createBlogCategory(
    String blogCategory, String des, int statusValue) async {
  final response = await http.post(
    Uri.parse('https://2d6a-45-118-158-144.ngrok.io/documents'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'blogCategory': blogCategory,
      'des': des,
      'status': statusValue,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return BlogData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create category.');
  }
}

class BlogData {
  final String blogCategory;
  final String des;
  final int statusValue;

  const BlogData(
      {required this.blogCategory,
      required this.des,
      required this.statusValue});

  factory BlogData.fromJson(Map<String, dynamic> json) {
    return BlogData(
      blogCategory: json['blogCategory'],
      des: json['des'],
      statusValue: json['status'],
    );
  }
}

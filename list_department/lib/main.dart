import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:list_department/build_data_table.dart';
import 'package:list_department/models/demo_data.dart';
import 'package:list_department/widgets/scrollable_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  // List save dummy data from the internet
  List<DemoData> demoData = [];

  // url for getting data from internet
  var uri = "https://jsonplaceholder.typicode.com/posts";

  // method to get data from the internet
  void fetchPost() async {
    try {
      final response = await get(Uri.parse(uri));
      // final jsonData = jsonDecode(response.body) as List;
      setState(() {
        demoData = demoDataFromJson(response.body);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          child: ScrollableWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header
                const Text(
                  "List of Departments",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Datatable
                BuildDataTable(
                  postsList: demoData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

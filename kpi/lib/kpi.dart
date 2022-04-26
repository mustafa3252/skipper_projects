import 'package:add_department/services/sending_data.dart';
import 'package:flutter/material.dart';

class Kpi extends StatefulWidget {
  const Kpi({Key? key}) : super(key: key);

  @override
  State<Kpi> createState() => _KpiState();
}

class _KpiState extends State<Kpi> {
  late String kpiName;
  late String des;
  late String calBasis;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  // KPI Name
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (value) => {kpiName = value},
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Name of the KPI",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  // Description
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (value) => {des = value},
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // Drop Down Menu
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (value) => {kpiName = value},
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Calculation Basis",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  // Button
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.062,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green.shade400),
                        onPressed: () => createKpiData(kpiName, des, calBasis),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

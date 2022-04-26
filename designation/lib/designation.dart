import 'package:add_department/services/sending_data.dart';
import 'package:flutter/material.dart';

class Designation extends StatefulWidget {
  const Designation({Key? key}) : super(key: key);

  @override
  State<Designation> createState() => _DesignationState();
}

class _DesignationState extends State<Designation> {
  final List<String> statusList = ["Active", "Not-Active"];
  final List<String> departmentList = ["IT", "HR", "Finance"];
  late String _currentSelectedValue = "Active";
  // ignore: prefer_final_fields
  late String _currentSelectedDepartment = "IT";
  late String desgName;
  late String des;
  int statusValue = 1;

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
                  // Department Name
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (value) => {desgName = value},
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Designation Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  // Department
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: const InputDecoration(
                            hintText: "Department",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                            ),
                          ),
                          isEmpty: _currentSelectedDepartment == "",
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _currentSelectedDepartment,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSelectedDepartment =
                                      newValue.toString();

                                  state.didChange(newValue);
                                });
                              },
                              items: departmentList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
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
                  // Drop Down Menu

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: const InputDecoration(
                            hintText: "Status",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                            ),
                          ),
                          isEmpty: _currentSelectedValue == "",
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _currentSelectedValue,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSelectedValue = newValue.toString();
                                  if (_currentSelectedValue == "Active") {
                                    statusValue = 1;
                                  } else if (_currentSelectedValue ==
                                      "Not-Active") {
                                    statusValue = 2;
                                  }
                                  state.didChange(newValue);
                                });
                              },
                              items: statusList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
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
                        onPressed: () => createDesignationData(desgName, des,
                            statusValue, _currentSelectedDepartment),
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

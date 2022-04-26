import 'package:add_department/services/sending_data.dart';
import 'package:flutter/material.dart';

class VendorType extends StatefulWidget {
  const VendorType({Key? key}) : super(key: key);

  @override
  State<VendorType> createState() => _VendorTypeState();
}

class _VendorTypeState extends State<VendorType> {
  final List<String> statusList = ["Active", "Not-Active"];
  late String _currentSelectedValue = "Active";
  late String vendorType;
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
                  // Text input feild for vendor type
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (value) => {vendorType = value},
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Name of the Vendor Type",
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
                        onPressed: () =>
                            createDeptData(vendorType, des, statusValue),
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

import 'package:add_department/services/sending_data.dart';
import 'package:flutter/material.dart';

class District extends StatefulWidget {
  const District({Key? key}) : super(key: key);

  @override
  State<District> createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  final List<String> statusList = ["Active", "Not-Active"];
  final List<String> countryList = ["India", "USA", "UK", "China"];
  final List<String> stateList = [
    "Gujarat",
    "Maharastra",
    "Rajasthan",
    "Madhya Pradesh"
  ];
  late String _currentSelectedValue = "Active";
  late String _currentSelectedCountry = "India";
  late String _currentSelectedState = "Gujarat";
  late String distName;
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
                      onChanged: (value) => {distName = value},
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Department Name",
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
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: const InputDecoration(
                            hintText: "Select State",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                            ),
                          ),
                          isEmpty: _currentSelectedState == "",
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _currentSelectedState,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSelectedState = newValue.toString();

                                  state.didChange(newValue);
                                });
                              },
                              items: stateList.map((String value) {
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
                  //Country List
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: const InputDecoration(
                            hintText: "Select Country",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                            ),
                          ),
                          isEmpty: _currentSelectedCountry == "",
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _currentSelectedCountry,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSelectedCountry = newValue.toString();

                                  state.didChange(newValue);
                                });
                              },
                              items: countryList.map((String value) {
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
                        onPressed: () => createDistrictData(
                            distName,
                            _currentSelectedCountry,
                            _currentSelectedState,
                            statusValue),
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

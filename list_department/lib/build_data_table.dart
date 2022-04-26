import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list_department/widgets/scrollable_widget.dart';
import 'models/demo_data.dart';

class BuildDataTable extends StatefulWidget {
  final List<DemoData>
      postsList; // saves the data from the internet for further use
  const BuildDataTable({required this.postsList, Key? key}) : super(key: key);

  @override
  State<BuildDataTable> createState() => _BuildDataTableState();
}

class _BuildDataTableState extends State<BuildDataTable> {
  final columns = [
    'User Id',
    'Id',
    'Title',
    'Body',
    'Actions'
  ]; // List of Columns
  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(
      // Enable horizontal and vertical scroll for the table
      child: DataTable(
        columns: getColumns(columns),
        // the below code maps over the postsList list and generates data cells
        rows: widget.postsList.map((item) {
          return DataRow(cells: [
            DataCell(
              Expanded(
                child: TextFormField(
                  initialValue: item.userId.toString(),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (val) {
                    if (kDebugMode) {
                      print('onSubmited $val');
                    }
                  },
                ),
              ),
            ),
            DataCell(
              Expanded(
                child: TextFormField(
                  initialValue: item.id.toString(),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (val) {
                    if (kDebugMode) {
                      print('onSubmited $val');
                    }
                  },
                ),
              ),
            ),
            DataCell(Expanded(
              child: TextFormField(
                initialValue: item.title,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onFieldSubmitted: (val) {
                  if (kDebugMode) {
                    print('onSubmited $val');
                  }
                },
              ),
            )),
            DataCell(
              Expanded(
                child: TextFormField(
                  initialValue: item.title,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (val) {
                    if (kDebugMode) {
                      print('onSubmited $val');
                    }
                  },
                ),
              ),
            ),
            const DataCell(Expanded(child: ActionItem())),
          ]);
        }).toList(),
      ),
    );
  }
}

// method to get columns for the Data Table
List<DataColumn> getColumns(List<String> columns) => columns
    .map((String column) => DataColumn(
          label: Text(
            column,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ))
    .toList();

// Action Button Widget placed at the end of each row
class ActionItem extends StatelessWidget {
  const ActionItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.green,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

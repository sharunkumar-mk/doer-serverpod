import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: ResponsiveLayout.isMobile(context)
            ? Axis.horizontal
            : Axis.vertical,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Flexible(
                child: Text(
                  'Photo',
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Name',
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Email',
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Action',
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            // for (var user in state.response.user)
            DataRow(cells: <DataCell>[
              DataCell(Text("1")),
              DataCell(Text('2')),
              DataCell(Text('2')),
              DataCell(Text('2')),
            ]),
          ],
        ),
      ),
    );
  }
}

import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Dashboard");
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: WebAppColors.primary)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: ResponsiveLayout.isMobile(context)
            ? Axis.horizontal
            : Axis.vertical,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Name',
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Description',
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Image',
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Other',
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


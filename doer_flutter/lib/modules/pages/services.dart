import 'package:doer_flutter/data/data.dart';
import 'package:doer_flutter/modules/widgets/common_drawer.dart';
import 'package:doer_flutter/modules/widgets/common_header.dart';
import 'package:doer_flutter/modules/widgets/common_service_item.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isTablet = ResponsiveLayout.isTablet(context);
    bool isDesktop = ResponsiveLayout.isDesktop(context);

    return const Text("data");

    // return Scaffold(
    //   endDrawer: CommonDrawer(),
    //   appBar: const CommonHeader(),
    //   body: Padding(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: isMobile
    //           ? 10
    //           : isTablet
    //               ? 20
    //               : 75,
    //     ),
    //     child: GridView.builder(
    //       physics: const BouncingScrollPhysics(),
    //       shrinkWrap: true,
    //       itemCount: serviceList.length,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: isMobile
    //             ? 1
    //             : isTablet
    //                 ? 2
    //                 : 4,
    //         crossAxisSpacing: isMobile ? 10 : 20,
    //         mainAxisSpacing: isMobile ? 10 : 20,
    //         childAspectRatio: isDesktop
    //             ? 0.75
    //             : isTablet
    //                 ? .80
    //                 : 1,
    //       ),
    //       itemBuilder: (context, index) {
    //         final item = serviceList[index];
    //         return ServiceItem(
    //           name: 'View More',
    //           service: ,
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}

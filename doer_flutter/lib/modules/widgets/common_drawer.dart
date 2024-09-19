import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/constants/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonDrawer extends StatelessWidget {
  CommonDrawer({super.key});
  final List<Map<String, String>> menu = [
    {"name": 'Home', "destination": '/', "icon": "home.png"},
    {"name": 'About', "destination": aboutScreen, "icon": "about.png"},
    {
      "name": 'Services',
      "destination": serviceScreen,
      "icon": "customer-service.png"
    },
    {"name": 'Contact', "destination": contactScreen, "icon": "contact.png"},
  ];
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                for (var item in menu)
                  Center(
                    child: ListTile(
                        onTap: () {
                          context.go(item['destination'].toString());
                        },
                        mouseCursor: WidgetStateMouseCursor.clickable,
                        leading: Image.asset(
                          "assets/icons/${item['icon']}",
                          width: 25,
                          height: 25,
                          color: isDarkMode
                              ? WebAppColors.white
                              : WebAppColors.black,
                        ),
                        title: Text(
                            style: const TextStyle(fontSize: 12),
                            item['name'].toString())),
                  )
              ],
            ),
          ],
        ));
  }
}

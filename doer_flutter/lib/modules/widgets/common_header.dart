import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/constants/route_path.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CommonHeader extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  const CommonHeader({
    super.key,
    this.height = 50,
  });

  @override
  State<CommonHeader> createState() => _CommonHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CommonHeaderState extends State<CommonHeader> {
  bool isSelected = false;

  List<Map<String, String>> menu = [
    {"name": 'Home', "destination": homeScreen},
    {"name": 'About', "destination": aboutScreen},
    {"name": 'Services', "destination": serviceScreen},
    {"name": 'Contact', "destination": contactScreen},
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      context.go(homeScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                              width: 25, height: 25, "assets/icons/logo.png"),
                          const Gap(10),
                          const Text(
                            "DOER 20s",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                Row(
                  children: [
                    isMobile
                        ? IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: isDarkMode
                                  ? WebAppColors.white
                                  : WebAppColors.black,
                            ))
                        : Row(
                            children: [
                              for (var menuItem in menu)
                                TextButton(
                                  onHover: (value) {},
                                  onPressed: () {
                                    context.goNamed(menuItem['destination']!);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        style: TextStyle(
                                            fontSize: isMobile ? 12 : 12,
                                            color: GoRouter.of(context)
                                                        .routerDelegate
                                                        .currentConfiguration
                                                        .fullPath ==
                                                    menuItem['destination']
                                                ? WebAppColors.primary
                                                : isDarkMode
                                                    ? WebAppColors.white
                                                    : WebAppColors.black),
                                        menuItem['name']!,
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

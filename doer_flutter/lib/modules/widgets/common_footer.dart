import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/constants/route_path.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CommonFooter extends StatelessWidget {
  const CommonFooter({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> footerLinks = ["Privacy", "Terms of use", "Trademarks"];
    bool isMobile = ResponsiveLayout.isMobile(context);
    return Container(
      decoration: const BoxDecoration(color: WebAppColors.lightGrey),
      height: isMobile ? 500 : 300,
      child: Column(
        children: [
          Flexible(
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: const [
                AboutSection(),
                LinkSection(),
                GetInTouchSection(),
              ],
            ),
          ),
          Container(
            height: 50,
            color: WebAppColors.lightGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "© Doer 20s 2024",
                    style: TextStyle(
                      color: WebAppColors.grey,
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: [
                      for (var links in footerLinks)
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(2),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              links,
                              style: const TextStyle(
                                color: WebAppColors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child:
                  Image.asset(height: 75, width: 75, "assets/icons/logo.png")),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                textAlign: TextAlign.center,
                'DOER 20s',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: 15,
                height: 15,
                color: isDarkMode ? WebAppColors.white : WebAppColors.grey,
                "assets/icons/facebook.png",
              ),
              const Gap(20),
              Image.asset(
                color: isDarkMode ? WebAppColors.white : WebAppColors.grey,
                width: 15,
                height: 15,
                "assets/icons/instagram.png",
              ),
              const Gap(20),
              Image.asset(
                  color: isDarkMode ? WebAppColors.white : WebAppColors.grey,
                  width: 15,
                  height: 15,
                  "assets/icons/youtube.png"),
            ],
          ),
        ],
      ),
    );
  }
}

class LinkSection extends StatelessWidget {
  const LinkSection({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> menu = [
      {"name": 'Home', "destination": homeScreen},
      {"name": 'About', "destination": aboutScreen},
      {"name": 'Services', "destination": serviceScreen},
      {"name": 'Contact', "destination": contactScreen},
    ];

    List<String> services = [
      "Web",
      "Android",
      "IOS",
      "Desktop",
    ];

    // bool isMobile = ResponsiveLayout.isMobile(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Services',
                          style: TextStyle(
                              color: WebAppColors.darkGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        for (var service in services)
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(2),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                service,
                                style: const TextStyle(
                                  color: WebAppColors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Quick Links',
                          style: TextStyle(
                              color: WebAppColors.darkGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        for (var links in menu)
                          InkWell(
                            borderRadius: BorderRadius.circular(2),
                            onTap: () {
                              context.go(links['destination']!);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                links['name'].toString(),
                                style: const TextStyle(
                                  color: WebAppColors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isMobile = ResponsiveLayout.isMobile(context);
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/location2.png",
              width: 20,
              height: 20,
              color: WebAppColors.darkGrey,
            ),
            const Gap(10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get In Touch',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: WebAppColors.darkGrey),
                ),
                Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'First Floor VKK Building',
                        style:
                            TextStyle(fontSize: 12, color: WebAppColors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Ollur, Thrissur",
                        style:
                            TextStyle(fontSize: 12, color: WebAppColors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Kerala 680306",
                        style:
                            TextStyle(fontSize: 12, color: WebAppColors.grey),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

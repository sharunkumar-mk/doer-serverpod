import 'package:doer_flutter/data/data.dart';
import 'package:doer_flutter/modules/widgets/common_drawer.dart';
import 'package:doer_flutter/modules/widgets/common_footer.dart';
import 'package:doer_flutter/modules/widgets/common_header.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../constants/route_path.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  onButtonPressed() {
    context.pushNamed(companyDetailsScreen);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isTablet = ResponsiveLayout.isTablet(context);

    return Scaffold(
      endDrawer: CommonDrawer(),
      appBar: const CommonHeader(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
              child: Column(
                children: [
                  isMobile || isTablet
                      ? Column(
                          children: [
                            const Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset("assets/images/about.png"),
                            const AboutSection()
                          ],
                        )
                      : Row(
                          children: [
                            const Expanded(
                                child: Column(
                              children: [
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AboutSection(),
                              ],
                            )),
                            Expanded(
                                child: Image.asset("assets/images/about.png")),
                          ],
                        ),
                  const Gap(10),
                ],
              ),
            ),
            const CommonFooter()
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var about in aboutUs)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                about.heading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              about.subHeading != null
                  ? Text(about.subHeading!)
                  : const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var des in about.description)
                    Column(
                      children: [
                        Text(
                          des,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Gap(5)
                      ],
                    ),
                ],
              ),
              const Gap(30)
            ],
          )
      ],
    );
  }
}

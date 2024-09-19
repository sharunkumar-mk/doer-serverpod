import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/data/data.dart';
import 'package:doer_flutter/modules/widgets/common_drawer.dart';
import 'package:doer_flutter/modules/widgets/common_footer.dart';
import 'package:doer_flutter/modules/widgets/common_header.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:doer_flutter/utils/helpers/common_helpers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompanyDetailsPage extends StatefulWidget {
  const CompanyDetailsPage({super.key, this.company});
  final String? company;

  @override
  State<CompanyDetailsPage> createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  Company? companyDetails;
  @override
  void initState() {
    fetchCompanyDetails(companyName: widget.company);
    super.initState();
  }

  fetchCompanyDetails({String? companyName}) {
    for (var company in otherCompanies) {
      if (company.name == companyName) {
        companyDetails = company;
      }
    }
  }

  onButtonPressed({required String type}) {
    if (type == 'EMAIL') {}
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);

    final address = companyDetails!.address.split(',');

    return Scaffold(
      endDrawer: CommonDrawer(),
      appBar: const CommonHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            companyDetails == null
                ? const Text('No company found')
                : isMobile
                    ? Column(
                        children: [
                          CompanyLogo(companyDetails: companyDetails),
                          const Gap(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CompanyDetails(
                                address: address,
                                companyDetails: companyDetails),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: CompanyLogo(companyDetails: companyDetails),
                          ),
                          Expanded(
                              child: CompanyDetails(
                            address: address,
                            companyDetails: companyDetails,
                          )),
                        ],
                      ),
            const Gap(20),
            const CommonFooter()
          ],
        ),
      ),
    );
  }
}

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    super.key,
    required this.companyDetails,
  });

  final Company? companyDetails;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
              width: 200,
              height: 200,
              color: isDarkMode ? WebAppColors.white : null,
              "assets/images/${companyDetails!.logo}"),
        ),
        const Gap(20),
        Text(
          companyDetails!.name,
          style: TextStyle(
            fontSize: isMobile ? 25 : 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({
    super.key,
    required this.address,
    required this.companyDetails,
  });

  final List<String> address;
  final Company? companyDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/location.png",
              width: 30,
              height: 30,
              color: WebAppColors.primary,
            ),
            const Gap(10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var item in address)
                    Text(
                      item,
                      style: const TextStyle(fontSize: 20),
                    )
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
        Row(
          children: [
            Image.asset(
              "assets/icons/email.png",
              width: 30,
              height: 30,
              color: WebAppColors.primary,
            ),
            const Gap(10),
            Tooltip(
              message: 'Click to send email',
              child: InkWell(
                onTap: () {
                  sendEmail(email: companyDetails!.email);
                },
                child: Text(
                  companyDetails!.email.toLowerCase(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        const Gap(20),
        Row(
          children: [
            Image.asset(
              "assets/icons/phone-call.png",
              width: 30,
              height: 30,
              color: WebAppColors.primary,
            ),
            const Gap(10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var number in companyDetails!.phone)
                    Row(
                      children: [
                        Text(
                          number,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

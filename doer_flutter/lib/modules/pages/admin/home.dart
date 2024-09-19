import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/modules/pages/admin/tabs/dashboard.dart';
import 'package:doer_flutter/modules/pages/admin/tabs/services.dart';
import 'package:doer_flutter/modules/pages/admin/tabs/settings.dart';
import 'package:doer_flutter/modules/pages/admin/tabs/users.dart';
import 'package:doer_flutter/modules/widgets/common_alert.dart';
import 'package:doer_flutter/modules/widgets/common_navigation_rail.dart';
import 'package:doer_flutter/providers/provider.dart';
import 'package:doer_flutter/providers/theme_provider.dart';
import 'package:doer_flutter/utils/helpers/common_helpers.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/common_bottom_navigation.dart';

class AdminHomePage extends ConsumerStatefulWidget {
  const AdminHomePage({
    super.key,
  });

  @override
  AdminHomePageState createState() => AdminHomePageState();
}

class AdminHomePageState extends ConsumerState<AdminHomePage>
    with SingleTickerProviderStateMixin {
  late final tabController =
      TabController(length: widgetOptions.length, vsync: this);
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  int selectedIndex = 0;
  bool isExtended = true;

  onThemeChange(bool value) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  List<Widget> widgetOptions = [
    const DashboardPage(),
    const ServicesPage(),
    const UsersPage(),
    const SettingsPage()
  ];

  List<NavigationItem> navigationItems = [
    NavigationItem(name: "Dashboard", icon: "assets/icons/dashboard.png"),
    NavigationItem(name: "Services", icon: "assets/icons/services.png"),
    NavigationItem(name: "Users", icon: "assets/icons/users.png"),
    NavigationItem(name: "Settings", icon: "assets/icons/settings.png"),
  ];

  bool isLogged = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ResponseState>(loginNotifierProvider,
        (ResponseState? previous, ResponseState next) async {
      if (next.isLoading!) {
        showProgress(context);
      } else if (next.isError!) {
        context.pop();
        showMessage(context, next.errorMessage!);
      } else {
        context.pop();
        setState(() {
          showMessage(context, 'Logout');
          context.go('/login');
        });
      }
    });

    {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: WebAppColors.white,
          title: Image.asset(
            "assets/icons/logo.png",
            width: 25,
            height: 25,
          ),
          automaticallyImplyLeading: false,
          actions: [
            Row(
              children: [
                const Gap(5),
                // Text(
                //   style: TextStyle(color: WebAppColors.black),
                //   sessionManager.signedInUser!.userName!,
                // ),
                const CircleAvatar(
                  foregroundImage: AssetImage("assets/icons/man.png"),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (conetx) {
                            return CommonAlertDialog(
                                title: 'Log out',
                                content: 'You will be return to login screen',
                                onButttonPressed: () {
                                  ref
                                      .read(loginNotifierProvider.notifier)
                                      .logout();
                                });
                          });
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
        body: CommonNavigationRail(
          isExtended: isExtended,
          widgetOptions: widgetOptions,
          navItems: navigationItems,
          tabController: tabController,
        ),
      );
    }
  }
}

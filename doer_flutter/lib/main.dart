import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/config/routes.dart';
import 'package:doer_flutter/firebase_options.dart';
import 'package:doer_flutter/providers/theme_provider.dart';
import 'package:doer_flutter/utils/helpers/common_helpers.dart';
import 'package:doer_flutter/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

late SessionManager sessionManager;
late Client client;

void main() async {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  const ipAddress = 'localhost';

  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
  } catch (e) {
    showLog(e.toString());
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarktheme = ref.watch(themeNotifierProvider);
    final appTheme = AppTheme();
    return MaterialApp.router(
      theme: appTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Doer 20s',
      routerConfig: Routes().router,
    );
  }
}

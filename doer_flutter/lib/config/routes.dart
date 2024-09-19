import 'package:doer_flutter/constants/route_path.dart';
import 'package:doer_flutter/constants/secure_storage_path.dart';
import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/modules/pages/about.dart';
import 'package:doer_flutter/modules/pages/admin/home.dart';
import 'package:doer_flutter/modules/pages/admin/login.dart';
import 'package:doer_flutter/modules/pages/company_details.dart';
import 'package:doer_flutter/modules/pages/contact.dart';
import 'package:doer_flutter/modules/pages/home.dart';
import 'package:doer_flutter/modules/pages/services.dart';
import 'package:doer_flutter/modules/pages/single_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lottie/lottie.dart';

// class AuthService {
//   Future<bool> verifyToken() async {
//     const secureStorage = FlutterSecureStorage();
//     final token = await secureStorage.read(key: SecureStoragePath.userToken);
//     if (token != null) {
//       bool isExpired = JwtDecoder.isExpired(token);
//       if (isExpired) {
//         return false;
//       } else {
//         return true;
//       }
//     }
//     return false;
//   }
// }

class Routes {
  GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: homeScreen,
        path: homeScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: loginScreen,
        path: loginScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const AdminLoginPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
        redirect: (context, state) async {
          if (sessionManager.isSignedIn) {
            return adminHomeScreen;
          }
          return null;
        },
      ),
      GoRoute(
        name: adminHomeScreen,
        path: adminHomeScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const AdminHomePage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
        redirect: (context, state) async {
          if (sessionManager.isSignedIn) {
            return adminHomeScreen;
          }
          return loginScreen;
        },
      ),
      GoRoute(
        name: aboutScreen,
        path: aboutScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const AboutPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: serviceScreen,
        path: serviceScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const ServicesPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: contactScreen,
        path: contactScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const ContactPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: singleServiceScreen,
        path: '$singleServiceScreen/:serviceName',
        pageBuilder: (context, state) {
          final serviceName = state.pathParameters['serviceName'];
          return CustomTransitionPage(
              key: state.pageKey,
              child: SingleServicePage(
                serviceName: serviceName,
              ),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeInOut,
                  ).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: companyDetailsScreen,
        path: '$companyDetailsScreen/:companyName',
        pageBuilder: (context, state) {
          final companyName = state.pathParameters['companyName'];
          return CustomTransitionPage(
              key: state.pageKey,
              child: CompanyDetailsPage(
                company: companyName,
              ),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeInOut,
                  ).animate(animation),
                  child: child,
                );
              });
        },
      ),
    ],
    errorBuilder: (context, statE) {
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
                width: 200, height: 200, 'assets/animations/404.json'),
            const Text(
              'Page not found',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ));
    },
  );
}

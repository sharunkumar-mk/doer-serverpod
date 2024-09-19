import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final navigatorKey = GlobalKey<NavigatorState>();

const TextStyle titleLabelStyle = TextStyle(
  color: Colors.black87,
  fontSize: 14,
  fontWeight: FontWeight.w900,
);

showLog(String message) {
  debugPrint(message);
}

showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 300,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Future<void> showProgress(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CupertinoActivityIndicator(
            radius: 10,
          ),
        );
      });
}

showUnAuthorisedPopUp() {
  showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: const Text("Session Expired"),
            content: const Text("Please Log In again"),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          )).then((value) async {});
}

DateTime getDateTimeFromString({required String stringDate}) {
  String date = stringDate.substring(0, 8);
  return DateTime.parse(date);
}

String getDateStringFromListOfInt(List<int> dateList) {
  String dateString = dateList[0].toString() +
      dateList[1].toString().padLeft(2, '0') +
      dateList[2].toString().padLeft(2, '0');
  return dateString;
}

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter an email address';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  }
  if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$').hasMatch(value)) {
    return 'Password does not meet the requirements';
  }
  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a phone number';
  }
  if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? emptyValidator(
  String? value, {
  String errorMessage = 'Field cannot be empty',
}) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }
  return null;
}

//lauch url common functions

void launchURL({required String url}) async {
  if (await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}

void makePhoneCall({required String phoneNumber}) async {
  final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await launchUrl(Uri.parse(phoneUri.toString()))) {
    throw 'Could not phone';
  }
}

void sendEmail({required String email}) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=Project',
  );
  if (await launchUrl(Uri.parse(params.toString()))) {
    throw 'Could not launch';
  }
}

onChanged: (newValue) async {
 if (newValue == 'English') {
     await context.setLocale(Locale('en'));
 } else if (newValue == 'Français') {
     await context.setLocale(Locale('fr'));
 } else if (newValue == 'العربية') {
     await context.setLocale(Locale('ar'));
 }
},


Main.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sg_user_dash/screens/homescreen.dart';
import 'package:sg_user_dash/screens/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

Future<String> nextdisplay() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool _seen = (prefs.getBool('seen') ?? false);

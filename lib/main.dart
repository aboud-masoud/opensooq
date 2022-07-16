import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_sooq/app.dart';
import 'package:open_sooq/utils/hive_constant.dart';
import 'package:open_sooq/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: Exeptions
// TODO: Localization

// TODO : Save Selected Language + Country Secure storage
// TODO Profile Page

void main() async {
  logInformationMessage("Application Started ... ");
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  await Hive.openBox(DatabaseBoxConstant.storage);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

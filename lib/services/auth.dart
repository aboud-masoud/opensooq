import 'package:device_info_plus/device_info_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_sooq/models/http_models/auth_debug_request.dart';
import 'package:open_sooq/models/http_models/auth_debug_response.dart';
import 'package:open_sooq/utils/hive_constant.dart';
import 'package:open_sooq/utils/logger.dart';
import 'package:open_sooq/utils/repository/http_repository.dart';
import 'dart:io' show Platform;

import 'package:package_info_plus/package_info_plus.dart';

class AuthService {
  Future<AuthDebugResponse> authDebug({required String mobileNumber}) async {
    final myBox = Hive.box(DatabaseBoxConstant.storage);

    final countryId = myBox.get(DatabaseFieldConstant.countryId);

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    String osVersion = "";
    String deviceTypeName = "";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion = androidInfo.version.release!;
      deviceTypeName = androidInfo.model!;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      osVersion = iosInfo.systemVersion!;
      deviceTypeName = iosInfo.model!;
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final body = AuthDebugRequest(
        mobileNumber: "0$mobileNumber",
        osType: Platform.isAndroid ? "android" : "iOS",
        deviceTypeName: deviceTypeName,
        osVersion: osVersion,
        appVersion: packageInfo.version,
        countryId: int.parse(countryId));

    final response = await HttpRepository().callRequest(
        requestType: RequestType.post,
        methodName: "auth-debug/",
        postBody: body.toJson());

    return AuthDebugResponse.fromJson(response);
  }

  Future<VerifyOTPresponse> verifyOTP(
      {required String mobileNumber,
      required String otp,
      required String apiKey,
      required int userId}) async {
    final myBox = Hive.box(DatabaseBoxConstant.storage);

    final countryId = myBox.get(DatabaseFieldConstant.countryId);

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    String osVersion = "";
    String deviceTypeName = "";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion = androidInfo.version.release!;
      deviceTypeName = androidInfo.model!;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      osVersion = iosInfo.systemVersion!;
      deviceTypeName = iosInfo.model!;
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final body = VerifyOTPrequest(
        mobileNumber: "0$mobileNumber",
        osType: Platform.isAndroid ? "android" : "iOS",
        deviceTypeName: deviceTypeName,
        osVersion: osVersion,
        appVersion: packageInfo.version,
        countryId: int.parse(countryId),
        otp: otp,
        apiKey: apiKey,
        userId: userId);

    final response = await HttpRepository().callRequest(
        requestType: RequestType.post,
        methodName: "auth-verify/",
        postBody: body.toJson());
    return VerifyOTPresponse.fromJson(response);
  }
}

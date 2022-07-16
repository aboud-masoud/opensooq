import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6926605739135178/6553907626';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}

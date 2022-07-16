import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_sooq/utils/hive_constant.dart';

class SharedMethods {
  bool checkIfUserIsLogedIn() {
    final myBox = Hive.box(DatabaseBoxConstant.storage);
    if (myBox.get(DatabaseFieldConstant.isUserLoggedIn) == null ||
        myBox.get(DatabaseFieldConstant.isUserLoggedIn) == false) {
      return false;
    } else {
      return true;
    }
  }
}

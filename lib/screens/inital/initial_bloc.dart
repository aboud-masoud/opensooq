import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_sooq/app.dart';
import 'package:open_sooq/models/http_models/countries_response.dart';
import 'package:open_sooq/services/filter.dart';
import 'package:open_sooq/utils/repository/http_repository.dart';

class InitialBloc {
  var languageSelectedIndex = 0.obs;

  ValueNotifier<List<Countries>?> listOfCountriesNotifier =
      ValueNotifier<List<Countries>?>(null);

  void getListOfCountries() {
    FilterService().getCountries().then((value) {
      listOfCountriesNotifier.value = value;
    });
  }

  void refreshAppWithLanguageCode(BuildContext context, String code) {
    selectedLanguage = code;
    listOfCountriesNotifier.value = null;
    MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: code));
    getListOfCountries();
  }
}

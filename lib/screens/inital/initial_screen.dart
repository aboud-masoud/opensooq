import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_sooq/models/http_models/countries_response.dart';
import 'package:open_sooq/screens/inital/initial_bloc.dart';
import 'package:open_sooq/screens/inital/widgets/change_language.dart';
import 'package:open_sooq/screens/inital/widgets/list_of_countries.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final _bloc = InitialBloc();

  @override
  void initState() {
    _bloc.getListOfCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 223, 226),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Obx(
                () => Center(
                  child: InitialChangeLanguage(
                      languageSelectedIndex: _bloc.languageSelectedIndex.value,
                      valueChanged: (value) {
                        _bloc.languageSelectedIndex.value = value;
                        _bloc.refreshAppWithLanguageCode(context,
                            value == 0 ? "en" : (value == 1 ? "tr" : "ar"));
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomText(
                  title:
                      AppLocalizations.of(context)!.login_header_select_country,
                  fontSize: 22,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ValueListenableBuilder<List<Countries>?>(
                  valueListenable: _bloc.listOfCountriesNotifier,
                  builder: (context, snapshot, child) {
                    return ListOfCountries(
                        listOfCountries: snapshot,
                        selectedLanguage: _bloc.languageSelectedIndex.value == 0
                            ? "en"
                            : "ar");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

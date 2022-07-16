import 'package:open_sooq/models/http_models/countries_response.dart';
import 'package:open_sooq/utils/logger.dart';
import 'package:open_sooq/utils/repository/http_repository.dart';

class FilterService {
  Future<List<Countries>> getCountries() async {
    final response = await HttpRepository()
        .callRequest(requestType: RequestType.get, methodName: "countries");
    List<Countries> xx = [];
    try {
      xx = CountriesResponse.fromJson(response).data!;
    } catch (e) {
      logger.wtf(response["detail"]["message"]);
    }

    return xx;
  }
}

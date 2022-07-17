import 'package:open_sooq/models/http_models/auth_debug_response.dart';
import 'package:open_sooq/services/auth.dart';

class LoginSecoundStepBloc {
  Future<AuthDebugResponse> callRequest({required String mobileNumber}) async {
    return await AuthService().authDebug(mobileNumber: mobileNumber);
  }

  Future<VerifyOTPresponse> callverifyrequset(
      {required String mobileNumber,
      required String otp,
      required String apiKey,
      required int userId}) async {
    return await AuthService().verifyOTP(
        mobileNumber: mobileNumber, otp: otp, apiKey: apiKey, userId: userId);
  }
}

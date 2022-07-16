class AuthDebugRequest {
  String mobileNumber;
  String osType;
  String deviceTypeName;
  String osVersion;
  String appVersion;
  int countryId;

  AuthDebugRequest(
      {required this.mobileNumber,
      required this.osType,
      required this.deviceTypeName,
      required this.osVersion,
      required this.appVersion,
      required this.countryId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['os_type'] = this.osType;
    data['device_type_name'] = this.deviceTypeName;
    data['os_version'] = this.osVersion;
    data['app_version'] = this.appVersion;
    data['country_id'] = this.countryId;
    return data;
  }
}

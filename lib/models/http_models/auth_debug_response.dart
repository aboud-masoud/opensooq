class AuthDebugResponse {
  AuthDebugResponseData? data;
  String? message;
  String? requestId;

  AuthDebugResponse({this.data, this.message, this.requestId});

  AuthDebugResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? AuthDebugResponseData.fromJson(json['data'])
        : null;
    message = json['message'];
    requestId = json['request_id'];
  }
}

class AuthDebugResponseData {
  int? id;
  String? apiKey;
  bool? blocked;
  Null? firstName;
  Null? lastName;
  
  String? lastOtp;

  AuthDebugResponseData(
      {this.id,
      this.apiKey,
      this.blocked,
      this.firstName,
      this.lastName,
      this.lastOtp});

  AuthDebugResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiKey = json['api_key'];
    blocked = json['blocked'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    lastOtp = json['last_otp'];
  }
}

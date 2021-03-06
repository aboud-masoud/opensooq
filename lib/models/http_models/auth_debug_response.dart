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

class VerifyOTPresponse {
  Data? data;
  String? message;

  VerifyOTPresponse({this.data, this.message});

  VerifyOTPresponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  String? tokenType;

  Data({this.token, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class CountriesResponse {
  List<Countries>? data;
  String? message;

  CountriesResponse({this.data, this.message});

  CountriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Countries>[];
      json['data'].forEach((v) {
        data!.add(Countries.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Countries {
  int? id;
  String? flagImage;
  String? name;
  String? currency;
  String? prefixNumber;

  Countries(
      {this.id, this.flagImage, this.name, this.currency, this.prefixNumber});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flagImage = json['flag_image'];
    name = json['name'];
    currency = json['currency'];
    prefixNumber = json['prefix_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['flag_image'] = this.flagImage;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['prefix_number'] = this.prefixNumber;
    return data;
  }
}

class Response {
  String? id;
  String? name;
  String? phone;
  String? age;
  String? place;
  String? address;
  String? createdAt;
  String? updatedAt;

  Response(
      {this.id,
      this.name,
      this.phone,
      this.age,
      this.place,
      this.address,
      this.createdAt,
      this.updatedAt});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    age = json['age'];
    place = json['place'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['age'] = age;
    data['place'] = place;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Root {
  List<Response?>? response;

  Root({this.response});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['response'] =
        response != null ? response!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

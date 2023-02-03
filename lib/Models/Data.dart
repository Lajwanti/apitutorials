import 'Images.dart';
import 'Products.dart';

class Data {
  Data({
      required this.id,
      required this.isActive,
      required this.createdAt,
      required this.name,
      required this.description,
      required this.shopemail,
      required this.shopaddress,
      required this.shopcity,
      required this.userid,
      required this.images,

      required this.v,
      required this.products,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    images = json['images'];
    v = json['__v'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
  String? id;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  List<Images>? images;
  int? v;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['is_active'] = isActive;
    map['created_at'] = createdAt;
    map['name'] = name;
    map['description'] = description;
    map['shopemail'] = shopemail;
    map['shopaddress'] = shopaddress;
    map['shopcity'] = shopcity;
    map['userid'] = userid;
    map['images'] = images;
    map['__v'] = v;
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
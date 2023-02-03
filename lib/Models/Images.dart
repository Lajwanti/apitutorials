class Images {
  Images({
     required this.id,
      required this.filename,
      required this.url,});

  Images.fromJson(dynamic json) {
    id = json['_id'];
    filename = json['filename'];
    url = json['url'];
  }
  String? id;
  String? filename;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['filename'] = filename;
    map['url'] = url;
    return map;
  }

}
class TreeModel {
  TreeModel({
    this.id,
    this.name,
    this.displayName,
    this.digits,
    this.category,
    // this.alliases,
    this.latestAllias,
  });

  TreeModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    digits = json['digits'];
    category = json['category'];
    // if (json['alliases'] != null) {
    //   alliases = [];
    //   json['alliases'].forEach((v) {
    //     alliases?.add(Dynamic.fromJson(v));
    //   });
    // }
    latestAllias = json['latestAllias'];
  }
  int? id;
  String? name;
  dynamic displayName;
  int? digits;
  String? category;
  // List<dynamic>? alliases;
  dynamic latestAllias;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['displayName'] = displayName;
    map['digits'] = digits;
    map['category'] = category;
    // if (alliases != null) {
    //   map['alliases'] = alliases?.map((v) => v.toJson()).toList();
    // }
    map['latestAllias'] = latestAllias;
    return map;
  }
}

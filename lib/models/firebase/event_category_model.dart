class EventCategoryModel {
  String? name;
  String? uid;

  EventCategoryModel({this.name, this.uid});

  EventCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uid'] = uid;
    return data;
  }
}

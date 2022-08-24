import 'package:cloud_firestore/cloud_firestore.dart';

class EventsModel {
  String? about;
  Timestamp? eventDate;
  String? imagePath;
  String? location;
  String? organizerUid;
  String? title;

  EventsModel(
      {this.about,
        this.eventDate,
        this.imagePath,
        this.location,
        this.organizerUid,
        this.title});

  EventsModel.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    eventDate = json['event_date'];
    imagePath = json['image_path'];
    location = json['location'];
    organizerUid = json['organizer_uid'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = about;
    data['event_date'] = eventDate;
    data['image_path'] = imagePath;
    data['location'] = location;
    data['organizer_uid'] = organizerUid;
    data['title'] = title;
    return data;
  }
}

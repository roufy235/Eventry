import 'package:hive_flutter/hive_flutter.dart';

part 'user_data_hive.g.dart';

@HiveType(typeId: 1)
class UserDataHive {
  UserDataHive({this.uid, this.fullName, this.phone, this.email});
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? fullName;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? email;
}

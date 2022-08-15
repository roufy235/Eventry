// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataHiveAdapter extends TypeAdapter<UserDataHive> {
  @override
  final int typeId = 1;

  @override
  UserDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataHive(
      uid: fields[0] as String?,
      fullName: fields[1] as String?,
      phone: fields[2] as String?,
      email: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

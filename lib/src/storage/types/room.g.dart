// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomAdapter extends TypeAdapter<Room> {
  @override
  final int typeId = 1;

  @override
  Room read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Room()
      ..id = fields[0] as String
      ..roomName = fields[1] as String
      ..members = (fields[2] as List).cast<User>()
      ..avatar = fields[3] as String
      ..owner = fields[4] as String
      ..hidden = fields[5] as bool
      ..created = fields[6] as DateTime
      ..modified = fields[7] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Room obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.roomName)
      ..writeByte(2)
      ..write(obj.members)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.owner)
      ..writeByte(5)
      ..write(obj.hidden)
      ..writeByte(6)
      ..write(obj.created)
      ..writeByte(7)
      ..write(obj.modified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 1;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message()
      ..id = fields[0] as String
      ..from = fields[1] as String
      ..body = fields[2] as String
      ..forward = fields[3] as String
      ..reply = fields[4] as String
      ..mediaUrl = fields[5] as String
      ..created = fields[6] as DateTime
      ..modified = fields[7] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.forward)
      ..writeByte(4)
      ..write(obj.reply)
      ..writeByte(5)
      ..write(obj.mediaUrl)
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
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

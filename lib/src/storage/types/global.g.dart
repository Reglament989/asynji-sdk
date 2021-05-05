// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalAdapter extends TypeAdapter<Global> {
  @override
  final int typeId = 4;

  @override
  Global read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Global()
      ..token = fields[0] == null ? true : fields[0] as String
      ..refresh_token = fields[1] == null ? true : fields[1] as String
      ..isAuthenticated = fields[2] == null ? true : fields[2] as bool
      ..serverUri = fields[3] == null ? true : fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Global obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.refresh_token)
      ..writeByte(2)
      ..write(obj.isAuthenticated)
      ..writeByte(3)
      ..write(obj.serverUri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

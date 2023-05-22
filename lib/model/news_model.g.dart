// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class newsAdapter extends TypeAdapter<news> {
  @override
  final int typeId = 1;

  @override
  news read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return news(
      futureWidget: fields[8] as String,
      imageUrl: fields[0] == null ? 'aa' : fields[0] as String,
      title: fields[1] == null ? 'aa' : fields[1] as String,
      category: fields[3] == null ? 'aa' : fields[3] as String,
      subtitle: fields[2] == null ? 'aa' : fields[2] as String,
      text: fields[6] == null ? 'aa' : fields[6] as dynamic,
      time: fields[5] == null ? 'aa' : fields[5] as String,
      writer: fields[4] == null ? 'aa' : fields[4] as String,
      url: fields[7] == null ? 'aa' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, news obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.writer)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.text)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(8)
      ..write(obj.futureWidget);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is newsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

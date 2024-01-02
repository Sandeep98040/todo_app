// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'task_hive_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class TaskHiveModelAdapter extends TypeAdapter<TaskHiveModel> {
//   @override
//   final int typeId = 3;

//   @override
//   TaskHiveModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return TaskHiveModel(
//       taskId: fields[0] as String?,
//       taskName: fields[1] as String,
//       isCompleted: fields[2] as bool,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TaskHiveModel obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.taskId)
//       ..writeByte(1)
//       ..write(obj.taskName)
//       ..writeByte(2)
//       ..write(obj.isCompleted);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is TaskHiveModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

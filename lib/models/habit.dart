import 'package:isar/isar.dart';

part 'habit.g.dart';

@Collection()
class HabitModel {
  Id id = Isar.autoIncrement;

  late String name;

  List<DateTime> completedDays = [];
}

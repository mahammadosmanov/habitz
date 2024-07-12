import 'package:flutter/material.dart';
import 'package:habitz/models/app_settings.dart';
import 'package:habitz/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HabitModelSchema, AppSettingsModelSchema],
      directory: dir.path,
    );
  }

  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettingsModels.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettingsModel()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettingsModels.put(settings));
    }
  }

  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettingsModels.where().findFirst();
    return settings?.firstLaunchDate;
  }

  final List<HabitModel> currentHabits = [];

  Future<void> addHabit(String habitName) async {
    final habit = HabitModel()..name = habitName;
    await isar.writeTxn(() => isar.habitModels.put(habit));
    readHabits();
  }

  Future<void> readHabits() async {
    List<HabitModel> fetchedHabits = await isar.habitModels.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);
    notifyListeners();
  }

  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    final HabitModel? habit = await isar.habitModels.get(id);

    if (habit != null) {
      await isar.writeTxn(
        () async {
          if (isCompleted && !habit.completedDays.contains(DateTime.now())) {
            final today = DateTime.now();

            habit.completedDays.add(
              DateTime(
                today.year,
                today.month,
                today.day,
              ),
            );
          } else {
            habit.completedDays.removeWhere(
              (date) =>
                  date.year == DateTime.now().year &&
                  date.month == DateTime.now().month &&
                  date.day == DateTime.now().day,
            );
          }
        },
      );
      await isar.writeTxn(
        () async {
          await isar.habitModels.put(habit);
        },
      );
    }
  }

  Future<void> updateHabitName(int id, String newName) async {
    final HabitModel? habit = await isar.habitModels.get(id);

    if (habit != null) {
      await isar.writeTxn(
        () async {
          habit.name = newName;
        },
      );
      await isar.habitModels.put(habit);
    }

    readHabits();
  }

  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(
      () async {
        await isar.habitModels.delete(id);
      },
    );

    readHabits();
  }
}

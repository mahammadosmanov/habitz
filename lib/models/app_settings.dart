import 'package:isar/isar.dart';

part 'app_settings.g.dart';

@Collection()
class AppSettingsModel {
  Id id = Isar.autoIncrement;

  DateTime? firstLaunchDate;
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitz/constants/color.dart';
import 'package:habitz/database/habit_database.dart';
import 'package:habitz/models/habit.dart';
import 'package:habitz/widgets/custom_scroll_behavior.dart';
import 'package:habitz/widgets/habit_tile.dart';
import 'package:habitz/widgets/heat_map.dart';
import 'package:provider/provider.dart';

part "home_controller.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController c = Get.put(HomeController());
    c.readHabits(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: CustomScrollBehavior(
          child: ListView(
            children: [
              67.verticalSpace,
              _buildHeatMap(context, c),
              _buildHabitList(context, c),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.secondary,
          onPressed: () {
            c.createNewHabit(context);
          },
          child: const Icon(
            Icons.add,
            color: AppColors.tertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildHabitList(
    BuildContext context,
    HomeController c,
  ) {
    final habitDatabase = context.watch<HabitDatabase>();

    List<HabitModel> currentHabits = habitDatabase.currentHabits;
    return CustomScrollBehavior(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currentHabits.length,
        itemBuilder: (context, index) {
          final habit = currentHabits[index];

          bool isCompletedToday = c.isHabitCompletedToday(
            habit.completedDays,
          );

          return HabitTile(
            text: habit.name,
            isCompleted: isCompletedToday,
            onChanged: (value) {
              c.checkHabitOnOff(value, habit, context);
            },
            editHabit: (context) {
              c.editHabitBox(habit, context);
            },
            deleteHabit: (context) {
              c.deleteHabitBox(habit, context);
            },
          );
        },
      ),
    );
  }

  Widget _buildHeatMap(BuildContext context, HomeController c) {
    final habitDataBase = context.watch<HabitDatabase>();

    List<HabitModel> currentHabits = habitDataBase.currentHabits;

    return FutureBuilder<DateTime?>(
        future: habitDataBase.getFirstLaunchDate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHeatMap(
              startDate: snapshot.data!,
              datasets: c.prepHeatMapDataset(currentHabits),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}

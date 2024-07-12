part of "home_screen.dart";

class HomeController extends GetxController {
  final TextEditingController textController = TextEditingController();

  void createNewHabit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Enter habit name",
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              String newHabitName = textController.text;

              context.read<HabitDatabase>().addHabit(newHabitName);

              Navigator.pop(context);

              textController.clear();
            },
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              textController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void readHabits(BuildContext context) {
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
  }

  bool isHabitCompletedToday(List<DateTime> completedDays) {
    final today = DateTime.now();
    return completedDays.any(
      (date) {
        return date.year == today.year &&
            date.month == today.month &&
            date.day == today.day;
      },
    );
  }

  void checkHabitOnOff(bool? value, HabitModel habit, BuildContext context) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  void editHabitBox(
    HabitModel habit,
    BuildContext context,
  ) {
    textController.text = habit.name;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Edit habit name",
          ),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                String newHabitName = textController.text;

                context
                    .read<HabitDatabase>()
                    .updateHabitName(habit.id, newHabitName);

                Navigator.pop(context);

                textController.clear();
              },
              child: const Text("Save"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);

                textController.clear();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void deleteHabitBox(HabitModel habit, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure you want to delete?"),
          actions: [
            MaterialButton(
              onPressed: () {
                context.read<HabitDatabase>().deleteHabit(habit.id);

                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Map<DateTime, int> prepHeatMapDataset(List<HabitModel> habits) {
    Map<DateTime, int> dataset = {};

    for (var habit in habits) {
      for (var date in habit.completedDays) {
        final normalizedDate = DateTime(date.year, date.month, date.day);

        if (dataset.containsKey(normalizedDate)) {
          dataset[normalizedDate] = dataset[normalizedDate]! + 1;
        } else {
          dataset[normalizedDate] = 1;
        }
      }
    }
    return dataset;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

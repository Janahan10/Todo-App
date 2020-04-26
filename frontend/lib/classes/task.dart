
class Task {
  List<Task> tasks;
  String note;
  String repeat;
  String taskId;
  String title;
  String key;
  DateTime timeToComplete;
  DateTime deadline;
  bool completed;
  List<DateTime> reminders;

  Task(this.title, this.completed, this.key);

}
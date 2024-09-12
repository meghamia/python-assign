// date_time_utils.dart for timestamp

extension DateTimeUtils on DateTime {
  DateTime startOfDay() {
    return DateTime(this.year, this.month, this.day, 0, 0, 0, 0);
  }

  DateTime endOfDay() {
    return DateTime(this.year, this.month, this.day, 23, 59, 59, 999);
  }
}

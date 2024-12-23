class DatetimeService {
  static String getFormattedDate(String time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return "${date.day}.${date.month}.${date.year}";
  }
  static String getCurrentDateMilliseonds(){
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
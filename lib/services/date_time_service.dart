import 'package:easy_localization/easy_localization.dart';

class DateTimeService {

  static const String format1 = 'MMM dd, yyyy';


  /// Converts a [DateTime] to a string in the specified format.
  /// Example format: "yyyy-MM-dd HH:mm"
  static String formatDateTime(DateTime dateTime, String format) {
    final formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  /// Parses a string to a [DateTime] object using the specified format.
  /// Returns `null` if parsing fails.
  static DateTime? parseDateTime(String dateTimeString, String format) {
    try {
      final formatter = DateFormat(format);
      return formatter.parse(dateTimeString);
    } catch (e) {
      return null; // Handle parse failure gracefully
    }
  }

  /// Converts a [DateTime] to a human-readable relative time string.
  /// Example: "2 hours ago", "Just now"
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  /// Converts a [DateTime] object to UTC
  static String convertToUTC(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  /// Returns the current [DateTime] in UTC.
  static DateTime getCurrentUtcTime() {
    return DateTime.now().toUtc();
  }

  /// Checks if a [DateTime] is today.
  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  /// Converts a [DateTime] to the format: `Jan 01, 2025`.
  static String formatToMonthDayYear(DateTime dateTime) {
    final formatter = DateFormat(format1);
    return formatter.format(dateTime);
  }

  /// Checks if two given dates are similar
  static bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }


  ///Checks if a given date comes in date range
  static bool isDateInRange({
    required DateTime dateToCheck,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    // Ensure startDate and endDate are not the same
    if (startDate.isAtSameMomentAs(endDate)) {
      return false;
    }
    return (dateToCheck.isAfter(startDate) || dateToCheck.isAtSameMomentAs(startDate)) &&
        (dateToCheck.isBefore(endDate) || dateToCheck.isAtSameMomentAs(endDate));
  }

  ///To generate series of dates between two given dates
  static List<DateTime> getDatesBetween({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> dates = [];
    ///Starts 1 day ahead of start day
    DateTime currentDate = startDate.add(Duration(days: 1));
    /// Loop stops just before endDate
    while (currentDate.isBefore(endDate)) {
      dates.add(currentDate);
      currentDate = currentDate.add(Duration(days: 1));
    }
    return dates;
  }


  ///To generate series of dates between two given dates inclusive of end-limits
  static List<DateTime> getDatesBetweenTwoDatesWithEnds({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    List<DateTime> dates = [];
    ///Starts 1 day ahead of start day
    DateTime currentDate = startDate;
    /// Loop stops just before endDate
    while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
      dates.add(currentDate);
      currentDate = currentDate.add(Duration(days: 1));
    }
    return dates;
  }

  /// Converts an ISO 8601 formatted UTC string to the local DateTime object.
  static DateTime convertUtcToLocal(String utcString) {
    if (utcString == null || utcString.trim().isEmpty) {
      print("Error: Provided UTC string is null or empty.");
      return DateTime.now();
    }
    try {
      DateTime utcDateTime = DateTime.parse(utcString).toUtc();
      return utcDateTime.toLocal(); // Convert to device's local timezone
    } catch (e) {
      print("Error: Invalid date format - $e");
      return DateTime.now();
    }
  }

  ///DateTime received is in UTC but, we would not be converting it using
  ///timezones as we are not considering times in our app,
  /// rather solely focusing on dates
  static DateTime parseUtcDateTime(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }
}


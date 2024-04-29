// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';
import 'package:skills_pe/utility/constants.dart';

const DDMMYYYY_SLASH_FORMAT = "dd/MM/yyyy";
const YYYYMMDD_DASH_FORMAT = "yyyy-MM-dd";
const MMM_DD_YYYY_FORMAT = 'MMM dd, yyyy';
List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

bool isStartDateAfterEndDate(
    {required String startDate, required String endDate}) {
  DateTime parsedStartDate = DateFormat(DDMMYYYY_SLASH_FORMAT).parse(startDate);
  DateTime parsedEndDate = DateFormat(DDMMYYYY_SLASH_FORMAT).parse(endDate);
  return parsedStartDate.isAfter(parsedEndDate);
}

bool isStartDateBeforeCurrentDate(String inputDate) {
  try {
    DateTime startDate = DateFormat(DDMMYYYY_SLASH_FORMAT).parse(inputDate);
    DateTime currentDate = DateTime.now();
    print(currentDate);
    print(startDate);
    return startDate.isBefore(currentDate);
  } catch (e) {
    // Handle parsing error or return false if the date format is incorrect
    return false;
  }
}

String convertStringDateFormat(
    {required inputFormat, required outputFormat, required dateToBeFormatted}) {
  DateTime inputDate = DateFormat(inputFormat).parse(dateToBeFormatted);
  String formattedDate = DateFormat(outputFormat).format(inputDate);
  return formattedDate;
}

String convertServerDate(String? serverDate, String outputFormat) {
  try {
    // Parse the server date string
    DateTime dateTime = DateTime.parse(serverDate!);

    // Format the date in "MMM dd, yyyy" format
    String formattedDate = DateFormat(outputFormat).format(dateTime);

    return formattedDate;
  } catch (error) {
    return "";
  }
}

String getDateInISOFormat(String inputDate) {
  try {
    DateTime dateTime = DateTime.parse(inputDate);
    return dateTime.toIso8601String();
  } catch (e) {
    return "";
  }
}

String formatChallengeDate(String? startTime, String? endTime) {
  try {
    DateTime startDateTime = DateTime.parse(startTime!);
    DateTime endDateTime = DateTime.parse(endTime!);
    String startMonth = months[startDateTime.month - 1];
    String endMonth = months[endDateTime.month - 1];
    String formattedStartDate = '${startMonth} ${startDateTime.day}';
    String formattedEndDate =
        '${endMonth} ${endDateTime.day} ${endDateTime.year}';

    return '$formattedStartDate - $formattedEndDate';
  } catch (e) {
    return '';
  }
}

String formatQuizCardDate(String? eventTimeInSecondsString) {
  try {
    int eventTimeInSeconds = int.tryParse(eventTimeInSecondsString!) ?? 0;
    DateTime currentTime = DateTime.now();
    DateTime eventTime =
        DateTime.fromMillisecondsSinceEpoch(eventTimeInSeconds * 1000);
    Duration difference = eventTime.difference(currentTime);

    if (difference.inSeconds < 0) {
      return LIVE.toUpperCase();
    } else if (difference.inHours >= 24) {
      return 'Starts on ${DateFormat('dd MMM yy').format(eventTime)}';
    } else {
      return 'Starts in ${difference.inHours}h ${difference.inMinutes.remainder(60)}m';
    }
  } catch (e) {
    return '';
  }
}

String formatTournamentStartTime(String? startTime) {
  try {
    DateTime parsedDateTime = DateTime.parse(startTime!);
    String formattedDate = DateFormat('d MMM yyyy').format(parsedDateTime);
    String formattedTime = DateFormat('h:mma').format(parsedDateTime);
    return '$formattedDate | $formattedTime';
  } catch (e) {
    return '';
  }
}

double? convertMintuesToSeconds(double? timeInMins) {
  try {
    return timeInMins!.toInt() * 60;
  } catch (e) {
    return null;
  }
}

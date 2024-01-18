// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

const DDMMYYYY_SLASH_FORMAT = "dd/MM/yyyy";
const YYYYMMDD_DASH_FORMAT = "yyyy-MM-dd";
List<String> months = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
];

bool dateComparision({required date1, required date2}) {
  DateTime startDate = DateFormat(DDMMYYYY_SLASH_FORMAT).parse(date1);
  DateTime endDate = DateFormat(DDMMYYYY_SLASH_FORMAT).parse(date2);
  return startDate.isAfter(endDate);
}

String convertStringDateFormat(
    {required inputFormat, required outputFormat, required dateToBeFormatted}) {
  DateTime inputDate = DateFormat("dd/MM/yyyy").parse(dateToBeFormatted);
  String formattedDate = DateFormat("yyyy-MM-dd").format(inputDate);
  return formattedDate;
}

String formatChallengeDate(String startTime, String endTime) {
  DateTime startDateTime = DateTime.parse(startTime);
  DateTime endDateTime = DateTime.parse(endTime);

  String startMonth = months[startDateTime.month - 1]; // months is a list of month names
  String endMonth = months[endDateTime.month - 1];

  String formattedStartDate = '${startMonth} ${startDateTime.day}';
  String formattedEndDate = '${endMonth} ${endDateTime.day} ${endDateTime.year}';

  return '$formattedStartDate - $formattedEndDate';
}


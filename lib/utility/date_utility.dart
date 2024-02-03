// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

const DDMMYYYY_SLASH_FORMAT = "dd/MM/yyyy";
const YYYYMMDD_DASH_FORMAT = "yyyy-MM-dd";

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

String convertServerDate(String serverDate) {
  // Parse the server date string
  DateTime dateTime = DateTime.parse(serverDate);

  // Format the date in "MMM dd, yyyy" format
  String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);

  return formattedDate;
}

double? convertMintuesToSeconds(double? timeInMins) {
  try {
    return timeInMins!.toInt() * 60;
  } catch (e) {
    return null;
  }
}

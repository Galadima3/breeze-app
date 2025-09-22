import 'package:intl/intl.dart';

class ChartModel {
  final String temp;
  final String icon;
  final String timeStamp;
  late final String formattedHour; // Changed to late initialization

  ChartModel({
    required this.temp,
    required this.icon,
    required this.timeStamp,
  }) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    try {
      final parsedDate = formatter.parse(timeStamp);
      formattedHour = DateFormat("HH:mm").format(parsedDate);
    } on FormatException {
      // Handle parsing error (optional)
      formattedHour = "Invalid Time"; // Or set a default value
    }
  }
}

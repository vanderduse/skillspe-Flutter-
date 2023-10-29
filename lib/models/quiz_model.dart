// quiz_model.dart
class Quiz {
  final String title;
  final String description;
  final String startDate;
  final int participants;
  final double price;

  Quiz({
    required this.title,
    required this.description,
    required this.startDate,
    required this.participants,
    required this.price,
  });
}

class SurveyModel {
  final int id;
  final String title;
  final String description;
  final int poin;
  final String undian;
  final String startDate;
  final String endDate;
  final String dateCreated;

  SurveyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.poin,
    required this.undian,
    required this.startDate,
    required this.endDate,
    required this.dateCreated,
  });

  // Factory method to create an instance from a JSON object
  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      poin: json['poin'],
      undian: json['undian'] ?? '',
      startDate: json['start_date'],
      endDate: json['end_date'],
      dateCreated: json['date_created'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'poin': poin,
      'undian': undian,
      'start_date': startDate,
      'end_date': endDate,
      'date_created': dateCreated,
    };
  }
}

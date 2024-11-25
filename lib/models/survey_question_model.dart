class SurveyQuestionModel {
  final int id;
  final int idSurvey;
  final int nomer;
  final String pertanyaan;
  final String? a;
  final String? b;
  final String? c;
  final String? d;
  final String? e;

  SurveyQuestionModel({
    required this.id,
    required this.idSurvey,
    required this.nomer,
    required this.pertanyaan,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
  });

  // Factory method to create a SurveyQuestion from JSON
  factory SurveyQuestionModel.fromJson(Map<String, dynamic> json) {
    return SurveyQuestionModel(
      id: json['id'],
      idSurvey: json['idsurvey'],
      nomer: json['nomer'],
      pertanyaan: json['pertanyaan'],
      a: json['a'],
      b: json['b'],
      c: json['c'],
      d: json['d'],
      e: json['e'],
    );
  }

  // Method to convert a SurveyQuestion to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idsurvey': idSurvey,
      'nomer': nomer,
      'pertanyaan': pertanyaan,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'e': e,
    };
  }
}

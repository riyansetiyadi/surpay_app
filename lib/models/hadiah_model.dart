class HadiahModel {
  final int idHadiah;
  final String nama;
  final String idUser;
  final String idSurvey;
  final int poin;
  final String? undian;
  final String jam;
  final String? status;
  final String? bukti;

  HadiahModel({
    required this.idHadiah,
    required this.nama,
    required this.idUser,
    required this.idSurvey,
    required this.poin,
    this.undian,
    required this.jam,
    this.status,
    this.bukti,
  });

  // Factory method untuk membuat instance dari JSON
  factory HadiahModel.fromJson(Map<String, dynamic> json) {
    return HadiahModel(
      idHadiah: json['idhadiah'] as int,
      nama: json['nama'] as String,
      idUser: json['iduser'] as String,
      idSurvey: json['idsurvey'] as String,
      poin: json['poin'] as int,
      undian: json['undian'] as String?,
      jam: json['jam'] as String,
      status: json['status'] as String?,
      bukti: json['bukti'] as String?,
    );
  }

  // Method untuk mengonversi instance ke JSON
  Map<String, dynamic> toJson() {
    return {
      'idhadiah': idHadiah,
      'nama': nama,
      'iduser': idUser,
      'idsurvey': idSurvey,
      'poin': poin,
      'undian': undian,
      'jam': jam,
      'status': status,
      'bukti': bukti,
    };
  }
}
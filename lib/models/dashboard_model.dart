class DashboardModel {
  final String namaLengkap;
  final String ket;
  final int jumlah;
  final String hadiah;
  final String bukti;
  final String bikin;

  DashboardModel({
    required this.namaLengkap,
    required this.ket,
    required this.jumlah,
    required this.hadiah,
    required this.bukti,
    required this.bikin,
  });

  // Factory method untuk membuat DashboardModel dari JSON
  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      namaLengkap: json['nama_lengkap'],
      ket: json['ket'],
      jumlah: json['jumlah'],
      hadiah: json['hadiah'],
      bukti: json['bukti'],
      bikin: json['bikin'],
    );
  }

  // Method untuk mengonversi DashboardModel ke JSON
  Map<String, dynamic> toJson() {
    return {
      'nama_lengkap': namaLengkap,
      'ket': ket,
      'jumlah': jumlah,
      'hadiah': hadiah,
      'bukti': bukti,
      'bikin': bikin,
    };
  }
}

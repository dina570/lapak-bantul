class UserModel {
  final String uid;
  final String namaLengkap;
  final String email;
  final String nik;
  final String alamat;

  UserModel({
    required this.uid,
    required this.namaLengkap,
    required this.email,
    required this.nik,
    required this.alamat,
  });

  // Fungsi untuk mengubah data dari format JSON (Firebase/API) menjadi Object Flutter
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      namaLengkap: json['namaLengkap'] ?? '',
      email: json['email'] ?? '',
      nik: json['nik'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }

  // Fungsi untuk mengubah data Object Flutter menjadi format JSON saat dikirim ke database
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'namaLengkap': namaLengkap,
      'email': email,
      'nik': nik,
      'alamat': alamat,
    };
  }
}
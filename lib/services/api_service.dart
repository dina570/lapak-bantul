class ApiService {
  Future<bool> checkConnection() async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // Mock status koneksi server daerah
  }
}
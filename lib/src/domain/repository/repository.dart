abstract interface class IRepository {
  Future<bool> login({required String user, required String pass});
  bool isValidEmail(String email);
}

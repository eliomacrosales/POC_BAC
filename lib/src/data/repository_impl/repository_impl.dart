import 'package:bac_poc_bloc/src/domain/repository/repository.dart';

class RepositoryImpl implements IRepository {
  @override
  Future<bool> login({required String user, required String pass}) async {
    await Future.delayed(const Duration(seconds: 3));
    if(pass != '12345'){
      return false;
    }
    else{
      return true;
    }
  }
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._]+@globant\.com$',
      caseSensitive: false,
    );
    return emailRegExp.hasMatch(email);
  }
}

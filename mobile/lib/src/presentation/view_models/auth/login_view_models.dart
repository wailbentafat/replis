import 'package:flutter/material.dart';
import 'package:mobile/src/data/repositories/auth_repo.dart';

class LoginViewModels with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();
  bool isloading=false;
  String errmsg="";
  bool get isLoading => isloading;
  String get err=>errmsg;



  Future<void> login(String email ,String password)async {
    if (email.isEmpty || password.isEmpty) {
      errmsg="Please enter email and password";
      notifyListeners();
      return;
    }
    isloading=true;
    errmsg="";
    notifyListeners();
    try {
      await authRepository.login(email, password);
      isloading=false;
      notifyListeners();
    } catch (e) {
      errmsg=e.toString();
      isloading=false;
      notifyListeners();
    }


   

  }
}
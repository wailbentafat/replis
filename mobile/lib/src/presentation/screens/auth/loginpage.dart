import 'package:flutter/material.dart';
import 'package:mobile/src/core/constant/colors.dart';
import 'package:mobile/src/core/constant/text.dart';
import 'package:mobile/src/core/transform/Navigator.dart';
import 'package:mobile/src/presentation/screens/auth/forgetpassword.dart';
import 'package:mobile/src/presentation/screens/home/home.dart';
import 'package:mobile/src/presentation/widgets/textfield.dart';
import 'package:provider/provider.dart';
import '../../view_models/auth/login_view_models.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorspick.primaryColor,
      body: Consumer<LoginViewModels>(
        builder: (context, loginViewModel, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/logo.png',
                        height: MediaQuery.of(context).size.height * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20),
                    buildTextField(
                      context: context,
                      label: texts.email,
                      controller: loginViewModel.emailController,
                      hintText: texts.emaillabel,
                      isPassword: false,
                    ),
                    SizedBox(height: 20),
                    buildTextField(
                      context: context,
                      label: texts.password,
                      controller: loginViewModel.passwordController,
                      hintText: texts.passwordlabel,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigateto(context, const Forgetpassword());
                      },
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            texts.Forgetpassword,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                    SizedBox(height: 90),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: loginViewModel.isloading
                          ? CircularProgressIndicator(
                              color: Colorspick.primaryColor)
                          : Text(
                              texts.login,
                              style: TextStyle(
                                  color: Colorspick.primaryColor, fontSize: 20),
                            ),
                      onPressed: () {
                        loginViewModel.login(
                          loginViewModel.emailController.text,
                          loginViewModel.passwordController.text,
                        );
                        if (loginViewModel.errmsg.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(loginViewModel.errmsg,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Navigateto(context, home());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("welcome",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

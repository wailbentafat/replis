import 'package:flutter/material.dart';
import 'package:mobile/src/app.dart';
import 'package:mobile/src/presentation/view_models/auth/login_view_models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModels>(
          create: (_) => LoginViewModels(),
        )
      ],
      child: const myapp(),
    ),
  );
}


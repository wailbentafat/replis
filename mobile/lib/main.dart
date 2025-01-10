import 'package:flutter/material.dart';
import 'package:mobile/src/app.dart';
import 'package:mobile/src/data/repositories/leadboard.dart';
import 'package:mobile/src/data/service/leaderboard.dart';
import 'package:mobile/src/domain/use_case/leaderboarddomain.dart';
import 'package:mobile/src/presentation/view_models/auth/leaderbaord_view.dart';
import 'package:mobile/src/presentation/view_models/auth/login_view_models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModels>(
          create: (_) => LoginViewModels(),
        ),
        ChangeNotifierProvider(
  create: (_) => LeaderbaordView(
    Leaderboarddomain(
      Leadboardrepo(Leaderboardservice()),
    ),
    ),
  ),
      ],
      child: const myapp(),
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:master_drift_provider/src/data/local/helper/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:master_drift_provider/src/routes/routes.dart';

void main() {
  runApp(Provider(
    create: (context) => ReportDatabase(),
    child: const MyApp(),
    dispose: (context, ReportDatabase db) => db.close(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

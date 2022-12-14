import 'package:flutter/material.dart';
import 'package:master_drift_provider/src/widgets/screen/screens.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/edit_user':
        return MaterialPageRoute(builder: (_) => const EditUserScreen());
      case '/qr_screen':
        return MaterialPageRoute(builder: (_) => const QRScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

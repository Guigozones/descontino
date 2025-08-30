import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/recover_screen.dart';
import 'screens/home_screen.dart';
import 'screens/plans_screen.dart';
import 'screens/partners_screen.dart';

void main() {
  runApp(const DescontinoApp());
}

class DescontinoApp extends StatelessWidget {
  const DescontinoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box Leste - Descontino',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
        '/recover': (_) => RecoverScreen(),
        '/home': (_) => HomeScreen(),
        '/plans': (_) => PlansScreen(),
        '/partners': (_) => PartnersScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text('Rota não encontrada')),
          body: Center(child: Text('Rota "${settings.name}" não encontrada.')),
        ),
      ),
    );
  }
}

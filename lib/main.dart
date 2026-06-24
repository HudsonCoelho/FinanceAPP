import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/cartoes_screen.dart';
import 'screens/parcelamento_screen.dart';
import 'screens/sobre_screen.dart';

void main() {
  runApp(const MeuProjeto());
}

class MeuProjeto extends StatelessWidget {
  const MeuProjeto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B8A3D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F5),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/cartoes': (context) => const CartoesScreen(),
        '/parcelamento': (context) => const ParcelamentoScreen(),
        '/sobre': (context) => const SobreScreen(),
      },
    );
  }
}
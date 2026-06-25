import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF093A1C), // Mantém o verde dela
      unselectedItemColor: Colors.grey,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      onTap: (index) {
        // Evita recarregar a tela se clicar na aba que já está aberta
        if (index == currentIndex) return;

        // Mapeamento das rotas baseado no clique
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/dashboard');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/cadastro');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cartoes');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/parcelamento');
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/sobre');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Lançamentos'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cartões'),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: 'Parcelamentos'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mais'),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class LancamentosScreen extends StatelessWidget {
  const LancamentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2 abas: Lista e Calendário
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),

        // --- APP BAR ---
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Lançamentos',
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add_circle, color: Color(0xFF007A33), size: 28),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
            ),
            const SizedBox(width: 8),
          ],

          // --- SELETOR LISTA / CALENDÁRIO ---
          bottom: const TabBar(
            indicatorColor: Color(0xFF007A33), // Linha verde de seleção
            indicatorWeight: 2,
            labelColor: Color(0xFF007A33),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: [
              Tab(text: 'Lista'),
              Tab(text: 'Calendário'),
            ],
          ),
        ),

        body: Column(
          children: [
            // --- FILTRO FILTRAR POR TIPO ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F0), // Fundo cinza bem clarinho do filtro
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'Todos os tipos',
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    items: const [
                      DropdownMenuItem(
                        value: 'Todos os tipos',
                        child: Text('Todos os tipos', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),

            // --- LISTA DE LANÇAMENTOS DO MÊS ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  // Cabeçalho do Mês
                  const Text(
                    "Maio de 2025",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Itens do Extrato
                  _buildLancamentoItem("Salário", "Receita", "23/05", "R\$ 4.500,00", true),
                  _buildLancamentoItem("Supermercado", "Despesa", "22/05", "- R\$ 350,00", false),
                  _buildLancamentoItem("Academia", "Despesa", "20/05", "- R\$ 120,00", false),
                  _buildLancamentoItem("Freelance", "Receita", "18/05", "R\$ 2.700,00", true),
                  _buildLancamentoItem("Alimentação", "Despesa", "17/05", "- R\$ 80,00", false),
                  _buildLancamentoItem("Transporte", "Despesa", "15/05", "- R\$ 50,00", false),
                ],
              ),
            ),

            // --- RODAPÉ FIXO DO TOTAL ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total do mês",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A)),
                  ),
                  Text(
                    "R\$ 5.000,00",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF007A33)),
                  ),
                ],
              ),
            ),
          ],
        ),

        // --- BOTTOM NAVIGATION BAR ---
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1, // Aba Lançamentos ativa
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF093A1C),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Lançamentos'),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: 'Cartões'),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: 'Parcelamentos'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mais'),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para montar cada linha de transação (Salário, mercado, etc)
  Widget _buildLancamentoItem(String title, String type, String date, String value, bool isReceita) {
    // Define a cor e o ícone baseado se é ganho ou gasto
    Color colorTheme = isReceita ? const Color(0xFF007A33) : const Color(0xFFD32F2F);
    IconData iconTheme = isReceita ? Icons.arrow_upward : Icons.shopping_basket_outlined;

    if (title == "Academia") iconTheme = Icons.fitness_center;
    if (title == "Alimentação") iconTheme = Icons.restaurant;
    if (title == "Transporte") iconTheme = Icons.directions_car_filled_outlined;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          // Ícone circular com cor de fundo suave
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorTheme.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(iconTheme, color: colorTheme, size: 20),
          ),
          const SizedBox(width: 14),

          // Título e Categoria
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A)),
                ),
                const SizedBox(height: 2),
                Text(
                  type,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),

          // Data e Valor (Alinhados na direita)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(color: Colors.grey[400], fontSize: 11),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isReceita ? const Color(0xFF007A33) : const Color(0xFFD32F2F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
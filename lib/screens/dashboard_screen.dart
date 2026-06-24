import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Fundo levemente cinza do app

      // --- APP BAR ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1A1A1A)),
          onPressed: () {},
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF1A1A1A)),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SAUDAÇÃO ---
              Row(
                children: [
                  const Text(
                    "Olá, Gabriela!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text("👋", style: TextStyle(fontSize: 20)),
                ],
              ),
              const Text(
                "Aqui está o resumo das suas finanças.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 25),

              // --- CARD SALDO ATUAL ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE0E0E0).withOpacity(0.6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Saldo Atual",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.visibility_outlined, color: Colors.grey[700], size: 20),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "R\$ 5.000,00",
                      style: TextStyle(
                        color: Color(0xFF007A33), // Verde do saldo
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Atualizado em 23/05/2025",
                      style: TextStyle(color: Colors.grey[400], fontSize: 11),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // --- SEÇÃO RESUMO ---
              const Text(
                "Resumo",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard(Icons.arrow_upward, "Receitas", "R\$ 7.200,00", Colors.green),
                  _buildSummaryCard(Icons.arrow_downward, "Despesas", "R\$ 2.200,00", Colors.red),
                  _buildSummaryCard(Icons.account_balance_wallet_outlined, "Saldo", "R\$ 5.000,00", const Color(0xFF007A33)),
                ],
              ),

              const SizedBox(height: 25),

              // --- SEÇÃO ACESSO RÁPIDO ---
              const Text(
                "Acesso rápido",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 12),

              // Grid de 2x2 para os botões de acesso rápido
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.4, // Controla a proporção/altura dos botões
                children: [
                  _buildQuickAccessButton(context, Icons.receipt_long_outlined, "Lançamentos", "/cadastro"),
                  _buildQuickAccessButton(context, Icons.credit_card_outlined, "Cartões", "/cartoes"),
                  _buildQuickAccessButton(context, Icons.all_inbox_outlined, "Parcelamentos", "/parcelamento"),
                  _buildQuickAccessButton(context, Icons.description_outlined, "Relatórios", "/sobre"),
                ],
              ),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF093A1C),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Lançamentos'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cartões'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: 'Parcelamentos'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mais'),
        ],
      ),
    );
  }

  // Widget auxiliar para os micro cards do Resumo (Receitas, Despesas, Saldo)
  Widget _buildSummaryCard(IconData icon, String title, String value, Color iconColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0).withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: iconColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para as caixas verdes de Acesso Rápido
  Widget _buildQuickAccessButton(BuildContext context, IconData icon, String label, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF093A1C), // Verde escuro da imagem
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
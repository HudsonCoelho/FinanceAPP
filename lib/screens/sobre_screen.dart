import 'package:flutter/material.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Mantendo o padrão do fundo do app

      // --- APP BAR ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Sobre o App',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // --- ILUSTRAÇÃO SIMULADA DA CARTEIRA ---
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Círculo sutil de fundo para dar profundidade
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        color: const Color(0xFF76BA43).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Ícone principal que lembra uma carteira recheada com folhas/dinheiro
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 100,
                      color: Color(0xFF093A1C), // Verde escuro da foto
                    ),
                    // Moedinha flutuante no topo
                    Positioned(
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFA000), // Cor ouro/laranja da moeda
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.attach_money, size: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // --- NOME E VERSÃO ---
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Finance', style: TextStyle(color: Color(0xFF093A1C))),
                    TextSpan(text: 'App', style: TextStyle(color: Color(0xFF76BA43))),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Versão 1.0.0",
                style: TextStyle(
                  color: Color(0xFF76BA43),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 25),

              // --- TEXTO DESCRITIVO ---
              Text(
                "O FinanceApp foi desenvolvido para ajudar você a organizar suas finanças de forma simples, prática e segura.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 35),

              // --- TÓPICOS DE FUNCIONALIDADES ---
              _buildFeatureRow(Icons.receipt_long_outlined, "Controle seus gastos"),
              _buildFeatureRow(Icons.credit_card_outlined, "Gerencie seus cartões"),
              _buildFeatureRow(Icons.pie_chart_outline, "Acompanhe seus parcelamentos"),

              const SizedBox(height: 50),

              // --- RODAPÉ (FOOTER) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Desenvolvido com ",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  const Text("💚", style: TextStyle(fontSize: 12)),
                  Text(
                    " usando Flutter",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para as linhas de features com ícones alinhados à esquerda
  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE0E0E0).withOpacity(0.5)),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF093A1C),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}
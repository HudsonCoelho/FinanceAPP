import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class ParcelamentoScreen extends StatefulWidget {
  const ParcelamentoScreen({super.key});

  @override
  State<ParcelamentoScreen> createState() => _ParcelamentoScreenState();
}

class _ParcelamentoScreenState extends State<ParcelamentoScreen> {
  String _descricao = '';
  String _valorParcela = '';
  String _quantidadeParcelas = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Mesmo fundo cinza claro padrão

      // --- APP BAR ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Parcelamentos',
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- CARD DUPLO DO TOPO ---
              Row(
                children: [
                  // Card Parcelas a vencer
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE0E0E0).withOpacity(0.6)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Parcelas a vencer',
                            style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '5',
                            style: TextStyle(color: Color(0xFF007A33), fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'R\$ 1.850,00',
                            style: TextStyle(color: Color(0xFF007A33), fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Card Valor total
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE0E0E0).withOpacity(0.6)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Valor total',
                            style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'R\$ 4.200,00',
                            style: TextStyle(color: Color(0xFF1A1A1A), fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '12 parcelas',
                            style: TextStyle(color: Colors.grey[500], fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // --- TÍTULO DA SEÇÃO ---
              const Text(
                "Próximas parcelas",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 10),

              // --- LISTA DE PARCELAS ---
              _buildParcelaItem(Icons.laptop_mac, "Notebook", "2/6 parcelas", "15/06/2025", "R\$ 350,00"),
              _buildParcelaItem(Icons.phone_android, "Celular", "3/12 parcelas", "20/06/2025", "R\$ 120,00"),
              _buildParcelaItem(Icons.book_outlined, "Curso Online", "1/6 parcelas", "25/06/2025", "R\$ 80,00"),
              _buildParcelaItem(Icons.headset_mic_outlined, "Fone de Ouvido", "2/4 parcelas", "30/06/2025", "R\$ 75,00"),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: const CustomBottomBar(currentIndex: 3),
    );
  }

  // Widget auxiliar para estruturar cada item da lista de parcelas
  Widget _buildParcelaItem(IconData icon, String title, String parcelas, String data, String valor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0).withOpacity(0.4)),
      ),
      child: Row(
        children: [
          // Ícone redondo azulado/cinza sutil de fundo
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF4A6572), size: 22),
          ),
          const SizedBox(width: 16),

          // Informações do produto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A)),
                ),
                const SizedBox(height: 4),
                Text(
                  "$parcelas\n$data",
                  style: const TextStyle(color: Colors.grey, fontSize: 11, height: 1.3),
                ),
              ],
            ),
          ),

          // Valor e seta indicadora na direita
          Row(
            children: [
              Text(
                valor,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
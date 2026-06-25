import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  String _descricao = '';
  String _valor = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2 abas: Despesa e Receita
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA), // Mesmo fundo cinza claro das outras telas

        // --- APP BAR ---
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Cadastrar Lançamento',
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,

          // --- ABAS (DESPESA / RECEITA) ---
          bottom: const TabBar(
            indicatorColor: Color(0xFFD32F2F), // Linha vermelha para Despesa
            indicatorWeight: 3,
            labelColor: Color(0xFFD32F2F),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            tabs: [
              Tab(text: 'Despesa'),
              Tab(text: 'Receita'),
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: ListView(
            children: [
              // --- CAMPO DESCRIÇÃO ---
              const Text(
                "Descrição",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ex: Supermercado',
                  hintStyle: const TextStyle(color: Colors.black26),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (valor) => _descricao = valor,
              ),

              const SizedBox(height: 20),

              // --- CAMPO VALOR ---
              const Text(
                "Valor",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'R\$ 0,00',
                  hintStyle: const TextStyle(color: Colors.black26),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (valor) => _valor = valor,
              ),

              const SizedBox(height: 20),

              // --- CAMPO CATEGORIA (DROPDOWN) ---
              const Text(
                "Categoria",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: 'Alimentação',
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.restaurant, color: Color(0xFF6A1B9A)), // Ícone roxo de alimentação
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Alimentação', child: Text('Alimentação')),
                  DropdownMenuItem(value: 'Transporte', child: Text('Transporte')),
                  DropdownMenuItem(value: 'Moradia', child: Text('Moradia')),
                ],
                onChanged: (value) {},
              ),

              const SizedBox(height: 20),

              // --- CAMPO DATA ---
              const Text(
                "Data",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '23/05/2025',
                  hintStyle: const TextStyle(color: Color(0xFF1A1A1A)),
                  suffixIcon: const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 20),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- CAMPO FORMA DE PAGAMENTO ---
              const Text(
                "Forma de pagamento",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: 'Dinheiro',
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFF007A33)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Dinheiro', child: Text('Dinheiro')),
                  DropdownMenuItem(value: 'Cartão de Crédito', child: Text('Cartão de Crédito')),
                  DropdownMenuItem(value: 'Pix', child: Text('Pix')),
                ],
                onChanged: (value) {},
              ),

              const SizedBox(height: 40),

              // --- BOTÃO SALVAR LANÇAMENTO ---
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF093A1C), // Verde escuro padrão do app
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Lógica para salvar
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirmar Lançamento?'),
                          content: Text('Deseja salvar a despesa "$_descricao" no valor de R\$ $_valor?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF093A1C)),
                              onPressed: () {
                                Navigator.pop(context); // Fecha o Pop-up
                                Navigator.pop(context); // Volta para a tela anterior
                              },
                              child: const Text('Confirmar', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Salvar Lançamento',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(currentIndex: 1), 
      ),
    );
  }
}
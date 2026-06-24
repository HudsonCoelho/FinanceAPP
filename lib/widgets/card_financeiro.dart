import 'package:flutter/material.dart';

class CardFinanceiro extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color cor;
  final IconData icone;

  const CardFinanceiro({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icone,
    this.cor = const Color(0xFF007A33), // Verde padrão caso não passe cor
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE0E0E0).withOpacity(0.5),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícone dentro do círculo com fundo suave (10% de opacidade da cor)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: cor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icone, color: cor, size: 16),
            ),
            const SizedBox(height: 6),

            // Título do Card
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),

            // Valor destacado
            Text(
              valor,
              style: TextStyle(
                color: cor,
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
}
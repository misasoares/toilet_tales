import 'package:flutter/material.dart';

class CustomCoinDisplay extends StatelessWidget {
  final int money; // Dinheiro a ser exibido

  const CustomCoinDisplay({
    Key? key,
    required this.money,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 196, 0), // Fundo amarelo
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10), // Borda arredondada
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Sombra
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.monetization_on,
            color: Colors.white, // Ícone branco
            size: 30,
          ),
          const SizedBox(width: 8), // Espaço entre ícone e texto
          Text(
            '$money',
            style: const TextStyle(
              color: Colors.white, // Texto branco
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomGearIcon extends StatelessWidget {
  final VoidCallback onTap;

  const CustomGearIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 196, 0), // Fundo amarelo
          shape: BoxShape.circle, // Formato circular
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4), // Cor da sombra
              blurRadius: 6, // Intensidade do desfoque
              offset: const Offset(0, 5), // Deslocamento horizontal e vertical
            ),
          ],
        ),
        child: Icon(
          Icons.settings,
          color: Colors.white, // Engrenagem em branco
          size: 40,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3), // Sombra do ícone
              blurRadius: 9, // Intensidade do desfoque da sombra do ícone
              offset: const Offset(0, 3), // Deslocamento da sombra
            ),
          ],
        ),
      ),
    );
  }
}

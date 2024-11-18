import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(255, 255, 196, 0), // Fundo amarelo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Cantos arredondados
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shadowColor: Colors.black.withOpacity(0.9), // Cor da sombra
        elevation: 10, // Intensidade da sombra
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white, // Texto em branco
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3), // Cor da sombra do texto
              blurRadius: 6, // Intensidade do desfoque da sombra do texto
              offset: const Offset(0, 3), // Deslocamento da sombra do texto
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toilet_tales/core/widgets/custom_button.dart';
import 'package:toilet_tales/core/widgets/custom_gear_icon.dart';
import 'package:toilet_tales/core/widgets/custom_coin_display.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      body: SafeArea(
        child: Column(
          children: [
            // Ícone de Configuração e Moeda no canto superior
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomGearIcon(
                    onTap: () {
                      // Navegar para a tela de configurações
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  const CustomCoinDisplay(
                    money: 10, // Exibe 10 moedas
                  ),
                ],
              ),
            ),

            // Texto centralizado 'Toilet Tales'
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Toilet',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texto branco
                      shadows: [
                        Shadow(
                          color: Colors.black, // Contorno preto
                          offset:
                              Offset(-1.5, -1.5), // Sombra para cima/esquerda
                        ),
                        Shadow(
                          color: Colors.black, // Contorno preto
                          offset: Offset(1.5, -1.5), // Sombra para cima/direita
                        ),
                        Shadow(
                          color: Colors.black, // Contorno preto
                          offset: Offset(1.5, 1.5), // Sombra para baixo/direita
                        ),
                        Shadow(
                          color: Colors.black, // Contorno preto
                          offset:
                              Offset(-1.5, 1.5), // Sombra para baixo/esquerda
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Tales',
                    style: TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 166, 0),
                    ),
                  ),
                ],
              ),
            ),

            // Botão 'Play'
            Column(
              children: [
                const SizedBox(height: 32), // Espaço entre o texto e o botão
                CustomButton(
                  text: 'PLAY',
                  onPressed: () {
                    // Navegar para a seleção de mini-jogos
                    Navigator.pushNamed(context, '/minigames');
                  },
                ),
                const SizedBox(height: 64),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

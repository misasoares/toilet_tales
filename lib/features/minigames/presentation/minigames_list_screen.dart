import 'package:flutter/material.dart';
import 'package:toilet_tales/core/widgets/custom_gear_icon.dart';
import 'package:toilet_tales/core/widgets/custom_coin_display.dart';

class MinigamesListScreen extends StatelessWidget {
  const MinigamesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho personalizado com ícone de retorno, engrenagem e moedas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Retorna à tela anterior
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                255, 255, 196, 0), // Fundo amarelo
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white, // Ícone branco
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      CustomCoinDisplay(
                        money: 10, // Exibe 10 moedas
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Lista de Mini-Jogos
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  // Card para mini-jogo 1
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cocometro');
                    },
                    child: Card(
                      color: Colors.amber.shade200,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.gamepad, size: 40, color: Colors.black),
                            SizedBox(width: 16),
                            Text(
                              'Cocômetro',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Card para mini-jogo 2
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/tiro-ao-papel');
                    },
                    child: Card(
                      color: Colors.amber.shade200,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.sports_esports,
                                size: 40, color: Colors.black),
                            SizedBox(width: 16),
                            Text(
                              'Tiro ao Papel',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Card para mini-jogo 3
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/labirinto');
                    },
                    child: Card(
                      color: Colors.amber.shade200,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.videogame_asset,
                                size: 40, color: Colors.black),
                            SizedBox(width: 16),
                            Text(
                              'Labirinto',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

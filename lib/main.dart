import 'package:flutter/material.dart';
import 'package:toilet_tales/features/home/presentation/home_screen.dart';
import 'package:toilet_tales/features/minigames/cocometro/presentation/cocometro_screen.dart';
import 'package:toilet_tales/features/minigames/presentation/minigames_list_screen.dart';

void main() {
  runApp(const ToiletTalesApp());
}

class ToiletTalesApp extends StatelessWidget {
  const ToiletTalesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/minigames': (context) => const MinigamesListScreen(),
        // Rotas futuras para mini-jogos
        '/cocometro': (context) =>
            const CocometroScreen(), // Substituir pelo mini-jogo 1
        '/tiro-ao-papel': (context) =>
            const Placeholder(), // Substituir pelo mini-jogo 2
        '/labirinto': (context) =>
            const Placeholder(), // Substituir pelo mini-jogo 3
      },
    );
  }
}

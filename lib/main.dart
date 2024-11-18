// import 'package:flutter/material.dart';
// import 'package:toilet_tales/core/constants/app_routes.dart';
// import 'package:toilet_tales/features/home/presentation/home_screen.dart';

// void main() {
//   runApp(const ToiletTalesApp());
// }

// class ToiletTalesApp extends StatelessWidget {
//   const ToiletTalesApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'CartoonFont', // Fonte padrão do tema
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             fontSize: 36,
//             fontWeight: FontWeight.bold, // Usa Fredoka-Bold
//           ),
//           displayMedium: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.normal, // Usa Fredoka-Regular
//           ),
//           bodyLarge: TextStyle(
//             fontSize: 16,
//           ),
//           bodyMedium: TextStyle(
//             fontSize: 14,
//           ),
//         ),
//         primarySwatch: Colors.yellow,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:toilet_tales/features/home/presentation/home_screen.dart';
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
            const Placeholder(), // Substituir pelo mini-jogo 1
        '/tiro-ao-papel': (context) =>
            const Placeholder(), // Substituir pelo mini-jogo 2
        '/labirinto': (context) =>
            const Placeholder(), // Substituir pelo mini-jogo 3
      },
    );
  }
}

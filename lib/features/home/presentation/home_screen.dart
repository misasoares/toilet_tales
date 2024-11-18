import 'package:flutter/material.dart';
import 'package:toilet_tales/core/widgets/custom_button.dart';
import 'package:toilet_tales/core/widgets/custom_gear_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      body: SafeArea(
        child: Column(
          children: [
            // Ícone de Configuração no canto superior direito
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomGearIcon(
                    onTap: () {
                      // Navegar para a tela de configurações
                      Navigator.pushNamed(context, '/settings');
                    },
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
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Tales',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                  text: 'Play',
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

// import 'package:flutter/material.dart';
// import 'package:toilet_tales/core/widgets/custom_button.dart';
// import 'package:toilet_tales/core/widgets/custom_gear_icon.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Fundo branco
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Ícone de Configuração no canto superior direito
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomGearIcon(
//                     onTap: () {
//                       // Navegar para a tela de configurações
//                       Navigator.pushNamed(context, '/settings');
//                     },
//                   ),
//                 ],
//               ),
//             ),

//             // Texto centralizado 'Toilet Tales'
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Toilet',
//                     style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                           color: Colors.black,
//                         ), // Usa a fonte padrão com ajustes de cor
//                   ),
//                   Text(
//                     'Tales',
//                     style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                           color: Colors.black,
//                         ), // Usa a fonte padrão com ajustes de cor
//                   ),
//                 ],
//               ),
//             ),

//             // Botão 'Play'
//             Column(
//               children: [
//                 const SizedBox(height: 32), // Espaço entre o texto e o botão
//                 CustomButton(
//                   text: 'Play',
//                   onPressed: () {
//                     // Navegar para a seleção de mini-jogos
//                     Navigator.pushNamed(context, '/minigames');
//                   },
//                 ),
//                 const SizedBox(height: 64),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

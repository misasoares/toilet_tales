// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:toilet_tales/features/minigames/cocometro/controllers/cocometro_controller.dart';

// class CocometroScreen extends StatefulWidget {
//   const CocometroScreen({Key? key}) : super(key: key);

//   @override
//   State<CocometroScreen> createState() => _CocometroScreenState();
// }

// class _CocometroScreenState extends State<CocometroScreen>
//     with SingleTickerProviderStateMixin {
//   final CocometroController _controller = CocometroController();
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100), // Duração do tremor
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _triggerShake() {
//     _animationController
//       ..reset()
//       ..forward();
//   }

//   void _showNextLevelDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         title: const Text('Parabéns!'),
//         content: const Text('Você completou este nível. O que deseja fazer?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//             child: const Text('Sair do Jogo'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _controller.startNextLevel();
//             },
//             child: const Text('Próximo Nível'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showGameOverDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         title: const Text('Game Over'),
//         content: const Text('Você saiu do range ideal! O que deseja fazer?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//             child: const Text('Sair do Jogo'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _controller.restartGame();
//             },
//             child: const Text('Reiniciar'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onTap() {
//     _controller.tap();
//     _triggerShake();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 // Cabeçalho com nível e moedas
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ValueListenableBuilder<int>(
//                         valueListenable: _controller.level,
//                         builder: (context, level, _) {
//                           return Text(
//                             'Nível: $level',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           );
//                         },
//                       ),
//                       ValueListenableBuilder<int>(
//                         valueListenable: _controller.coins,
//                         builder: (context, coins, _) {
//                           return Text(
//                             'Moedas: $coins',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Barra com agulha e range
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Barra de fundo
//                       Container(
//                         height: 20,
//                         width: screenWidth - 32,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade300,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       // Range ideal
//                       ValueListenableBuilder<double>(
//                         valueListenable: _controller.minRange,
//                         builder: (context, minRange, _) {
//                           return Positioned(
//                             left: (screenWidth - 32) * minRange,
//                             child: Container(
//                               width: (screenWidth - 32) *
//                                   (_controller.maxRange.value - minRange),
//                               height: 20,
//                               color: Colors.green.withOpacity(0.3),
//                             ),
//                           );
//                         },
//                       ),
//                       // Agulha animada
//                       ValueListenableBuilder<double>(
//                         valueListenable: _controller.progress,
//                         builder: (context, progress, _) {
//                           return AnimatedPositioned(
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.easeOut,
//                             left: (screenWidth - 32) * progress,
//                             child: Container(
//                               width: 2,
//                               height: 40,
//                               color: Colors.red,
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Renderização do personagem com animação
//                 Center(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/images/cocometro/sad_toilet.png',
//                         width: screenWidth * 0.4,
//                         fit: BoxFit.contain,
//                       ),
//                       Image.asset(
//                         'assets/images/cocometro/sad_body.png',
//                         width: screenWidth * 0.4,
//                         fit: BoxFit.contain,
//                       ),
//                       AnimatedBuilder(
//                         animation: _animationController,
//                         builder: (context, child) {
//                           double shake =
//                               sin(_animationController.value * 2 * pi) *
//                                   (0.5 + _controller.level.value * 0.1);
//                           return Transform.translate(
//                             offset: Offset(shake * 10, 0),
//                             child: child,
//                           );
//                         },
//                         child: Image.asset(
//                           'assets/images/cocometro/sad_face.png',
//                           width: screenWidth * 0.4,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 24),

//                 // Botão de "Empurrar!"
//                 ValueListenableBuilder<bool>(
//                   valueListenable: _controller.hasFailed,
//                   builder: (context, hasFailed, _) {
//                     return ElevatedButton(
//                       onPressed: hasFailed ? null : _onTap,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 255, 196, 0),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 32, vertical: 16),
//                       ),
//                       child: const Text(
//                         'Empurrar!',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),

//             // Listener para exibir o modal de próximo nível
//             ValueListenableBuilder<bool>(
//               valueListenable: _controller.showNextLevelDialog,
//               builder: (context, showDialog, _) {
//                 if (showDialog) {
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     _showNextLevelDialog();
//                   });
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),

//             // Listener para exibir o modal de Game Over
//             ValueListenableBuilder<bool>(
//               valueListenable: _controller.showGameOverDialog,
//               builder: (context, showDialog, _) {
//                 if (showDialog) {
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     _showGameOverDialog();
//                   });
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:toilet_tales/features/minigames/cocometro/controllers/cocometro_controller.dart';

class CocometroScreen extends StatefulWidget {
  const CocometroScreen({Key? key}) : super(key: key);

  @override
  State<CocometroScreen> createState() => _CocometroScreenState();
}

class _CocometroScreenState extends State<CocometroScreen>
    with SingleTickerProviderStateMixin {
  final CocometroController _controller = CocometroController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _triggerShake() {
    _animationController
      ..reset()
      ..forward();
  }

  void _showNextLevelDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Parabéns!'),
        content: const Text('Você completou este nível. O que deseja fazer?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Sair do Jogo'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.startNextLevel();
            },
            child: const Text('Próximo Nível'),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: const Text('Você saiu do range ideal! O que deseja fazer?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Sair do Jogo'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.restartGame();
            },
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }

  void _onTap() {
    _controller.tap();
    _triggerShake();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder<int>(
                        valueListenable: _controller.level,
                        builder: (context, level, _) {
                          return Text(
                            'Nível: $level',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder<int>(
                        valueListenable: _controller.coins,
                        builder: (context, coins, _) {
                          return Text(
                            'Moedas: $coins',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Barra com agulha e range
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: screenWidth - 32,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ValueListenableBuilder<double>(
                        valueListenable: _controller.minRange,
                        builder: (context, minRange, _) {
                          return Positioned(
                            left: (screenWidth - 32) * minRange,
                            child: Container(
                              width: (screenWidth - 32) *
                                  (_controller.maxRange.value - minRange),
                              height: 20,
                              color: Colors.green.withOpacity(0.3),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder<double>(
                        valueListenable: _controller.progress,
                        builder: (context, progress, _) {
                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            left: (screenWidth - 32) * progress,
                            child: Container(
                              width: 2,
                              height: 40,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/cocometro/${_controller.isExcited.value ? 'excited_' : 'sad_'}toilet.png',
                        width: screenWidth * 0.4,
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/images/cocometro/${_controller.isExcited.value ? 'excited_' : 'sad_'}body.png',
                        width: screenWidth * 0.4,
                        fit: BoxFit.contain,
                      ),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          double shake =
                              sin(_animationController.value * 2 * pi) *
                                  (0.5 + _controller.level.value * 0.1);
                          return Transform.translate(
                            offset: Offset(shake * 10, 0),
                            child: child,
                          );
                        },
                        child: Image.asset(
                          'assets/images/cocometro/${_controller.isExcited.value ? 'excited_' : 'sad_'}face.png',
                          width: screenWidth * 0.4,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                ValueListenableBuilder<bool>(
                  valueListenable: _controller.hasFailed,
                  builder: (context, hasFailed, _) {
                    return ElevatedButton(
                      onPressed: hasFailed ? null : _onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                      child: const Text(
                        'Empurrar!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.showNextLevelDialog,
              builder: (context, showDialog, _) {
                if (showDialog) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showNextLevelDialog();
                  });
                }
                return const SizedBox.shrink();
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.showGameOverDialog,
              builder: (context, showDialog, _) {
                if (showDialog) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showGameOverDialog();
                  });
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

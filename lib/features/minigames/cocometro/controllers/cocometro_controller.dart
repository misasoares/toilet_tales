import 'dart:async';
import 'package:flutter/material.dart';

class CocometroController {
  final ValueNotifier<double> progress = ValueNotifier(0.5); // Começa no meio
  final ValueNotifier<int> coins = ValueNotifier(0);
  final ValueNotifier<int> level = ValueNotifier(1);
  final ValueNotifier<bool> hasFailed = ValueNotifier(false); // Fim do jogo
  final ValueNotifier<bool> hasWon = ValueNotifier(false); // Vitória
  final ValueNotifier<bool> showNextLevelDialog =
      ValueNotifier(false); // Exibe modal ao completar nível
  final ValueNotifier<bool> showGameOverDialog =
      ValueNotifier(false); // Exibe modal ao perder
  final ValueNotifier<double> minRange =
      ValueNotifier(0.4); // Início do range ideal
  final ValueNotifier<double> maxRange =
      ValueNotifier(0.6); // Fim do range ideal
  final ValueNotifier<double> currentTimeInRange =
      ValueNotifier(0.0); // Tempo atual no range

  double requiredTimeInRange =
      8.0; // Tempo necessário no range ideal (em segundos)
  double decayRate = 0.05; // Taxa de decaimento por segundo

  Timer? _gameTimer;

  CocometroController() {
    _startGameTimer();
  }

  void _startGameTimer() {
    _gameTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Reduz o progresso automaticamente
      progress.value -= decayRate / 10;
      if (progress.value < 0) progress.value = 0;

      // Verifica se está dentro do range
      if (progress.value >= minRange.value &&
          progress.value <= maxRange.value) {
        currentTimeInRange.value += 0.1;
        if (currentTimeInRange.value >= requiredTimeInRange) {
          _completeLevel();
        }
      } else {
        _failLevel(); // Termina o jogo se sair do range
      }
    });
  }

  void tap() {
    if (hasFailed.value || hasWon.value) return;

    progress.value += 0.01; // Incremento da força a cada clique
    if (progress.value > 1.0) progress.value = 1.0;
  }

  void _completeLevel() {
    coins.value += 5;
    level.value++;
    showNextLevelDialog.value = true; // Exibe modal para próximo nível
    _gameTimer?.cancel(); // Para o cronômetro
  }

  void startNextLevel() {
    _updateRange();
    resetProgress();
    showNextLevelDialog.value = false; // Fecha o modal de próximo nível
  }

  void _failLevel() {
    hasFailed.value = true;
    showGameOverDialog.value = true; // Exibe modal de Game Over
    _gameTimer?.cancel(); // Para o cronômetro
  }

  void restartGame() {
    level.value = 1;
    coins.value = 0;
    requiredTimeInRange = 8.0;
    decayRate = 0.05;
    minRange.value = 0.4;
    maxRange.value = 0.6;
    resetProgress();
    showGameOverDialog.value = false; // Fecha o modal de Game Over
  }

  void _updateRange() {
    // Diminui o tamanho do range ideal e aumenta o tempo necessário
    double rangeReduction = 0.05;
    minRange.value += rangeReduction / 2;
    maxRange.value -= rangeReduction / 2;
    requiredTimeInRange += 1.0; // Aumenta o tempo necessário
    decayRate += 0.005; // Aumenta a taxa de decaimento
  }

  void resetProgress() {
    progress.value = 0.5; // Reinicia no meio
    currentTimeInRange.value = 0.0;
    hasFailed.value = false;
    _startGameTimer();
  }

  void dispose() {
    _gameTimer?.cancel();
    progress.dispose();
    coins.dispose();
    level.dispose();
    hasFailed.dispose();
    hasWon.dispose();
    minRange.dispose();
    maxRange.dispose();
    currentTimeInRange.dispose();
    showNextLevelDialog.dispose();
    showGameOverDialog.dispose();
  }

  void pauseGame() {
    _gameTimer?.cancel();
  }

  void resumeGame() {
    _startGameTimer();
  }
}

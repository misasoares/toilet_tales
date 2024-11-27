class CocometroLevel {
  final int level;
  final int targetClicks; // Cliques para vencer o nível
  final int maxClicks; // Limite de cliques antes de falhar
  final double drainSpeed; // Velocidade de esvaziamento

  CocometroLevel({
    required this.level,
    required this.targetClicks,
    required this.maxClicks,
    required this.drainSpeed,
  });
}

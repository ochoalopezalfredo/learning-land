import 'package:audioplayers/audioplayers.dart';

enum SoundEffect {
  correct,
  incorrect,
  levelComplete,
  buttonTap,
  streakActive,
  achievement,
  xpGain,
}

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final Map<SoundEffect, AudioPlayer> _players = {};
  bool _isInitialized = false;

  // In a real app, these would be actual asset paths
  static const Map<SoundEffect, String> _soundPaths = {
    SoundEffect.correct: 'sounds/correct.mp3',
    SoundEffect.incorrect: 'sounds/incorrect.mp3',
    SoundEffect.levelComplete: 'sounds/level_complete.mp3',
    SoundEffect.buttonTap: 'sounds/button_tap.mp3',
    SoundEffect.streakActive: 'sounds/streak.mp3',
    SoundEffect.achievement: 'sounds/achievement.mp3',
    SoundEffect.xpGain: 'sounds/xp.mp3',
  };

  Future<void> initialize() async {
    if (_isInitialized) return;

    for (final effect in SoundEffect.values) {
      _players[effect] = AudioPlayer();
    }

    _isInitialized = true;
  }

  Future<void> playSound(SoundEffect effect) async {
    if (!_isInitialized) {
      await initialize();
    }

    final player = _players[effect];
    if (player == null) return;

    try {
      await player.stop();
      await player.play(AssetSource(_soundPaths[effect] ?? ''));
    } catch (e) {
      // Silently fail if sound file doesn't exist yet
      // This allows the app to work without sounds during development
    }
  }

  Future<void> playCorrect() => playSound(SoundEffect.correct);
  Future<void> playIncorrect() => playSound(SoundEffect.incorrect);
  Future<void> playLevelComplete() => playSound(SoundEffect.levelComplete);
  Future<void> playButtonTap() => playSound(SoundEffect.buttonTap);
  Future<void> playStreak() => playSound(SoundEffect.streakActive);
  Future<void> playAchievement() => playSound(SoundEffect.achievement);
  Future<void> playXpGain() => playSound(SoundEffect.xpGain);

  Future<void> dispose() async {
    for (final player in _players.values) {
      await player.dispose();
    }
    _players.clear();
    _isInitialized = false;
  }
}
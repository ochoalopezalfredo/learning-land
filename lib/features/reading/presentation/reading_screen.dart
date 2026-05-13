import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/word_lists.dart';

class ReadingScreen extends ConsumerStatefulWidget {
  final int level;

  const ReadingScreen({super.key, required this.level});

  @override
  ConsumerState<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends ConsumerState<ReadingScreen> {
  late List<Word> _words;
  int _currentIndex = 0;
  int _correctCount = 0;
  int _incorrectCount = 0;
  bool _showingResult = false;
  bool? _lastResult;

  @override
  void initState() {
    super.initState();
    _loadLevel();
  }

  void _loadLevel() {
    final levels = WordList.levels;
    if (widget.level <= levels.length) {
      _words = List.from(levels[widget.level - 1].words);
      _words.shuffle();
    } else {
      _words = [];
    }
  }

  void _onResult(bool correct) {
    setState(() {
      _lastResult = correct;
      _showingResult = true;
      if (correct) {
        _correctCount++;
      } else {
        _incorrectCount++;
      }
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _showingResult = false;
          if (_currentIndex < _words.length - 1) {
            _currentIndex++;
          }
        });
      }
    });
  }

  double get _progress => (_currentIndex + 1) / _words.length;
  double get _accuracy => _words.isEmpty ? 0 : _correctCount / (_correctCount + _incorrectCount);
  bool get _passedLevel => _words.isNotEmpty && _currentIndex >= _words.length - 1 && _accuracy >= 0.8;

  @override
  Widget build(BuildContext context) {
    final levelColor = AppColors.levelColors[(widget.level - 1) % AppColors.levelColors.length];

    return Scaffold(
      backgroundColor: levelColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textSecondary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Nivel ${widget.level}',
          style: AppTypography.headlineMedium,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: levelColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${_correctCount}/${_words.length}',
              style: AppTypography.levelText.copyWith(color: levelColor),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _words.isEmpty
            ? const Center(child: Text('Nivel no disponible'))
            : Column(
                children: [
                  // Progress bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: levelColor.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation(levelColor),
                        minHeight: 12,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Word display area
                  Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: levelColor.withOpacity(0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // The word
                        Text(
                          _words[_currentIndex].word,
                          style: AppTypography.wordDisplay.copyWith(
                            color: _showingResult
                                ? (_lastResult == true ? AppColors.correctGreen : AppColors.incorrectRed)
                                : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Translation hint
                        Text(
                          _words[_currentIndex].translation,
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Syllables count
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: levelColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${_words[_currentIndex].syllables} sílabas',
                            style: AppTypography.bodySmall.copyWith(color: levelColor),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Mic button placeholder
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: GestureDetector(
                      onTap: () => _onResult(_showingResult ? false : true), // TODO: integrate speech
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: levelColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: levelColor.withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Instructions
                  Text(
                    'Presiona el botón y di la palabra',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
      ),
    );
  }
}
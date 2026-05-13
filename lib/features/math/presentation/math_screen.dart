import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/math_problems.dart';

class MathScreen extends ConsumerStatefulWidget {
  final int level;

  const MathScreen({super.key, required this.level});

  @override
  ConsumerState<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends ConsumerState<MathScreen> {
  late List<MathProblem> _problems;
  int _currentIndex = 0;
  int _correctCount = 0;
  int _incorrectCount = 0;
  int? _selectedAnswer;
  bool _showingResult = false;

  @override
  void initState() {
    super.initState();
    _loadLevel();
  }

  void _loadLevel() {
    final levels = MathProblems.levels;
    if (widget.level <= levels.length) {
      _problems = List.from(levels[widget.level - 1].problems);
    } else {
      _problems = [];
    }
  }

  void _onAnswerSelected(int answer) {
    if (_showingResult) return;

    setState(() {
      _selectedAnswer = answer;
      _showingResult = true;
      if (answer == _problems[_currentIndex].answer) {
        _correctCount++;
      } else {
        _incorrectCount++;
      }
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _showingResult = false;
          _selectedAnswer = null;
          if (_currentIndex < _problems.length - 1) {
            _currentIndex++;
          }
        });
      }
    });
  }

  double get _progress => _problems.isEmpty ? 0 : (_currentIndex + 1) / _problems.length;
  double get _accuracy => _problems.isEmpty ? 0 : _correctCount / (_correctCount + _incorrectCount);
  bool get _levelComplete => _problems.isNotEmpty && _currentIndex >= _problems.length - 1;

  @override
  Widget build(BuildContext context) {
    final levelColor = AppColors.purple;

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
          'Matemáticas Nivel ${widget.level}',
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
              '$_correctCount/${_problems.length}',
              style: AppTypography.levelText.copyWith(color: levelColor),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _problems.isEmpty
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

                  // Problem display
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
                    child: Text(
                      _problems[_currentIndex].display,
                      style: AppTypography.mathDisplay,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Answer options (2x2 grid)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 2,
                      children: _problems[_currentIndex].options.map((option) {
                        final isSelected = _selectedAnswer == option;
                        final isCorrect = option == _problems[_currentIndex].answer;
                        final showResult = _showingResult;

                        Color bgColor = AppColors.surface;
                        Color textColor = AppColors.textPrimary;

                        if (showResult) {
                          if (isCorrect) {
                            bgColor = AppColors.correctGreen;
                            textColor = Colors.white;
                          } else if (isSelected && !isCorrect) {
                            bgColor = AppColors.incorrectRed;
                            textColor = Colors.white;
                          }
                        }

                        return GestureDetector(
                          onTap: () => _onAnswerSelected(option),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected && !showResult
                                    ? levelColor
                                    : AppColors.textSecondary.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '$option',
                                style: AppTypography.displaySmall.copyWith(
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
      ),
    );
  }
}
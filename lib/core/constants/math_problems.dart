class MathProblem {
  final int num1;
  final int num2;
  final MathOperation operation;
  final int answer;
  final List<int> options;

  const MathProblem({
    required this.num1,
    required this.num2,
    required this.operation,
    required this.answer,
    required this.options,
  });

  String get display {
    switch (operation) {
      case MathOperation.addition:
        return '$num1 + $num2 = ?';
      case MathOperation.subtraction:
        return '$num1 - $num2 = ?';
      case MathOperation.multiplication:
        return '$num1 × $num2 = ?';
      case MathOperation.division:
        return '$num1 ÷ $num2 = ?';
    }
  }
}

enum MathOperation {
  addition,
  subtraction,
  multiplication,
  division,
}

class MathLevel {
  final int level;
  final MathOperation operation;
  final List<MathProblem> problems;
  final int passThreshold; // percentage

  const MathLevel({
    required this.level,
    required this.operation,
    required this.problems,
    this.passThreshold = 80,
  });
}

class MathProblems {
  MathProblems._();

  static List<MathLevel> get levels => [
    // Level 1: Simple addition (1+1 to 5+5)
    MathLevel(
      level: 1,
      operation: MathOperation.addition,
      problems: _generateAdditionProblems(1, 5, 10),
      passThreshold: 80,
    ),

    // Level 2: Addition up to 10
    MathLevel(
      level: 2,
      operation: MathOperation.addition,
      problems: _generateAdditionProblems(1, 10, 15),
      passThreshold: 80,
    ),

    // Level 3: Simple subtraction
    MathLevel(
      level: 3,
      operation: MathOperation.subtraction,
      problems: _generateSubtractionProblems(1, 10, 15),
      passThreshold: 80,
    ),

    // Level 4: Subtraction up to 20
    MathLevel(
      level: 4,
      operation: MathOperation.subtraction,
      problems: _generateSubtractionProblems(5, 20, 15),
      passThreshold: 80,
    ),

    // Level 5: Multiplication tables 1-5
    MathLevel(
      level: 5,
      operation: MathOperation.multiplication,
      problems: _generateMultiplicationProblems(1, 5, 15),
      passThreshold: 80,
    ),

    // Level 6: Multiplication tables 1-10
    MathLevel(
      level: 6,
      operation: MathOperation.multiplication,
      problems: _generateMultiplicationProblems(1, 10, 20),
      passThreshold: 80,
    ),

    // Level 7: Simple division
    MathLevel(
      level: 7,
      operation: MathOperation.division,
      problems: _generateDivisionProblems(1, 10, 15),
      passThreshold: 80,
    ),

    // Level 8: Division with larger numbers
    MathLevel(
      level: 8,
      operation: MathOperation.division,
      problems: _generateDivisionProblems(1, 12, 20),
      passThreshold: 80,
    ),

    // Level 9+: Mixed operations
    MathLevel(
      level: 9,
      operation: MathOperation.addition,
      problems: _generateMixedProblems(20),
      passThreshold: 80,
    ),
  ];

  static List<MathProblem> _generateAdditionProblems(int min, int max, int count) {
    final problems = <MathProblem>[];
    final usedPairs = <String>{};

    while (problems.length < count) {
      final a = min + (DateTime.now().microsecond % (max - min + 1));
      final b = min + ((DateTime.now().microsecond + problems.length) % (max - min + 1));
      final pairKey = '${a}_$b';

      if (usedPairs.contains(pairKey)) continue;
      usedPairs.add(pairKey);

      final answer = a + b;
      problems.add(MathProblem(
        num1: a,
        num2: b,
        operation: MathOperation.addition,
        answer: answer,
        options: _generateOptions(answer, 4),
      ));
    }

    return problems;
  }

  static List<MathProblem> _generateSubtractionProblems(int min, int max, int count) {
    final problems = <MathProblem>[];
    final usedPairs = <String>{};

    while (problems.length < count) {
      final a = min + (DateTime.now().microsecond % (max - min + 1));
      final b = min + ((DateTime.now().microsecond + problems.length) % (a - min + 1));
      if (b > a) continue;

      final pairKey = '${a}_$b';
      if (usedPairs.contains(pairKey)) continue;
      usedPairs.add(pairKey);

      final answer = a - b;
      problems.add(MathProblem(
        num1: a,
        num2: b,
        operation: MathOperation.subtraction,
        answer: answer,
        options: _generateOptions(answer, 4),
      ));
    }

    return problems;
  }

  static List<MathProblem> _generateMultiplicationProblems(int min, int max, int count) {
    final problems = <MathProblem>[];
    final usedPairs = <String>{};

    while (problems.length < count) {
      final a = min + (DateTime.now().microsecond % (max - min + 1));
      final b = min + ((DateTime.now().microsecond + problems.length) % (max - min + 1));
      final pairKey = '${a}_$b';

      if (usedPairs.contains(pairKey)) continue;
      usedPairs.add(pairKey);

      final answer = a * b;
      problems.add(MathProblem(
        num1: a,
        num2: b,
        operation: MathOperation.multiplication,
        answer: answer,
        options: _generateOptions(answer, 4),
      ));
    }

    return problems;
  }

  static List<MathProblem> _generateDivisionProblems(int min, int max, int count) {
    final problems = <MathProblem>[];
    final usedPairs = <String>{};

    while (problems.length < count) {
      final divisor = min + (DateTime.now().microsecond % (max - min + 1));
      if (divisor == 0) continue;

      final quotient = 1 + ((DateTime.now().microsecond + problems.length) % 10);
      final dividend = divisor * quotient;

      final pairKey = '${dividend}_$divisor';
      if (usedPairs.contains(pairKey)) continue;
      usedPairs.add(pairKey);

      problems.add(MathProblem(
        num1: dividend,
        num2: divisor,
        operation: MathOperation.division,
        answer: quotient,
        options: _generateOptions(quotient, 4),
      ));
    }

    return problems;
  }

  static List<MathProblem> _generateMixedProblems(int count) {
    final problems = <MathProblem>[];
    final operations = [MathOperation.addition, MathOperation.subtraction, MathOperation.multiplication];

    for (var i = 0; i < count; i++) {
      final op = operations[i % operations.length];
      switch (op) {
        case MathOperation.addition:
          problems.addAll(_generateAdditionProblems(1, 15, 1));
          break;
        case MathOperation.subtraction:
          problems.addAll(_generateSubtractionProblems(5, 20, 1));
          break;
        case MathOperation.multiplication:
          problems.addAll(_generateMultiplicationProblems(1, 5, 1));
          break;
        case MathOperation.division:
          problems.addAll(_generateDivisionProblems(1, 10, 1));
          break;
      }
    }

    return problems.take(count).toList();
  }

  static List<int> _generateOptions(int correctAnswer, int optionCount) {
    final options = <int>{correctAnswer};
    final seen = <int>{correctAnswer};

    while (options.length < optionCount) {
      final offset = (DateTime.now().microsecond % 10) + 1;
      final wrong = offset * ((DateTime.now().microsecond % 2 == 0) ? 1 : -1);
      final candidate = correctAnswer + wrong;

      if (candidate >= 0 && !seen.contains(candidate)) {
        options.add(candidate);
        seen.add(candidate);
      }
    }

    final list = options.toList();
    list.shuffle();
    return list;
  }
}
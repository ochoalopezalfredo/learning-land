class PronunciationChecker {
  PronunciationChecker._();

  // Threshold for kids - lower because they mispronounce more
  static const double defaultThreshold = 0.7;

  /// Checks if the spoken word matches the target word
  /// Returns true if similarity score is above threshold
  static bool check({
    required String spoken,
    required String target,
    double threshold = defaultThreshold,
  }) {
    final normalizedSpoken = _normalizeText(spoken);
    final normalizedTarget = _normalizeText(target);

    // Exact match (case insensitive)
    if (normalizedSpoken == normalizedTarget) {
      return true;
    }

    // Fuzzy match using Levenshtein distance
    final similarity = _calculateSimilarity(normalizedSpoken, normalizedTarget);
    return similarity >= threshold;
  }

  /// Get similarity score between two strings (0.0 to 1.0)
  static double getSimilarityScore(String spoken, String target) {
    final normalizedSpoken = _normalizeText(spoken);
    final normalizedTarget = _normalizeText(target);

    if (normalizedSpoken == normalizedTarget) {
      return 1.0;
    }

    return _calculateSimilarity(normalizedSpoken, normalizedTarget);
  }

  /// Normalize text for comparison
  /// - Convert to lowercase
  /// - Remove accents
  /// - Remove extra whitespace
  /// - Remove punctuation
  static String _normalizeText(String text) {
    return text
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'[^\w\s]'), '');
  }

  /// Calculate similarity using Levenshtein distance
  /// Returns value between 0.0 (completely different) and 1.0 (identical)
  static double _calculateSimilarity(String s1, String s2) {
    if (s1.isEmpty || s2.isEmpty) return 0.0;
    if (s1 == s2) return 1.0;

    final distance = _levenshteinDistance(s1, s2);
    final maxLen = s1.length > s2.length ? s1.length : s2.length;

    return 1.0 - (distance / maxLen);
  }

  /// Calculate Levenshtein distance between two strings
  static int _levenshteinDistance(String s1, String s2) {
    final len1 = s1.length;
    final len2 = s2.length;

    // Create matrix
    final matrix = List.generate(len1 + 1, (i) => List.filled(len2 + 1, 0));

    // Initialize
    for (var i = 0; i <= len1; i++) {
      matrix[i][0] = i;
    }
    for (var j = 0; j <= len2; j++) {
      matrix[0][j] = j;
    }

    // Fill matrix
    for (var i = 1; i <= len1; i++) {
      for (var j = 1; j <= len2; j++) {
        final cost = s1[i - 1] == s2[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1, // deletion
          matrix[i][j - 1] + 1, // insertion
          matrix[i - 1][j - 1] + cost, // substitution
        ].reduce((a, b) => a < b ? a : b);
      }
    }

    return matrix[len1][len2];
  }

  /// Check with multiple acceptable pronunciations
  /// Useful for handling variations like "color" vs "colour"
  static bool checkMultiple({
    required String spoken,
    required List<String> acceptableTargets,
    double threshold = defaultThreshold,
  }) {
    for (final target in acceptableTargets) {
      if (check(spoken: spoken, target: target, threshold: threshold)) {
        return true;
      }
    }
    return false;
  }
}
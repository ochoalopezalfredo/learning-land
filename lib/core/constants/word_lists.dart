class WordList {
  WordList._();

  // Reading levels with increasing syllable complexity
  // Format: List of words per level, each word has Spanish and English versions

  static const List<ReadingLevel> levels = [
    // Level 1: 1 syllable words (10 words)
    ReadingLevel(
      level: 1,
      words: [
        Word(word: 'SOL', translation: 'SUN', syllables: 1, language: 'es'),
        Word(word: 'MAR', translation: 'SEA', syllables: 1, language: 'es'),
        Word(word: 'LUNA', translation: 'MOON', syllables: 2, language: 'es'),
        Word(word: 'FLOR', translation: 'FLOWER', syllables: 2, language: 'es'),
        Word(word: 'CASA', translation: 'HOUSE', syllables: 2, language: 'es'),
        Word(word: 'GATO', translation: 'CAT', syllables: 2, language: 'es'),
        Word(word: 'PERRO', translation: 'DOG', syllables: 2, language: 'es'),
        Word(word: 'LIBRO', translation: 'BOOK', syllables: 2, language: 'es'),
        Word(word: 'AGUA', translation: 'WATER', syllables: 3, language: 'es'),
        Word(word: 'FUEGO', translation: 'FIRE', syllables: 3, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 2: 1-2 syllable words (15 words)
    ReadingLevel(
      level: 2,
      words: [
        Word(word: 'TIERRA', translation: 'EARTH', syllables: 3, language: 'es'),
        Word(word: 'NUBE', translation: 'CLOUD', syllables: 2, language: 'es'),
        Word(word: 'ÁRBOL', translation: 'TREE', syllables: 2, language: 'es'),
        Word(word: 'PUERTA', translation: 'DOOR', syllables: 3, language: 'es'),
        Word(word: 'NIÑO', translation: 'BOY', syllables: 2, language: 'es'),
        Word(word: 'NIÑA', translation: 'GIRL', syllables: 2, language: 'es'),
        Word(word: 'DÍA', translation: 'DAY', syllables: 2, language: 'es'),
        Word(word: 'NOCHE', translation: 'NIGHT', syllables: 2, language: 'es'),
        Word(word: 'ESTRELLA', translation: 'STAR', syllables: 4, language: 'es'),
        Word(word: 'AMIGO', translation: 'FRIEND', syllables: 3, language: 'es'),
        Word(word: 'SILLA', translation: 'CHAIR', syllables: 2, language: 'es'),
        Word(word: 'MESA', translation: 'TABLE', syllables: 2, language: 'es'),
        Word(word: 'VENTANA', translation: 'WINDOW', syllables: 4, language: 'es'),
        Word(word: 'COCHE', translation: 'CAR', syllables: 2, language: 'es'),
        Word(word: 'PADRE', translation: 'FATHER', syllables: 2, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 3: 2 syllable words (20 words)
    ReadingLevel(
      level: 3,
      words: [
        Word(word: 'ESCUELA', translation: 'SCHOOL', syllables: 4, language: 'es'),
        Word(word: 'COLORES', translation: 'COLORS', syllables: 4, language: 'es'),
        Word(word: 'ANIMALES', translation: 'ANIMALS', syllables: 5, language: 'es'),
        Word(word: 'TELÉFONO', translation: 'PHONE', syllables: 4, language: 'es'),
        Word(word: 'FAMILIA', translation: 'FAMILY', syllables: 4, language: 'es'),
        Word(word: 'HERMANO', translation: 'BROTHER', syllables: 4, language: 'es'),
        Word(word: 'HERMANA', translation: 'SISTER', syllables: 4, language: 'es'),
        Word(word: 'MUNDO', translation: 'WORLD', syllables: 2, language: 'es'),
        Word(word: 'AMOR', translation: 'LOVE', syllables: 2, language: 'es'),
        Word(word: 'PADRES', translation: 'PARENTS', syllables: 3, language: 'es'),
        Word(word: 'MAESTRO', translation: 'TEACHER', syllables: 4, language: 'es'),
        Word(word: 'LIBRETA', translation: 'NOTEBOOK', syllables: 4, language: 'es'),
        Word(word: 'CUADERNO', translation: 'NOTEBOOK', syllables: 4, language: 'es'),
        Word(word: 'LÁPIZ', translation: 'PENCIL', syllables: 3, language: 'es'),
        Word(word: 'PAPEL', translation: 'PAPER', syllables: 3, language: 'es'),
        Word(word: 'DULCE', translation: 'CANDY', syllables: 2, language: 'es'),
        Word(word: 'BEBIDA', translation: 'DRINK', syllables: 3, language: 'es'),
        Word(word: 'COMIDA', translation: 'FOOD', syllables: 3, language: 'es'),
        Word(word: 'FRUTA', translation: 'FRUIT', syllables: 3, language: 'es'),
        Word(word: 'VERDURA', translation: 'VEGETABLE', syllables: 4, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 4: 2-3 syllable words (20 words)
    ReadingLevel(
      level: 4,
      words: [
        Word(word: 'ABUELO', translation: 'GRANDFATHER', syllables: 3, language: 'es'),
        Word(word: 'ABUELA', translation: 'GRANDMOTHER', syllables: 3, language: 'es'),
        Word(word: 'JARDÍN', translation: 'GARDEN', syllables: 2, language: 'es'),
        Word(word: 'CERCA', translation: 'NEAR', syllables: 2, language: 'es'),
        Word(word: 'LEJOS', translation: 'FAR', syllables: 2, language: 'es'),
        Word(word: 'GRANDE', translation: 'BIG', syllables: 2, language: 'es'),
        Word(word: 'PEQUEÑO', translation: 'SMALL', syllables: 3, language: 'es'),
        Word(word: 'BONITO', translation: 'BEAUTIFUL', syllables: 3, language: 'es'),
        Word(word: 'HERMOSO', translation: 'BEAUTIFUL', syllables: 3, language: 'es'),
        Word(word: 'FELIZ', translation: 'HAPPY', syllables: 2, language: 'es'),
        Word(word: 'TRISTE', translation: 'SAD', syllables: 2, language: 'es'),
        Word(word: 'BRAVO', translation: 'ANGRY', syllables: 2, language: 'es'),
        Word(word: 'ENCANTADO', translation: 'DELIGHTED', syllables: 5, language: 'es'),
        Word(word: 'SORPRENDIDO', translation: 'SURPRISED', syllables: 5, language: 'es'),
        Word(word: 'ENTUSIASMO', translation: 'ENTHUSIASM', syllables: 5, language: 'es'),
        Word(word: 'MARIPOSA', translation: 'BUTTERFLY', syllables: 4, language: 'es'),
        Word(word: 'ELEFANTE', translation: 'ELEPHANT', syllables: 4, language: 'es'),
        Word(word: 'LEÓN', translation: 'LION', syllables: 2, language: 'es'),
        Word(word: 'TIGRE', translation: 'TIGER', syllables: 2, language: 'es'),
        Word(word: 'CONEJO', translation: 'RABBIT', syllables: 3, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 5: 3 syllable words (25 words)
    ReadingLevel(
      level: 5,
      words: [
        Word(word: 'MUNDO', translation: 'WORLD', syllables: 2, language: 'es'),
        Word(word: 'CAMINO', translation: 'ROAD', syllables: 3, language: 'es'),
        Word(word: 'JOVEN', translation: 'YOUNG', syllables: 2, language: 'es'),
        Word(word: 'TRABAJO', translation: 'WORK', syllables: 3, language: 'es'),
        Word(word: 'ESCAPE', translation: 'ESCAPE', syllables: 3, language: 'es'),
        Word(word: 'SILLA', translation: 'CHAIR', syllables: 2, language: 'es'),
        Word(word: 'PUEBLO', translation: 'TOWN', syllables: 2, language: 'es'),
        Word(word: 'RIO', translation: 'RIVER', syllables: 2, language: 'es'),
        Word(word: 'MONTE', translation: 'MOUNTAIN', syllables: 2, language: 'es'),
        Word(word: 'PLAYA', translation: 'BEACH', syllables: 2, language: 'es'),
        Word(word: 'BOSQUE', translation: 'FOREST', syllables: 2, language: 'es'),
        Word(word: 'CIUDAD', translation: 'CITY', syllables: 3, language: 'es'),
        Word(word: 'PAÍS', translation: 'COUNTRY', syllables: 2, language: 'es'),
        Word(word: 'CARRETERA', translation: 'HIGHWAY', syllables: 4, language: 'es'),
        Word(word: 'AVIONETA', translation: 'AIRPLANE', syllables: 4, language: 'es'),
        Word(word: 'BARCO', translation: 'BOAT', syllables: 2, language: 'es'),
        Word(word: 'TREN', translation: 'TRAIN', syllables: 1, language: 'es'),
        Word(word: 'AUTOBÚS', translation: 'BUS', syllables: 4, language: 'es'),
        Word(word: 'BICICLETA', translation: 'BICYCLE', syllables: 4, language: 'es'),
        Word(word: 'AVIÓN', translation: 'PLANE', syllables: 3, language: 'es'),
        Word(word: 'HELICÓPTERO', translation: 'HELICOPTER', syllables: 5, language: 'es'),
        Word(word: 'COHETE', translation: 'ROCKET', syllables: 3, language: 'es'),
        Word(word: 'NAVE', translation: 'SHIP', syllables: 2, language: 'es'),
        Word(word: 'ESTACIÓN', translation: 'STATION', syllables: 4, language: 'es'),
        Word(word: 'AEROPUERTO', translation: 'AIRPORT', syllables: 5, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 6: 3-4 syllable words (25 words)
    ReadingLevel(
      level: 6,
      words: [
        Word(word: 'IMPORTANTE', translation: 'IMPORTANT', syllables: 5, language: 'es'),
        Word(word: 'DIFÍCIL', translation: 'DIFFICULT', syllables: 3, language: 'es'),
        Word(word: 'FÁCIL', translation: 'EASY', syllables: 3, language: 'es'),
        Word(word: 'INTERESANTE', translation: 'INTERESTING', syllables: 6, language: 'es'),
        Word(word: 'ABURRIDO', translation: 'BORING', syllables: 4, language: 'es'),
        Word(word: 'DIVERTIDO', translation: 'FUN', syllables: 4, language: 'es'),
        Word(word: 'ESPECTÁCULAR', translation: 'SPECTACULAR', syllables: 6, language: 'es'),
        Word(word: 'MARAVILLOSO', translation: 'WONDERFUL', syllables: 5, language: 'es'),
        Word(word: 'FANTASTICO', translation: 'FANTASTIC', syllables: 4, language: 'es'),
        Word(word: 'INCREÍBLE', translation: 'INCREDIBLE', syllables: 5, language: 'es'),
        Word(word: 'HAMBRIENTO', translation: 'HUNGRY', syllables: 4, language: 'es'),
        Word(word: 'SEDIENTO', translation: 'THIRSTY', syllables: 3, language: 'es'),
        Word(word: 'CANSADO', translation: 'TIRED', syllables: 3, language: 'es'),
        Word(word: 'CONTENTO', translation: 'CONTENT', syllables: 3, language: 'es'),
        Word(word: 'PREOCUPADO', translation: 'WORRIED', syllables: 5, language: 'es'),
        Word(word: 'ANCIANO', translation: 'ELDERLY', syllables: 3, language: 'es'),
        Word(word: 'JOVEN', translation: 'YOUNG', syllables: 2, language: 'es'),
        Word(word: 'BEBÉ', translation: 'BABY', syllables: 2, language: 'es'),
        Word(word: 'ADOLESCENTE', translation: 'TEENAGER', syllables: 5, language: 'es'),
        Word(word: 'PROFESOR', translation: 'PROFESSOR', syllables: 4, language: 'es'),
        Word(word: 'ESTUDIANTE', translation: 'STUDENT', syllables: 4, language: 'es'),
        Word(word: 'DOCTOR', translation: 'DOCTOR', syllables: 3, language: 'es'),
        Word(word: 'INGENIERO', translation: 'ENGINEER', syllables: 4, language: 'es'),
        Word(word: 'ARTISTA', translation: 'ARTIST', syllables: 4, language: 'es'),
        Word(word: 'MÚSICO', translation: 'MUSICIAN', syllables: 3, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 7: 4+ syllable words (25 words)
    ReadingLevel(
      level: 7,
      words: [
        Word(word: 'EDUCACIÓN', translation: 'EDUCATION', syllables: 5, language: 'es'),
        Word(word: 'UNIVERSIDAD', translation: 'UNIVERSITY', syllables: 6, language: 'es'),
        Word(word: 'BIBLIOTECA', translation: 'LIBRARY', syllables: 5, language: 'es'),
        Word(word: 'HOSPITAL', translation: 'HOSPITAL', syllables: 4, language: 'es'),
        Word(word: 'RESTAURANTE', translation: 'RESTAURANT', syllables: 5, language: 'es'),
        Word(word: 'HOTEL', translation: 'HOTEL', syllables: 3, language: 'es'),
        Word(word: 'SUPERMERCADO', translation: 'SUPERMARKET', syllables: 6, language: 'es'),
        Word(word: 'PISCINA', translation: 'POOL', syllables: 3, language: 'es'),
        Word(word: 'GIMNASIO', translation: 'GYM', syllables: 4, language: 'es'),
        Word(word: 'TEATRO', translation: 'THEATER', syllables: 3, language: 'es'),
        Word(word: 'CINE', translation: 'CINEMA', syllables: 2, language: 'es'),
        Word(word: 'MÚSEO', translation: 'MUSEUM', syllables: 3, language: 'es'),
        Word(word: 'PARQUE', translation: 'PARK', syllables: 2, language: 'es'),
        Word(word: 'JARDÍN', translation: 'GARDEN', syllables: 2, language: 'es'),
        Word(word: 'ZOOLÓGICO', translation: 'ZOO', syllables: 5, language: 'es'),
        Word(word: 'ACUARIO', translation: 'AQUARIUM', syllables: 4, language: 'es'),
        Word(word: 'CIRCULAR', translation: 'CIRCULAR', syllables: 4, language: 'es'),
        Word(word: 'TRIANGULAR', translation: 'TRIANGULAR', syllables: 5, language: 'es'),
        Word(word: 'RECTANGULAR', translation: 'RECTANGULAR', syllables: 5, language: 'es'),
        Word(word: 'CUADRADO', translation: 'SQUARE', syllables: 3, language: 'es'),
        Word(word: 'CIRCULO', translation: 'CIRCLE', syllables: 3, language: 'es'),
        Word(word: 'ELEFANTE', translation: 'ELEPHANT', syllables: 4, language: 'es'),
        Word(word: 'JIRAFA', translation: 'GIRAFFE', syllables: 3, language: 'es'),
        Word(word: 'COCODRILO', translation: 'CROCODILE', syllables: 4, language: 'es'),
        Word(word: 'HIPOPÓTAMO', translation: 'HIPPO', syllables: 5, language: 'es'),
      ],
      passThreshold: 0.8,
    ),

    // Level 8: Advanced words (30 words)
    ReadingLevel(
      level: 8,
      words: [
        Word(word: 'EXTRAORDINARIO', translation: 'EXTRAORDINARY', syllables: 7, language: 'es'),
        Word(word: 'INCREÍBLEMENTE', translation: 'INCREDIBLY', syllables: 6, language: 'es'),
        Word(word: 'FANTÁSTICAMENTE', translation: 'FANTASTICALLY', syllables: 6, language: 'es'),
        Word(word: 'ESPONTÁNEO', translation: 'SPONTANEOUS', syllables: 5, language: 'es'),
        Word(word: 'ENTUSIASTAMENTE', translation: 'ENTHUSIASTICALLY', syllables: 7, language: 'es'),
        Word(word: 'INTELIGENTE', translation: 'INTELLIGENT', syllables: 5, language: 'es'),
        Word(word: 'CREATIVO', translation: 'CREATIVE', syllables: 4, language: 'es'),
        Word(word: 'PERSONALIDAD', translation: 'PERSONALITY', syllables: 6, language: 'es'),
        Word(word: 'CARACTERÍSTICA', translation: 'CHARACTERISTIC', syllables: 7, language: 'es'),
        Word(word: 'RELACIONES', translation: 'RELATIONSHIPS', syllables: 5, language: 'es'),
        Word(word: 'EXPERIENCIA', translation: 'EXPERIENCE', syllables: 5, language: 'es'),
        Word(word: 'CONOCIMIENTO', translation: 'KNOWLEDGE', syllables: 6, language: 'es'),
        Word(word: 'POSIBILIDAD', translation: 'POSSIBILITY', syllables: 6, language: 'es'),
        Word(word: 'IMPORTANTÍSIMO', translation: 'VERY IMPORTANT', syllables: 6, language: 'es'),
        Word(word: 'FANTÁSTICO', translation: 'FANTASTIC', syllables: 4, language: 'es'),
        Word(word: 'INOLVIDABLE', translation: 'UNFORGETTABLE', syllables: 5, language: 'es'),
        Word(word: 'ESPERANZA', translation: 'HOPE', syllables: 4, language: 'es'),
        Word(word: 'ALEGRÍA', translation: 'JOY', syllables: 4, language: 'es'),
        Word(word: 'TRIUNFO', translation: 'TRIUMPH', syllables: 3, language: 'es'),
        Word(word: 'VICTORIA', translation: 'VICTORY', syllables: 4, language: 'es'),
        Word(word: 'CELEBRACIÓN', translation: 'CELEBRATION', syllables: 5, language: 'es'),
        Word(word: 'FESTIVAL', translation: 'FESTIVAL', syllables: 4, language: 'es'),
        Word(word: 'AVENTURA', translation: 'ADVENTURE', syllables: 4, language: 'es'),
        Word(word: 'DESCUBRIMIENTO', translation: 'DISCOVERY', syllables: 6, language: 'es'),
        Word(word: 'EXPLORACIÓN', translation: 'EXPLORATION', syllables: 6, language: 'es'),
        Word(word: 'INVESTIGACIÓN', translation: 'INVESTIGATION', syllables: 7, language: 'es'),
        Word(word: 'EXPERIMENTO', translation: 'EXPERIMENT', syllables: 5, language: 'es'),
        Word(word: 'CIENTÍFICO', translation: 'SCIENTIFIC', syllables: 5, language: 'es'),
        Word(word: 'TECNOLOGÍA', translation: 'TECHNOLOGY', syllables: 5, language: 'es'),
        Word(word: 'DESCUBRIR', translation: 'TO DISCOVER', syllables: 4, language: 'es'),
      ],
      passThreshold: 0.8,
    ),
  ];
}

class ReadingLevel {
  final int level;
  final List<Word> words;
  final double passThreshold;

  const ReadingLevel({
    required this.level,
    required this.words,
    this.passThreshold = 0.8,
  });
}

class Word {
  final String word;
  final String translation;
  final int syllables;
  final String language; // 'es' for Spanish, 'en' for English

  const Word({
    required this.word,
    required this.translation,
    required this.syllables,
    required this.language,
  });
}
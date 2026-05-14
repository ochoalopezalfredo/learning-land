# Learning Land

App educacional para niños (~6 años). Aprender a leer con palabras por sílabas + matemáticas por niveles. Estilo Duolingo con mascot T-Rex verde "Rex".

## Tech Stack
- Flutter (iOS + Android)
- Riverpod 2.0 (state management)
- go_router (navigation)
- Firebase Auth + Firestore (cloud sync)
- speech_to_text + fuzzy matching (pronunciación)
- flutter_animate + lottie (animaciones)
- audioplayers (efectos de sonido)

## Estructura
```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── theme/          # app_colors, app_typography, app_theme
│   ├── constants/      # word_lists (8 niveles), math_problems (9 niveles)
│   └── utils/          # pronunciation_checker, audio_manager
└── features/
    ├── splash/
    ├── home/
    ├── reading/
    ├── math/
    └── profile/
```

## Features Pendientes
| # | Branch | Descripción |
|---|--------|-------------|
| 2 | `feature/splash-onboarding` | Splash animado + 3 slides onboarding |
| 3 | `feature/auth-profile` | Firebase Auth + perfil niño |
| 4 | `feature/home-dashboard` | Dashboard completo con Rex |
| 5 | `feature/reading-mode` | Sistema lectura con speech recognition |
| 6 | `feature/speech-recognition` | Integración voz completa |
| 7 | `feature/math-mode` | Matemáticas con 4-choice buttons |
| 8 | `feature/gamification` | XP, streaks, badges |
| 9 | `feature/profile-progress` | Stats y logros |

Feature 1 (setup) completada.

## UI Concept
- `ui-concept.html` - prototipo navegable con 4 pantallas
- Mascota: Rex 🦖 verde cute T-Rex
- Colores: verde Duolingo (#58CC02), morado (#8854D0), amarillo (#FFD800)

## Repo
https://github.com/ochoalopezalfredo/learning-land

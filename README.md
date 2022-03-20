# Pokedex

An app that consumes a public api from [PokeApi](https://pokeapi.co/)

## Getting Started

This project was made with [Flutter](https://flutter.dev/)

## Project structure
```
.
└── lib/
    ├── common (Common datasources, models, provider, etc)/
    │   ├── datasources
    │   ├── models
    │   ├── providers
    │   └── repositories
    ├── core (Things such as network providers and environment configurations)
    ├── routing (App navigation)
    ├── ui (Pages and flows for the app)/
    │   ├── flows (App flows and modules)
    │   ├── theme (Colors, themes, etc)
    │   └── widgets (Ui componentes to be reused in the app)
    └── utils (App utilities)
```
## Dependencies
- flutter_hooks
- dio
- freezed_annotation
- json_annotation
- hooks_riverpod
- logger
- image
- shimmer
- lottie
- fluro

## Dev dependencies
- freezed
- build_runner
- json_serializable

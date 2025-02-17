# Clean Architecture Flutter App with BLoC

## Project Overview
This Flutter project follows the **Clean Architecture** principles and uses the **BLoC (Business Logic Component)** pattern for state management. The app is structured into well-defined layers to ensure separation of concerns and maintainability.

## Project Structure
```
lib/
│── config/                      # Configuration files
│── core/                        # Core utilities (constants, use cases, helpers)
│   ├── constants/               # App-wide constants
│   ├── resources/               # Data state management
│   ├── usecases/                # Use cases (application business logic)
│   ├── util/                    # Utility functions
│
│── features/daily_news/         # Feature module
│   ├── data/
│   │   ├── data_sources/
│   │   │   ├── remote/          # Remote data sources (API services)
│   │   │   │   ├── news_api_service.dart
│   │   │   │   ├── news_api_service.g.dart (Generated)
│   │   ├── models/              # Data models
│   │   ├── repository/          # Repository implementation
│   ├── domain/
│   │   ├── entities/            # Domain entities
│   │   ├── repository/          # Abstract repository definitions
│   │   ├── usecases/            # Business logic use cases
│   ├── presentation/
│   │   ├── bloc/                # BLoC state management
│   │   ├── pages/               # UI pages
│   │   ├── widgets/             # Reusable widgets
│── main.dart                    # App entry point
```

## Dependencies
This project uses the following dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.0.0  # BLoC state management
  equatable: ^2.0.7     # Value equality for Dart objects
  get_it: ^8.0.3        # Dependency injection
  intl: ^0.20.2         # Internationalization
  floor: ^1.5.0         # Local database ORM
  retrofit: ^4.4.2      # API calls generation
  flutter_hooks: ^0.20.5 # Hooks for stateful logic
  cached_network_image: ^3.4.1 # Caching images
  dio: ^5.8.0+1         # HTTP requests

dev_dependencies:
  flutter_test:
    sdk: flutter
  retrofit_generator: ^9.1.9  # Retrofit code generation
  floor_generator: ^1.5.0     # Floor database generator
  build_runner: ^2.4.15       # Code generation
```

## Key Features
- **Clean Architecture**: Separation of concerns using **Data, Domain, and Presentation** layers.
- **BLoC for State Management**: Ensures reactive and testable UI logic.
- **Dependency Injection**: Uses **GetIt** for service location.
- **Networking with Dio & Retrofit**: Efficient API handling with automatic serialization.
- **Local Storage with Floor**: SQLite ORM for caching data.
- **Modular Feature Organization**: Each feature has its own isolated layers.

## Getting Started
### 1. Clone the Repository
```sh
git clone https://github.com/your-repo/news-app-with-clean-arch.git
cd news-app-with-clean-arch
```

### 2. Install Dependencies
```sh
flutter pub get
```

### 3. Generate Code (Retrofit & Floor)
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the App
```sh
flutter run
```

## How Clean Architecture Works
### 1. **Data Layer**
Handles:
- API calls (via Retrofit and Dio)
- Local database storage (via Floor)
- Data transformation (from API models to domain entities)

### 2. **Domain Layer**
Handles:
- Business rules and application logic
- Use cases that orchestrate repository interactions

### 3. **Presentation Layer**
Handles:
- UI logic with **BLoC** state management
- UI screens and widgets

## Example BLoC Implementation
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {}

// States
abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}
class NewsLoaded extends NewsState {
  final List<ArticleEntity> articles;
  NewsLoaded(this.articles);
}
class NewsError extends NewsState {}

// BLoC
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNews;

  NewsBloc(this.getNews) : super(NewsLoading()) {
    on<FetchNews>((event, emit) async {
      try {
        final news = await getNews();
        emit(NewsLoaded(news));
      } catch (e) {
        emit(NewsError());
      }
    });
  }
}
```

## Contribution Guide
1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

---

This README provides a detailed overview of your project, making it easier for developers to understand and contribute. 🚀

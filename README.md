
```markdown
# Flutter Task Manager App

A robust and responsive task management application built with Flutter and Firebase. This project was developed as an internship assignment to demonstrate full-stack mobile development capabilities, including secure authentication, real-time database management, and third-party API integration.

## 🚀 Features

- **User Authentication**: Secure email/password Sign Up and Login powered by Firebase Authentication.
- **Task Management**: Full CRUD (Create, Read, Update, Delete) operations with data persisted in Cloud Firestore.
- **Real-time Sync**: Uses StreamBuilders to reflect database changes instantly without page refreshes.
- **REST API Integration**: Displays motivational quotes fetched dynamically from an external API service.
- **Modern UI**: Built using Material 3 principles with intuitive navigation and form validation.

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend**: Firebase (Auth & Firestore)
- **Networking**: Http package for REST API calls
- **State Management**: setState / Provider

## 📂 Project Structure

The project follows a clean, modular architecture:
- `lib/models/`: Data models for Tasks and Quotes.
- `lib/services/`: Logic for Firebase Auth, Firestore operations, and API fetching.
- `lib/screens/`: UI components for Authentication and Task Management.
- `lib/widgets/`: Reusable UI elements like Task Tiles and Custom Buttons.
- `lib/main.dart`: Application initialization and routing.

## ⚙️ Setup & Installation

### Prerequisites
- Flutter SDK (Stable channel)
- A mobile emulator (Android/iOS) or physical device
- Firebase account and a project configured for Flutter

### Step-by-Step Installation

1. **Clone the Repository**
   ```bash
   git clone [https://github.com/SATYA-1919/task-manager-app.git](https://github.com/SATYA-1919/task-manager-app.git)
   cd task-manager-app

```

2. **Install Dependencies**
```bash
flutter pub get

```


3. **Firebase Configuration**
* Ensure the `firebase_options.dart` file is present in the `lib/` directory or run `flutterfire configure` to link your local environment to your Firebase project.


4. **Run the Application**
```bash
flutter run

```



## 📝 Important Note on Firestore Indexing

This application requires a composite index to support sorting tasks by date. If tasks do not appear in the list, navigate to the Firebase Console -> Firestore Database -> Indexes and ensure an index is enabled for the `tasks` collection with the following fields:

* `isCompleted` (Ascending)
* `date` (Descending)

## 👤 Author

**Satyaki Tirumal**
BTech (Electronics and Computer Engineering)
Mahindra University

```

```

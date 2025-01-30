# World Time Mobile App

A simple Flutter application that displays the current time for different locations using an API.

## Features
- Fetches real-time data using the `timeapi.io` API
- Displays current time for a selected location
- Allows users to edit and choose a different location
- Implements navigation between different screens

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/loisramses/WorldTimeMobileApp.git
   ```
2. Navigate to the project directory:
   ```sh
   cd WorldTimeMobileApp
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart              # Entry point of the application
├── pages/
│   ├── home.dart          # Home screen
│   ├── choose_location.dart # Location selection screen
│   ├── loading.dart       # Loading screen
└── services/
    └── world_time.dart    # Handles API requests
```

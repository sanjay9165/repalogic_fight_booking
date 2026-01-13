# Flight Booking Application

A modern Flutter-based flight booking application that allows users to search for flights, view flight details, and complete bookings with a clean and intuitive user interface.

## 📱 About the Project

This flight booking application is built with Flutter and follows a feature-first architecture pattern. It provides a seamless experience for users to:

- **Search Flights**: Search for available flights by selecting origin, destination, and travel date
- **Browse Results**: View a list of available flights with detailed information including price, duration, and airline
- **View Details**: Check comprehensive flight details before booking
- **Complete Booking**: Fill in passenger information and confirm flight bookings
- **Booking Confirmation**: Receive instant booking confirmation with booking details


## 🛠️ Tech Stack

- **Framework**: Flutter 3.10.3+
- **Language**: Dart
- **State Management**: Provider (v6.1.5+1)
- **HTTP Client**: http (v1.6.0)
- **Date Formatting**: intl (v0.20.2)
- **Custom Fonts**: Ulagadi Sans, Bell MT, Perpetua Titling MT

## ✨ Features

### Core Features
- Flight search with origin, destination, and date filters
- Real-time flight availability checking
- Detailed flight information display
- Multi-passenger booking support
- Form validation for passenger details
- Booking confirmation screen
- Mock data service for demonstration


### Run the Application

#### For Android:
```bash
# Connect an Android device or start an emulator, then:
flutter run
```

### Build Release Version

#### Android APK:
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### Android App Bundle:
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```
```
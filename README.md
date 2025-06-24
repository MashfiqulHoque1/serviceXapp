# servicexapp:

**ServiceX** is a service marketplace app built with **Flutter** that allows users to browse services, 
view providers, and manage bookings. It includes real-time data, a clean user interface, and a bottom 
navigation bar to switch between different sections like Home, Options, Comments, Jobs, and Profile.

## Features:

- **Home Screen** with:
    - Real-time clock
    - Search bar inside a stylized blue header
    - API-based dynamic content (e.g., categories, featured services, slider Offers, provider list)

-**Search Bar** (embedded in header)
-**Notification & Cart Buttons** (clickable but no output)
**Bottom Navigation Bar** with 5 screens:
    - Home
    - Options
    - Comments
    - Job
    - Profile

---

## Tech Stack:

- **Flutter** (Material 3)
- **Provider** for state management
- **Intl** for time formatting
  - **http** for  Access real-time data from your backend or a public API; 
                Display categories, services, sliders, etc. that are dynamic; 
                Keep your app fresh and updated by pulling new content from the server.
- **Like Button** and **Timeago** packages
- Backend/API integration via custom Provider

---

##  Dependencies:

copy the dependencies and paste in pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  intl: ^0.18.1
  like_button: ^2.0.5
  timeago: ^3.4.0


## Setup Instructions:
1. Clone the Repository
   In vscode or android studio terminal:
   git clone https://github.com/yourusername/servicex-app.git
   cd servicex-app
2. Install Dependencies: In vscode or android studio terminal:
   flutter pub get
3. Run the App: In vscode or android studio terminal:
   flutter run

## Folder Structure:
lib/
├── main.dart               # App entry point
├── home_screen.dart        # Home page UI
├── home_provider.dart      # API & state management
├── test_api_screen.dart    # Optional testing screen




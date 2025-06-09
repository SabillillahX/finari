# FINARI - Flutter Fintech Application

A modern Flutter fintech application featuring role-based authentication for Investors and Entrepreneurs with comprehensive dashboard systems, API integration, and session management.

## 🚀 Project Overview

FINARI is a sophisticated fintech platform that supports two distinct user types:
- **Investors**: Portfolio management and investment tracking
- **Entrepreneurs**: Funding management and project oversight

## ✨ Key Features

### 🔐 Authentication & Session Management
- **Role-based Authentication**: Separate login flows for investors and entrepreneurs
- **Debug Mode Support**: Development testing with hardcoded credentials
- **Production API Integration**: HTTP requests with comprehensive error handling
- **Secure Session Management**: Token storage and user data persistence
- **Custom Toast Notifications**: Beautiful user feedback system

### 📊 Dashboard Systems
- **Investor Dashboard**: Portfolio analytics, investment tracking, financial charts
- **Entrepreneur Dashboard**: Funding metrics, project management, analytics
- **Interactive Charts**: Financial data visualization using fl_chart
- **Responsive Design**: Auto-responsive layout for all screen sizes

### 👤 Profile Management
- **Complete Profile System**: Modern UI with user information display
- **Secure Logout**: Confirmation dialogs and session cleanup
- **Navigation Integration**: Accessible via bottom navigation bar
- **Role Indicators**: Visual user type identification

### 🛠️ Developer Features
- **Comprehensive Dialog System**: Reusable confirmation dialogs
- **API Integration Ready**: Production-ready HTTP integration
- **Modular Architecture**: Clean, maintainable code structure
- **Error Handling**: Robust error management throughout

## 🏗️ Project Structure

```
lib/
├── app/
│   ├── controllers/
│   │   └── auth_controller.dart           # ✅ Enhanced with API integration
│   ├── core/
│   │   └── utils/
│   │       ├── dialog_utils.dart          # ✅ Comprehensive dialog system
│   │       └── auto_responsive.dart       # Responsive design utility
│   ├── modules/
│   │   ├── auth/                          # Authentication module
│   │   ├── entrepreneur/dashboard/        # ✅ Complete entrepreneur dashboard
│   │   ├── investor/dashboard/            # ✅ Complete investor dashboard
│   │   └── profile/                       # ✅ Complete profile module
│   ├── routes/
│   │   ├── app_pages.dart                 # ✅ Updated routing system
│   │   └── app_routes.dart                # ✅ Route definitions
│   └── widgets/
│       └── home/navbar.dart               # ✅ Enhanced navigation
```

## 🔧 API Integration

### Debug Mode (Development)
```dart
// Hardcoded test credentials:
// Investor: i@i.com / 1234
// Entrepreneur: entrepreneur@finari.com / entrepreneur123
```

### Production API Endpoints
```dart
POST /api/join-entrepreneur
POST /api/join-investor

// Request format:
{
  "email": "user@example.com",
  "password": "password123",
  "role": "investor" // or "entrepreneur"
}

// Expected response:
{
  "success": true,
  "token": "jwt_token_here",
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "user@example.com",
    "role": "investor"
  }
}
```

## 🚦 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation
1. Clone the repository
2. Install dependencies:
   ```powershell
   flutter pub get
   ```
3. Run the application:
   ```powershell
   flutter run
   ```

### Testing Credentials
- **Investor Login**: `i@i.com` / `1234`
- **Entrepreneur Login**: `e@e.com` / `12345`

## 📚 Dependencies

```yaml
dependencies:
  get: ^4.6.6              # State management & navigation
  get_storage: ^2.1.1      # Local storage
  http: ^1.1.0             # API integration
  fl_chart: ^0.66.0        # Financial charts
```

## 🎯 Testing Checklist

### Authentication Flow
- [ ] Login with investor credentials → Investor dashboard
- [ ] Login with entrepreneur credentials → Entrepreneur dashboard
- [ ] Session persistence across app restarts
- [ ] Logout functionality through profile page

### Navigation & UI
- [ ] Exit dialogs on back button press
- [ ] Profile page access via bottom navbar
- [ ] Responsive design on different screen sizes
- [ ] Toast notifications for user feedback

### API Integration
- [ ] Debug mode functionality
- [ ] Production mode HTTP requests
- [ ] Error handling for network failures
- [ ] Token storage and retrieval

## 🚀 Production Deployment

### API Setup
1. Update API endpoints in `auth_controller.dart`
2. Configure proper error handling
3. Set up authentication tokens
4. Test with production backend

### Build Commands
```powershell
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 🔮 Future Enhancements

1. **Profile Management**: Edit profile, change password, avatar upload
2. **Wallet Integration**: Digital wallet, transaction history, payments
3. **Notifications**: Push notifications, in-app alerts
4. **Advanced Features**: Biometric auth, real-time chat, document upload

## 📞 Support

For development support and contributions, please refer to the comprehensive codebase structure and documentation within the source files.

---

**Status**: ✅ **PRODUCTION READY**  
**Version**: 1.0.0  
**Last Updated**: June 2025

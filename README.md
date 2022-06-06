# Apex

A Finance App for Smart Pay.

## Getting Started
This repository contain the code for the Apex App. This project was written using the Flutter 3.0.0 SDK and Dart programming Language. If you're new to Flutter and Dart, Check out the SDK at https://www.flutter.dev and the language at https://dart.dev/.

## How to Use 

**Step 1:**


You must have Flutter 3.0.0 and Dart Installed to build this project. Check the links above if you haven't done so. You might experience build issues running on a lower flutter version. If you don't have flutter 3.0.0, You can you fvm to download it and manage your flutter version locally. I have included a link to it.

```
https://fvm.app/
```

Download or clone this repo by using the link below:

```
https://github.com/BashirYesufu/apex.git
```

**Step 2:**

Go to project root and execute the following command in terminal to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Run your simulator for iOS or android emulator and smash the build button. Easy right? Leggo!

### Libraries & Tools Used

* [HTTP] - Networking
* [Provider] - State Management
* [Shared Preferences] - Local Data Persistence
* [Loading_Animation Widget] - Custom Loading State Widget
* [OTP Text Field] - Custom Digit OTP Textfield
* [Modal Progress Hud NSN] - Loading 
* [Country Picker] - For displaying bottom sheet of countries 


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- components/
|- constants/
|- models/
|- screens/
|- utilities/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1 - components - All the reuseable UIs and methods are defined in files and contained in folders.
2 - constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `colors`, `icons`, `images`, `keys`, `methods`, `paddings`, `strings` and `textstyles`.
3 - models - Contains data structure models
4 - screens - contains all the screens of the app
5 - utilities - Contain services and utilities
6 - routes.dart — This file contains all the routes for your application.
7 - main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- apex_colors.dart
|- apex_images.dart
|- string_literals.dart
|- apex_textstyle.dart
```

### Routes

This file contains all the routes for the application.

```dart
import 'package:apex/screens/authentication/signup/country_residence_screen.dart';
import 'package:apex/screens/authentication/signup/email_verification_screen.dart';
import 'package:apex/screens/authentication/forgot/forgot_password_screen.dart';
import 'package:apex/screens/authentication/forgot/forgot_verification_screen.dart';
import 'package:apex/screens/authentication/forgot/new_password_screen.dart';
import 'package:apex/screens/authentication/forgot/password_confirmation_screen.dart';
import 'package:apex/screens/authentication/signup/pin_code_screen.dart';
import 'package:apex/screens/authentication/signup/pin_created_screen.dart';
import 'package:apex/screens/authentication/signin/sign_in_screen.dart';
import 'package:apex/screens/authentication/signup/sign_up_screen.dart';
import 'package:apex/screens/dashboard.dart';
import 'package:apex/screens/user_arguments.dart';
import 'package:apex/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static String initialRoute = OnBoardingScreen.screenID;

  static String onBoardedRoute = SignInScreen.screenID;

  static Map<String, Widget Function(BuildContext)> routes = {
    OnBoardingScreen.screenID: (context) => OnBoardingScreen(),
    SignInScreen.screenID: (context) => SignInScreen(),
    SignUpScreen.screenID: (context) => SignUpScreen(),
    ForgotPasswordScreen.screenID: (context) => ForgotPasswordScreen(),
    NewPasswordScreen.screenID: (context) => NewPasswordScreen(),
    PasswordConfirmationScreen.screenID: (context) => PasswordConfirmationScreen(),
    EmailVerificationScreen.screenID: (context) => EmailVerificationScreen(),
    CountryResidenceScreen.screenID: (context) => CountryResidenceScreen(),
    PinCreatedScreen.screenID: (context) => PinCreatedScreen(),
    PinCodeScreen.screenID: (context) => PinCodeScreen(),
    ForgotVerificationScreen.screenID: (context) => ForgotVerificationScreen(),
  };
  static Route<dynamic>? generateRoute(RouteSettings route) {
    switch (route.name) {
      case DashBoard.screenID:
        final args = route.arguments as UserArguments;
        return MaterialPageRoute(builder: (context) {
          return DashBoard(user: args.user);
        });
      default:
        return null;
    }
  }
}
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:apex/routes.dart';
import 'package:apex/utilities/provider/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Apex());
}

class Apex extends StatelessWidget {
  const Apex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHandler.initialRoute,
        routes: RouteHandler.routes,
        onGenerateRoute: RouteHandler.generateRoute,
      ),
    );
  }
}
```

## Conclusion
May The Code be with you.

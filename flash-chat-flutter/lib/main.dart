import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

// void main() => runApp(FlashChat());
//
// class FlashChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData.dark().copyWith(
//       //   textTheme: TextTheme(
//       //     body1: TextStyle(color: Colors.black54),
//       //   ),
//       // ),
//       initialRoute: WelcomeScreen.id,
//       routes: {
//         WelcomeScreen.id: (context) => WelcomeScreen(),
//         LoginScreen.id: (context) => LoginScreen(),
//         RegistrationScreen.id: (context) => RegistrationScreen(),
//         ChatScreen.id: (context) => ChatScreen(),
//       },
//     );
//   }
// }
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return WelcomeScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              ChatScreen.id: (context) => ChatScreen(),
            },
          );
        }

        return WelcomeScreen();
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:iteso_library_project/Repositories/user_auth_repo.dart';
import 'package:iteso_library_project/pages/Search/search_page.dart';
 UserAuthRepository _authRepo = UserAuthRepository();

class Login2 extends StatelessWidget {
  const Login2({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('./assets/images/Logo_Iteso.png'),
                ),
              );
            },
          );
        }
        _authRepo.signInWithMail();
        return SearchPage();
      }),
    );
  }
}

import 'package:flutter/material.dart';

class logIn extends StatelessWidget {
  const logIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/images/Iteso_logo.jpg', height: 450, width: 450, alignment: Alignment.center),
            ),
            Text("Iniciar Sesión", textAlign: TextAlign.start, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            

          ],
        ),
      )
    );
  }
}
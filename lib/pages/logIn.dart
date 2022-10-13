import 'package:flutter/material.dart';
import 'package:iteso_library_project/pages/search_page.dart';

class logIn extends StatefulWidget {
  const logIn({
    Key? key,
  }) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
              child: Image.asset('assets/images/Iteso_logo.jpg',
                  height: 250, width: 250, alignment: Alignment.center),
            ),
          ),
          Text(
            "Iniciar Sesión",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Hola, que bueno verte de nuevo",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w100, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: userController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Email",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: !show,
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Contraseña",
                style: TextStyle(color: Colors.blue),
              ),
              suffixIcon: IconButton(
                icon: Icon(show ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  show = !show;
                  setState(() {});
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 325,
              height: 40,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Text(
                  "Ingresar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:iteso_library_project/pages/Search/search_page.dart';

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
  bool _validEmail = false;
  bool _validPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Center(
                  child: Image.asset('assets/images/Logo_Iteso.png',
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
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  errorText: _validEmail ? "Rellenar el campo" : null,
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(),
                  label: Text(
                    "Email",
                    style: TextStyle(
                        color: _validEmail ? Colors.red : Colors.blue),
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
                  errorText: _validPassword ? "Rellenar el campo" : null,
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(),
                  label: Text(
                    "Contraseña",
                    style: TextStyle(
                        color: _validPassword ? Colors.red : Colors.blue),
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
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 325,
                  height: 40,
                  child: MaterialButton(
                    color: Colors.indigo,
                    onPressed: () {
                      userController.text.isEmpty
                          ? _validEmail = true
                          : _validEmail = false;
                      passwordController.text.isEmpty
                          ? _validPassword = true
                          : _validPassword = false;
                      setState(() {});
                      if (!_validEmail && !_validPassword) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      }
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
        ),
      )),
    );
  }
}

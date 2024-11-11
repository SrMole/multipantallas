import 'package:flutter/material.dart';
import 'package:multipantallas/bienvenida.dart';

// Método main
void main() {
  runApp(const Primera());
}

class Primera extends StatelessWidget {
  const Primera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiformularios",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
      home: const Pantalla(),
    );
  }
}

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  var txtLogin = TextEditingController();
  var txtPassword = TextEditingController();
  var nombre = "";
  var clave = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/fondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Multiformularios"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 80),
            Center(
              child: Image.asset(
                "img/logo.png",
                height: 250,
              ),
            ),
            const SizedBox(height: 100),
            // Campo de texto para login
            TextField(
              textAlign: TextAlign.center,
              controller: txtLogin,
              decoration: InputDecoration(
                hintText: "Nombre de Usuario",
                prefixIcon: Icon(Icons.person, color: Colors.green),
              ),
            ),
            const SizedBox(height: 30),
            // Campo de texto para contraseña
            TextField(
              textAlign: TextAlign.center,
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Clave de Usuario",
                prefixIcon: Icon(Icons.lock, color: Colors.green),
              ),
            ),
            const SizedBox(height: 100),
            // Botón de validar
            ElevatedButton.icon(
              onPressed: () {
                nombre = txtLogin.text;
                clave = txtPassword.text;
                if (nombre == "pelochas" && clave == "123") {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Bienvenida(nombre);
                    }),
                  );
                } else {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Borde redondeado
                        ),
                        backgroundColor: Colors.white, // Fondo sólido
                        title: Row(
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.red, // Icono de error en rojo
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Advertencia",
                              style: TextStyle(
                                color: Colors.green, // Título verde
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        content: const Text(
                          "Verifica tus Credenciales",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Aceptar",
                              style: TextStyle(
                                color: Color(0xFFFFC414), // Color ámbar
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.login),
              label: const Text("Validar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC414),
                foregroundColor: Colors.white, // Texto en blanco
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30), // Espacio adicional debajo del botón
          ],
        ),
      ),
    );
  }
}

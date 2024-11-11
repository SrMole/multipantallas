import 'package:flutter/material.dart';

class Bienvenida extends StatefulWidget {
  final String name;
  const Bienvenida(this.name, {super.key});

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 235, 245),
      appBar: AppBar(
        title: const Text("Bienvenida"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 80),
          // Imagen del logo o bienvenida
          Center(
            child: Image.asset(
              "img/logo.png",
              height: 150, // Tamaño del logo
            ),
          ),
          const SizedBox(height: 50),
          // Mensaje de bienvenida
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              'Bienvenido: ${widget.name}',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: "rbold",
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60), // Espacio adicional antes del botón
          // Botón de regresar
          Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC414), // Color ámbar
                  foregroundColor: Colors.white, // Texto blanco
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                label: const Text("Regresar"),
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          const SizedBox(height: 30), // Espacio adicional debajo del botón
        ],
      ),
    );
  }
}

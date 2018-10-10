import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Streams',
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    //Parte 1: Criando uma stream simples
    print("Creating a sample stream...");
    //1. Criamos uma stream a qual coleeta os dados da função getData()
    //que retorna uma string após 5 segundos
    Stream<String> stream = new Stream.fromFuture(getData());
    print("Created the stream");

    //2. Depois, nós escutamos a stream para observar a chegada de dados com  o método .listen()

    stream.listen((data) {
      print("Data received: " + data);
    }, onDone: () {
      //Método que define que foi completado
      print("Task Done");
    }, onError: (error) {
      //Método que retorna qualquer erro que foi encontrado
      print("Some error");
    });

    ///É preciso sempre terminar a stream quando a tarefa é completada.
    ///Caso contrário, problemas de performance podem surgir quando a aplicação
    ///se tornar complexa ou caso tenha muitas stream ativas.

    print("Code controller is here");
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 5));
    print("Fetched Data");
    return "This is a test data";
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(),
    );
  }
}

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
  ///1. Estamos criando nossa stream através do StreamController
  ///Uma classe que controla a stream que é criada
  StreamController<String> streamController = new StreamController();
  @override
  void initState() {
    super.initState();

    print("Creating a StreamController...");
    streamController.stream.listen((data) {
      print("Data received: " + data);
    }, onDone: () {
      print("Task done");
      //2. Perceba que o método "onDone" não foi chamado.
      //Isso por que nossa stream está ativa e ainda não foi fechada
    }, onError: (error) {
      print("Some error");
    });

    streamController.add("This is a test data");
    print("Code controller is here");
  }

  //3. Por isso é obrigatório fechar a stream manualmente.
  //Para previnir vazamento de memória
  @override
  void dispose() {
    streamController.close();
    super.dispose();
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

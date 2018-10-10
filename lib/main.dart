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
  ///Estamos criando nossa stream através do StreamController
  ///Uma classe que controla a stream que é criada
  
  ///Agora adicionamos o parametro ".broadcast()", como o nome já diz
  ///serve para termos varias stream inscritas.
  ///Sempre que precisamos ouvir algo da mesma stream em dois ou mais lugares diferentes, simultaneamente
  ///Nós fazemos uso do ".broadcast()"
  StreamController<String> streamController = new StreamController.broadcast();

  @override
  void initState() {
    super.initState();

    print("Creating a StreamController...");

    //Primeira inscrição
    streamController.stream.listen((data) {
      print("Data received 1: " + data);
    }, onDone: () {
      print("Task done 1");
    }, onError: (error) {
      print("Some error 1");
    });

    //Segunda inscrição
    streamController.stream.listen((data) {
      print("Data Received 2: " + data);
    }, onDone: () {
      print("Task done 2");
    }, onError: (error) {
      print("Some error 2");
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

  //OBS: O método ".listen()" retorna uma StreamSubscription".
  //A documentação diz que:
  //A inscrição fornece eventos ao ouvinte (listener), e segura o callback usado para
  //cuidar dos eventos. A inscrição também pode ser usada para se desinscrever de eventos
  //ou para temporariamente pausar os eventos de uma stream.

  //Resumindo: A inscrição de uma stream pode tanto ser utilizada para pausar e resumir eventos de uma stream quando preciso.main(List<String> args) {
  //Sempre cancele a inscrição quando não for mais preciso o uso dela.

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

import 'dart:convert';

import 'package:cozinhando_casa/modelos/receita.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(body: _construirListaCard(), appBar: _construirAppBar());
  }

  Widget _construirListaCard() {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
        builder: (context, snaptshot) {
          List<dynamic> receitas = json.decode(snaptshot.data.toString());

          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Receita receita = Receita.fromJson(receitas[index]);
                return _construirCard(receita.titulo, receita.foto);
              },
              itemCount: receitas == null ? 0 : receitas.length);
        });
  }

  Widget _construirCard(titulo, foto) {
    return SizedBox(
      height: 270,
      child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _construirImagemCart(foto),
                  _construirGradienteCard(),
                  _construirTextoCart(titulo)
                ],
              )
            ],
          )),
    );
  }

  Widget _construirTextoCart(String titulo) {
    return Positioned(
      child: Text(
        titulo,
        style: TextStyle(
            fontSize: 20,
            color: Colors.white
        ),
      ),
      bottom: 10,
      left: 10,
    );
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 238,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [Colors.transparent, Colors.deepOrange.withOpacity(0.7)]),
      ),
    );
  }

  Widget _construirImagemCart(String foto) {
    return Image.asset(
      foto,
      fit: BoxFit.fill,
      height: 238,
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em Casa'));
  }
}

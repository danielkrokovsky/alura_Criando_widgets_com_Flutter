import 'package:cozinhando_casa/modelos/receita.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Detalhe extends StatelessWidget {
  final Receita receita;

  Detalhe({Key key, @required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhe();
  }

  Widget _construirDetalhe() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _construirImagemDetalhe(this.receita.foto),
            _construirTituloDetalhe(this.receita.titulo),
            _construirLinhaDetalhe(
                this.receita.porcoes, this.receita.tempoPreparo),
            _construirSubtituloDetalhe('Ingrediante'),
            _construirTextoDetalhe(this.receita.ingredientes),
            _construirSubtituloDetalhe('Modo Preparo'),
            _construirTextoDetalhe(this.receita.modoPreparo),
          ],
        ),
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImagemDetalhe(String foto) {
    return Image.asset(foto);
  }

  Widget _construirTituloDetalhe(String titulo) {
    return Text(titulo,
        style: TextStyle(color: Colors.deepOrange, fontSize: 30));
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em Casa'));
  }

  Widget _construirLinhaDetalhe(rendimento, tempo_preparo) {
    return Row(
      children: <Widget>[
        _construirColunaIconeDetalhe(Icons.restaurant, rendimento),
        _construirColunaIconeDetalhe(Icons.timer, tempo_preparo),
      ],
    );
  }

  Widget _construirSubtituloDetalhe(subtitulo) {
    return Text(
      subtitulo,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _construirTextoDetalhe(texto) {
    return Text(
      texto,
      textAlign: TextAlign.justify,
    );
  }

  Widget _construirColunaIconeDetalhe(icone, texto) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icone, color: Colors.deepOrange),
          Text(texto,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

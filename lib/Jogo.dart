import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp= AssetImage("images/padrao.png");
  var _mensagem= "Escolha sua opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes=["pedra","papel","tesoura"];
    var numero= Random().nextInt(3);
    var escolhaApp=opcoes[numero];

    //atualiza imagem do app
    setState(() {
      _imageApp= AssetImage("images/"+escolhaApp+".png");
    });

    //validacao
      if(escolhaApp==escolhaUsuario){
        _mensagem="Você empatou, próxima escolha:";
      }else if( (escolhaApp=="pedra" && escolhaUsuario=="papel")||
                (escolhaApp=="papel" && escolhaUsuario=="tesoura")||
                (escolhaApp=="tesoura" && escolhaUsuario=="pedra")
              ){
        _mensagem="Você ganhou [:)], próxima escolha:";
      }else{
        _mensagem="Você perdeu [:(] , próxima escolha:";
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpon"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
          child:
            Text("Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Image(
            image: this._imageApp,
          ),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
            Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),
                child:  Image.asset("images/pedra.png",height: 100,),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child:  Image.asset("images/papel.png",height: 100,),
              ),
              GestureDetector(
                onTap: ()=>_opcaoSelecionada("tesoura"),
                child:  Image.asset("images/tesoura.png",height: 100,),
              ),
            ],
          )
        ],
      ),
    );
  }
}

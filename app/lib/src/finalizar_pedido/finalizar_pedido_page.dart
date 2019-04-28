import 'package:app/src/finalizar_pedido/componentes/texto_widget.dart';
import 'package:flutter/material.dart';

class FinalizarPedidoPage extends StatefulWidget {
  @override
  _FinalizarPedidoPageState createState() => _FinalizarPedidoPageState();
}

class _FinalizarPedidoPageState extends State<FinalizarPedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Finalizar Pedido"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextoWidget(texto: 'Parabéns!! \n seu pedido foi realizado', fontSize: 25, color: Color.fromRGBO(27, 201, 168, 1),),
              TextoWidget(texto: 'Nº do Pedido: 123', fontSize: 20,),
            ],
          ),
        )
        /*
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Center(
              child: Container(child: Column(
                children: <Widget>[
                  Text("Nº do Pedido: 123"),


                ],
              )),
            ))
          ],
        ),
        */
      ),
    );
  }
}

import 'package:app/src/finalizar_pedido/componentes/texto_widget.dart';
import 'package:app/src/useful.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Useful.primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Useful.secondColor),
            ),
            SizedBox(height: 10,),
            TextoWidget(
              texto: 'Processando pedido...',
              fontSize: 25,
            )
          ],
        ),
      ),
    );
  }
}
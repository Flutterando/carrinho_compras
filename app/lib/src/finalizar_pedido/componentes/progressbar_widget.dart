import 'package:app/src/finalizar_pedido/componentes/texto_widget.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 10,),
            TextoWidget(
              texto: 'Carregando...',
              fontSize: 25,
            )
          ],
        ),
      ),
    );
  }
}
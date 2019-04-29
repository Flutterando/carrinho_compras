import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/finalizar_pedido/componentes/progressbar_widget.dart';
import 'package:app/src/finalizar_pedido/componentes/texto_widget.dart';
import 'package:app/src/finalizar_pedido/finalizar_pedido_bloc.dart';
import 'package:app/src/produtos/produtos_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FinalizarPedidoPage extends StatefulWidget {
  @override
  _FinalizarPedidoPageState createState() => _FinalizarPedidoPageState();
}

class _FinalizarPedidoPageState extends State<FinalizarPedidoPage> {
  FinalizarPedidoBloc bloc;

  Widget _msgSucesso() {
    return GestureDetector(
      onTap: () {
        BlocProviderList.of<CarrinhoBloc>(context).trucateList();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProdutosPage(),
          ),
        );
      },
      child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextoWidget(
                  texto: 'Parabéns!! \n seu pedido foi realizado',
                  fontSize: 25,
                  color: Color.fromRGBO(27, 201, 168, 1),
                ),
                TextoWidget(
                  texto: 'Nº do Pedido: 123',
                  fontSize: 20,
                ),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc = FinalizarPedidoBloc();

    // --
    Future.delayed(Duration(seconds: 4)).then((_) {
      bloc?.loadingEvent?.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: StreamBuilder<bool>(
            stream: bloc?.loadingFlux,
            initialData: true,
            builder: (context, snapshot) {
              Widget widgetSelecionado;

              if (snapshot.data) {
                widgetSelecionado = ProgressBarWidget();
              } else {
                widgetSelecionado = _msgSucesso();
              }
              return widgetSelecionado;
            }));
  }
}

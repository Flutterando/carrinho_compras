import 'package:app/src/app_bloc.dart';
import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'produtos/produtos_page.dart';

class App extends StatelessWidget {
  //dsdsdds

  @override
  Widget build(BuildContext context) {
    var blocs = List<Bloc>();
    blocs.add(Bloc(AppBloc()));
    blocs.add(Bloc(CarrinhoBloc()));

    return BlocProviderList(
      child: MaterialApp(
        home: ProdutosPage(),
      ),
      listBloc: blocs,
    );
  }
}

import 'package:app/src/app_bloc.dart';
import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/login/login_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'produtos/produtos_page.dart';

class App extends StatelessWidget {
  //dsdsdds

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    var blocs = List<Bloc>();
    blocs.add(Bloc(AppBloc()));
    blocs.add(Bloc(CarrinhoBloc()));

    return BlocProviderList(
      child: MaterialApp(
        home: LoginPage(), //ProdutosPage(),
      ),
      listBloc: blocs,
    );
  }
}

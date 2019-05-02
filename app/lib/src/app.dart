import 'package:app/src/produtos/produtos_bloc.dart';
import 'package:app/src/shared/repositories/general_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'carrinho/carrinho_bloc.dart';
import 'finalizar_pedido/finalizar_pedido_bloc.dart';
import 'produtos/produtos_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return BlocProvider(
      child: MaterialApp(
        home: ProdutosPage(),
      ),
      blocs: [
        Bloc((inject) => ProdutosBloc(inject.get<GeneralApi>())),
        Bloc((inject) => CarrinhoBloc()),
        Bloc((inject) => FinalizarPedidoBloc()),
      ],
      dependencies: [
        Dependency<Dio>((inject) => Dio()),
        Dependency<GeneralApi>((inject) => GeneralApi(inject.get<Dio>())),
      ],
    );
  }
}

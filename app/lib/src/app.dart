import 'package:app/src/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'produtos/produtos_page.dart';

class App extends StatelessWidget {
  //dsdsdds

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      child: MaterialApp(
        home: ProdutosPage(),
      ),
      bloc: AppBloc(),
    );
  }
}

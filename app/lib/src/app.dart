import 'package:app/src/app_bloc.dart';
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

    return BlocProvider<AppBloc>(
      child: MaterialApp(
        home: ProdutosPage(),
      ),
      bloc: AppBloc(),
    );
  }
}

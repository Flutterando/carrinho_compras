import 'package:app/src/app_bloc.dart';
import 'package:app/src/finalizar_pedido/finalizar_pedido_page.dart';
import 'package:app/src/home/home_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return BlocProvider<AppBloc>(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color.fromRGBO(30, 42, 56, 1.0),
          fontFamily: 'roboto',
        ),
        debugShowCheckedModeBanner: false,
        home: FinalizarPedidoPage(),
      ),
      bloc: AppBloc(),
    );
  }
}

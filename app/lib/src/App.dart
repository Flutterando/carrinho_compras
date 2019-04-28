import 'package:app/src/app_bloc.dart';
import 'package:app/src/home/home_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      child: MaterialApp(
        home: HomePage(),
      ),
      bloc: AppBloc(),
    );
  }
}

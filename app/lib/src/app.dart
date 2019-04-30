import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'produtos/produtos_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: ProdutosPage(),
    );
  }
}

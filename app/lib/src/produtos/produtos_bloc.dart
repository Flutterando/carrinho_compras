import 'package:app/src/shared/repositories/general_api.dart';
import 'package:rxdart/rxdart.dart';

import 'package:app/src/shared/models/produto.dart';

class ProdutosBloc {
  final GeneralApi api = GeneralApi();

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);
  Observable<List<Produto>> get listOut =>
      _listController.stream.asyncMap((v) => api.getProducts());

  refreshList() {
    _listController.add(true);
  }

  dispose() {
    _listController.close();
  }
}

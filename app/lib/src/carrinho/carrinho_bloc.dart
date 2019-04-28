import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CarrinhoBloc extends BlocBase {
  List<Object> _listaProdutos;

  var _produtosCarrinhoController = BehaviorSubject<List<Object>>();
  Observable get produtosCarrinho => _produtosCarrinhoController.stream;

  Observable<int> get totalCarrinho => _totalCarrinhoController.stream;

  var _addItemCarrinhoController = BehaviorSubject<Object>();
  var _removeItemCarrinhoController = BehaviorSubject<Object>();
  var _totalCarrinhoController = BehaviorSubject<int>();

  _handleAddItemCarrinho(Object produto) {
    _listaProdutos.add(produto);
    _produtosCarrinhoController.add(_listaProdutos);
  }

  _handleRemoveItemCarrinho(Object produto) {
    _listaProdutos.remove(produto);
    _produtosCarrinhoController.add(_listaProdutos);
  }

  CarrinhoBloc() {
    _listaProdutos = List<Object>();
    _addItemCarrinhoController.listen(_handleAddItemCarrinho);
    _removeItemCarrinhoController.listen(_handleRemoveItemCarrinho);

    _produtosCarrinhoController
        .listen((lista) => _totalCarrinhoController.add(lista.length));
  }

  @override
  void dispose() {
    _produtosCarrinhoController.close();
    _totalCarrinhoController.close();
  }
}

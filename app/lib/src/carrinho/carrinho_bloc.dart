import 'package:app/src/shared/models/produto.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CarrinhoBloc extends BlocBase {
  List<Produto> _listaProdutos;

  var _produtosCarrinhoController = BehaviorSubject<List<Produto>>();
  Observable get produtosCarrinho => _produtosCarrinhoController.stream;

  var _totalCarrinhoController = BehaviorSubject<int>();
  Observable<int> get totalCarrinho => _totalCarrinhoController.stream;

  var _addItemCarrinhoController = BehaviorSubject<Produto>();
  Sink<Produto> get addItemCarrinho => _addItemCarrinhoController.sink;

  var _removeItemCarrinhoController = BehaviorSubject<Produto>();
  Sink<Produto> get removeItemCarrinho => _removeItemCarrinhoController.sink;

  _handleAddItemCarrinho(Produto produto) {
    _listaProdutos.add(produto);
    _produtosCarrinhoController.add(_listaProdutos);
  }

  _handleRemoveItemCarrinho(Produto produto) {
    _listaProdutos.remove(produto);
    _produtosCarrinhoController.add(_listaProdutos);
  }

  CarrinhoBloc() {
    _listaProdutos = List<Produto>();
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

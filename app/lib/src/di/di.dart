import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/finalizar_pedido/finalizar_pedido_bloc.dart';
import 'package:app/src/produtos/produtos_bloc.dart';
import 'package:app/src/shared/repositories/general_api.dart';
import 'package:dio/dio.dart';
import 'package:injector/injector.dart';

class DI {
  static DI _instance;

  factory DI() {
    _instance ??= DI._internalConstructor();
    return _instance;
  }
  DI._internalConstructor() {
    injector = Injector.appInstance;
  }

  Injector injector;

  T getDependency<T>() {
    return injector.getDependency<T>();
  }

  T _gd<T>() {
    return getDependency<T>();
  }

  registerDependencies() {
    //Services
    _registerRepositories();
    //Services
    _registerDAOs();
    //Blocs
    _registerBLOCs();
  }

  void _registerBLOCs() {
    injector.registerDependency<ProdutosBloc>(
        (_) => ProdutosBloc(_gd<GeneralApi>()));

    injector.registerSingleton<CarrinhoBloc>((_) => CarrinhoBloc());

    injector
        .registerDependency<FinalizarPedidoBloc>((_) => FinalizarPedidoBloc());
  }

  void _registerRepositories() {
    //injector.registerDependency<CategoriaRepository>((_) => CategoriaRepository(_gd<CategoriaDao>()));
  }

  void _registerDAOs() {
    injector.registerSingleton<GeneralApi>((_) => GeneralApi((Dio())));
  }
}

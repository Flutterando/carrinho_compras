import 'dart:convert';

import 'package:app/src/shared/models/produto.dart';
import 'package:dio/dio.dart';

class GeneralApi {
  Dio dio = Dio();

  Future<List<Produto>> getProducts() async {
    try {
      Response response = await dio.get(
          "https://raw.githubusercontent.com/Flutterando/carrinho_compras/master/app/lib/src/backend/products.json");
      var data = jsonDecode(response.data);
      List<Produto> produtos =
          (data as List).map((v) => Produto.fromJson(v)).toList();
      return produtos;
    } on DioError catch (e) {
      throw "Erro de internet";
    } catch (e) {
      throw "Erro desconhecido";
    }
  }
}

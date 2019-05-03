import 'package:app/src/finalizar_pedido/finalizar_pedido_page.dart';
import 'package:app/src/produtos/detalhes/detalhes_screen.dart';
import 'package:app/src/shared/widgets/loading_widget.dart';
import 'package:app/src/shared/helpers/mask.dart' as mask;
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:app/src/shared/models/produto.dart';
import 'carrinho_bloc.dart';

class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  var bloc = BlocProvider.getBloc<CarrinhoBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: StreamBuilder<List<Produto>>(
        stream: bloc.produtosCarrinho,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length == 0
                ? Center(child: Text("Nenhum item no carrinho"))
                : Column(
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return _buildProdutoTile(snapshot.data[index]);
                        },
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.all(15),
                        child: RaisedButton(
                          child: Text("Finalizar compra"),
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FinalizarPedidoPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          } else {
            if (snapshot.hasError) {
              print("[${DateTime.now()}] - Error:");
              print(snapshot.error);
            }
            return LoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildProdutoTile(Produto model) {
    return AnimatedCard(
      keepAlive: true,
      initOffset: Offset(0, 0),
      initDelay: Duration(seconds: 0),
      direction: AnimatedCardDirection.left,
      onRemove: () => bloc.removeItemCarrinho.add(model),
      child: Container(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) {
                return DetalhesScreen(produto: model);
              }),
            );
          },
          leading: Container(
            width: 40,
            height: 40,
            child: Image.network(
              model.image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(model.title),
          subtitle: Text(
            model.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            mask.money(
              double.parse(model.price?.replaceAll(",", ".") ?? "0"),
              initialSymbol: "\$",
            ),
          ),
        ),
      ),
    );
  }
}

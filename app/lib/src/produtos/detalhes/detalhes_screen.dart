import 'package:app/src/shared/models/produto.dart';
import 'package:app/src/shared/helpers/mask.dart' as mask;
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../carrinho/carrinho_bloc.dart';

class DetalhesScreen extends StatefulWidget {
  final Produto produto;

  const DetalhesScreen({Key key, this.produto}) : super(key: key);

  @override
  _DetalhesScreenState createState() => _DetalhesScreenState(produto);
}

class _DetalhesScreenState extends State<DetalhesScreen> {
  final Produto produto;

  final carrinhoBloc = BlocProvider.getBloc<CarrinhoBloc>();
  var globalKey = RectGetter.createGlobalKey();

  _DetalhesScreenState(this.produto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          produto.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Hero(
                    tag: produto.id,
                    child: Image.network(
                      produto.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                color: Theme.of(context).dividerColor,
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 1,
              ),
              _buildDescription(),
              SizedBox(
                  height: RectGetter.getRectFromKey(globalKey)?.height ?? 0),
            ],
          ),
          _buildBottomData(),
        ],
      ),
    );
  }

  Widget _buildBottomData() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Theme.of(context).dividerColor,
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 1,
          ),
          Container(
            key: globalKey,
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 15, top: 5),
            child: Row(
              children: <Widget>[
                Text(
                  "Total \nAmount",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: Text(
                    mask.money(
                      double.parse(
                        produto.price?.replaceAll(",", ".") ?? "0",
                      ),
                      initialSymbol: "\$",
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("ADD TO CART"),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () async {
                    carrinhoBloc.addItemCarrinho.add(widget.produto);
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            produto.title,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            produto.description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

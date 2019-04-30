import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool fullScreen;
  final Color backgroundColor;

  LoadingWidget({
    Key key,
    this.fullScreen: false,
    this.backgroundColor = Colors.black12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (fullScreen)
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black12,
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: LoadingWidget(),
          ),
        ),
      );
    else
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      );
  }
}

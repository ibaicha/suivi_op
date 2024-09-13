import 'package:flutter/material.dart';

import '../../exploitation/widgets/header_title/header_title.dart';
import '../widgets/list_stockages_widget.dart';

class ListStockageLayout extends StatelessWidget {
  const ListStockageLayout({
    Key? key,
  }) : super(key: key);

  static const routeName = '/list_stockage';

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        height: 60,
        //color: Colors.lime[800],
        child: const Center(
          child: HeaderTitle(),
        ),
      ),
      Container(
        //height: 50,
        //color: Colors.lime[600],
        color: Colors.lime[600],
        child: const Center(child: ListStockagesWidget()),
      ),
    ]);
  }
}

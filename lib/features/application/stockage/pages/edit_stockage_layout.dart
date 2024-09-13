import 'package:flutter/material.dart';

import '../../exploitation/widgets/header_title/header_title.dart';
import '../widgets/edit_stockages_widget.dart';
import '../widgets/list_stockages_widget.dart';

class EditStockageLayout extends StatelessWidget {
  const EditStockageLayout({
    Key? key,
  }) : super(key: key);

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
        child: Center(
            child: EditStockagesWidget(
          idStockage: 0,
        )),
      ),
    ]);
  }
}

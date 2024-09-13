import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

import 'edit_stockage_layout.dart';
import 'list_stockage_layout.dart';

class StockagePage extends StatelessWidget {
  const StockagePage({Key? key}) : super(key: key);
  static const routeName = '/add_Stockage';

  static final _pageControlller = PageController();

  @override
  void dispose() {
    _pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[600],
      body: PageView(
        controller: _pageControlller,
        children: const <Widget>[
          ListStockageLayout(),
          EditStockageLayout(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: const Color.fromARGB(255, 255, 240, 219),
        controller: _pageControlller,
        flat: true,
        useActiveColorByDefault: false,
        items: const [
          RollingBottomBarItem(Icons.list_rounded,
              label: 'Liste', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.edit_rounded,
              label: 'Editer', activeColor: Colors.blueAccent),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _pageControlller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
          print('onTap index: $index');
        },
      ),
    );
  }
}

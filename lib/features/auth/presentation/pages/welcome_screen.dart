import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import '../../../../core/res/constants.dart';
//import 'package:model_flutter/features/auth/presentation/pages/login_screen.dart';
import 'login_screen.dart';

import '../../../../core/res/colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String title = 'A propos';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);
    sartStreaming();
  }

  @override
  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          setState(() {
            title = 'Apropos';
          });
          break;
        case 1:
          setState(() {
            title = 'Login';
          });
          break;
        case 2:
          setState(() {
            title = 'Contact';
          });
          break;
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  checkInternet() async {
    Constants.result = await Connectivity().checkConnectivity();
    if (Constants.result != ConnectivityResult.none) {
      Constants.isConnect = true;
    } else {
      Constants.isConnect = false;
      // showDialogBox();
    }
    if (mounted) {
      setState(() {
        // code pour mettre à jour l'état
      });
    }
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("No Internet"),
              content: const Text('Please check your internet connection'),
              actions: [
                CupertinoButton.filled(
                    child: const Text("Retry"),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet();
                    })
              ],
            ));
  }

  sartStreaming() {
    Constants.subscription =
        Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 70.0,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.perm_identity, size: 30),
          Icon(Icons.list, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
            _tabController.index = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: GFTabBarView(controller: _tabController, children: <Widget>[
        Container(color: Colors.white),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*
              const SizedBox(height: kToolbarHeight),
              Text(
                AppLocalizations.of(context)!.welcomePageTitle,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Frank"),
              ),
              Text(
                AppLocalizations.of(context)!.welcomePageSubtitle,
                style: const TextStyle(
                    color: AppColors.primaryColor, fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              */
              Expanded(child: LoginScreen()),
            ],
          ),
        ),
        Container(color: Colors.white)
      ]),
    );
  }
}

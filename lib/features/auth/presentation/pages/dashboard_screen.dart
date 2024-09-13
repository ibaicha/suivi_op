import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../core/presentation/providers/theme_provider.dart';
import '../../../../core/res/constants.dart';
import '../../../../src/widgets/hero_text.dart';
import '../widgets/animated_numeric_text.dart';
import '../widgets/fade_in.dart';
import '../widgets/round_button.dart';
import '../widgets/transition_route_observer.dart';

import '../widgets/theme.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin
    implements TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) async {
    var dir = await getApplicationDocumentsDirectory();
    print("dir ===??? $dir");
    final objBoxDirectory = Directory(
        // appDirectory.path + '/objectbox/' + ApiConstants.nameDB);
        '${dir.path}/${Constants.nameDB}/');
    final isExists = await objBoxDirectory.exists();
    print("DBObject ===??? $isExists");

    if (isExists == true) {
      objBoxDirectory.delete(recursive: true);
    }

    return Navigator.of(context)
        .pushReplacementNamed('/welcome')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation = Tween<double>(begin: .6, end: 1).animate(
      CurvedAnimation(
        parent: _loadingController!,
        curve: headerAniInterval,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
      this,
      ModalRoute.of(context) as PageRoute<dynamic>?,
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  AppBar _buildAppBar(ThemeData theme) {
    final menuBtn = IconButton(
      color: theme.colorScheme.secondary,
      icon: const Icon(FontAwesomeIcons.bars),
      onPressed: () {},
    );
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.rightFromBracket),
      color: theme.colorScheme.secondary,
      onPressed: () => _goToLogin(context),
    );
    final title = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Hero(
              tag: Constants.logoTag,
              child: Image.asset(
                'assets/images/ecorp.png',
                filterQuality: FilterQuality.high,
                height: 30,
              ),
            ),
          ),
          HeroText(
            Constants.appName,
            tag: Constants.titleTag,
            viewState: ViewState.shrunk,
            style: LoginThemeHelper.loginTextStyle,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      leading: FadeIn(
        controller: _loadingController,
        offset: .3,
        curve: headerAniInterval,
        child: menuBtn,
      ),
      actions: <Widget>[
        FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.endToStart,
          child: signOutBtn,
        ),
        IconButton(
            onPressed: () {
              if (_themeProvider.currentTheme == ThemeEnum.light) {
                _themeProvider.changeTheme(ThemeEnum.dark);
              } else {
                _themeProvider.changeTheme(ThemeEnum.light);
              }
            },
            icon: Icon(
              _themeProvider.currentTheme == ThemeEnum.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            )),
      ],

      title: title,
      backgroundColor: theme.primaryColor.withOpacity(.1),
      elevation: 0,
      // toolbarTextStyle: TextStle(),
      // textTheme: theme.accentTextTheme,
      // iconTheme: theme.accentIconTheme,
    );
  }

  Widget _buildHeader(ThemeData theme) {
    final primaryColor =
        Colors.primaries.where((c) => c == theme.primaryColor).first;
    final accentColor =
        Colors.primaries.where((c) => c == theme.colorScheme.secondary).first;
    final linearGradient = LinearGradient(
      colors: [
        primaryColor.shade800,
        primaryColor.shade200,
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 418.0, 78.0));

    /*
        final primaryColor =
        Colors.primaries.where((c) => c == theme.primaryColor).first;
    final accentColor =
        Colors.primaries.where((c) => c == theme.colorScheme.secondary).first;
    final linearGradient = LinearGradient(
      colors: [
        primaryColor.shade800,
        primaryColor.shade200,
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 418.0, 78.0));
    */

    return ScaleTransition(
      scale: _headerScaleAnimation,
      child: FadeIn(
        controller: _loadingController,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.bottomToTop,
        offset: .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\$',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: accentColor.shade400,
                  ),
                ),
                const SizedBox(width: 5),
                AnimatedNumericText(
                  initialValue: 14,
                  targetValue: 3467.87,
                  curve: const Interval(0, .5, curve: Curves.easeOut),
                  controller: _loadingController!,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    foreground: Paint()..shader = linearGradient,
                  ),
                ),
              ],
            ),
            Text('Account Balance', style: theme.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    Widget? icon,
    String? label,
    required Interval interval,
  }) {
    return RoundButton(
      icon: icon,
      label: label,
      loadingController: _loadingController,
      interval: Interval(
        interval.begin,
        interval.end,
        curve: const ElasticOutCurve(0.42),
      ),
      onPressed: () {
        switch (label) {
          case 'REPORT':
            {
              print('label: $label');
              Navigator.of(context).pushReplacementNamed('/datapage');
            }
            break;
          case 'PROFILE':
            {
              print('label: $label');
              apiService.getRecordsObjectBox();
              Navigator.of(context).pushReplacementNamed('/profile');
            }
            break;
          case 'Register':
            {
              print('label: $label');
              apiService.getRecordsObjectBox();
              Navigator.of(context).pushReplacementNamed('/post');
            }
            break;
          case 'COMPTE':
            {
              Navigator.of(context).pushReplacementNamed('/add_exploitation',
                  arguments: {
                    "title": "Liste Comptes",
                    "utilisateur": Constants.mxUserObject
                  });
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExploitationsWidget()),
              );
              */
            }
            break;
          case 'MAGASINS':
            {
              Navigator.of(context).pushReplacementNamed('/list_stockage',
                  arguments: {
                    "title": "Liste Comptes",
                    "utilisateur": Constants.mxUserObject
                  });
              /*
              Navigator.of(context).pushReplacementNamed('/add_Stockage',
                  arguments: {
                    "title": "Liste magasin",
                    "utilisateur": Constants.mxUserObject
                  });
              */
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExploitationsWidget()),
              );
              */
            }
            break;
          case 'Other':
            {
              Navigator.of(context).pushReplacementNamed('/add_exploitation',
                  arguments: {
                    "title": "Liste Comptes",
                    "utilisateur": Constants.mxUserObject
                  });
            }
            break;
          case 'Settings':
            {
              print('label: $label');
              Navigator.of(context).pushReplacementNamed('/localData');
            }
            break;

          case 'Web':
            {
              print('label: $label');
              Navigator.of(context).pushReplacementNamed('/webview');
            }
            break;

          default:
            {
              print('label: RAS');
            }
            break;
        }
      },
    );
  }

  Widget _buildDashboardGrid() {
    const step = 0.04;
    const aniInterval = 0.75;

    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 20,
      ),
      childAspectRatio: .9,
      // crossAxisSpacing: 5,
      crossAxisCount: 3,
      children: [
        _buildButton(
          icon: const Icon(FontAwesomeIcons.user),
          label: 'PROFILE',
          interval: const Interval(0, aniInterval),
        ),
        _buildButton(
          icon: Container(
            // fix icon is not centered like others for some reasons
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.centerLeft,
            child: const Icon(
              FontAwesomeIcons.industry,
              size: 20,
            ),
          ),
          label: 'USINE',
          interval: const Interval(step, aniInterval + step),
        ),
        if (Constants.mxUserObject.roleName == "Op")
          _buildButton(
            icon: const Icon(FontAwesomeIcons.handHoldingDollar),
            label: 'COMPTE',
            interval: const Interval(step * 2, aniInterval + step * 2),
          ),
        if (Constants.mxUserObject.roleName == "Point")
          _buildButton(
            icon: const Icon(FontAwesomeIcons.handHoldingDollar),
            label: 'MAGASINS',
            interval: const Interval(step * 2, aniInterval + step * 2),
          ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.chartLine),
          label: 'REPORT',
          interval: const Interval(0, aniInterval),
        ),
        _buildButton(
          icon: const Icon(Icons.vpn_key),
          label: 'Register',
          interval: const Interval(step, aniInterval + step),
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.clockRotateLeft),
          label: 'History',
          interval: const Interval(step * 2, aniInterval + step * 2),
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.ellipsis),
          label: 'Other',
          interval: const Interval(0, aniInterval),
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
          label: 'Web',
          interval: const Interval(step, aniInterval + step),
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.sliders, size: 20),
          label: 'Settings',
          interval: const Interval(step * 2, aniInterval + step * 2),
        ),
      ],
    );
  }

  Widget _buildDebugButtons() {
    const textStyle = TextStyle(fontSize: 12, color: Colors.white);

    return Positioned(
      bottom: 0,
      right: 0,
      child: Row(
        children: <Widget>[
          MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.red,
            onPressed: () => _loadingController!.value == 0
                ? _loadingController!.forward()
                : _loadingController!.reverse(),
            child: const Text('loading', style: textStyle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(theme),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.primaryColor.withOpacity(.1),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(Constants.statutConnect),
                    const SizedBox(height: 40),
                    Expanded(
                      flex: 2,
                      child: _buildHeader(theme),
                    ),
                    Expanded(
                      flex: 8,
                      child: ShaderMask(
                        // blendMode: BlendMode.srcOver,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Colors.deepPurpleAccent.shade100,
                              Colors.deepPurple.shade100,
                              Colors.deepPurple.shade100,
                              Colors.deepPurple.shade100,
                              // Colors.red,
                              // Colors.yellow,
                            ],
                          ).createShader(bounds);
                        },
                        child: _buildDashboardGrid(),
                      ),
                    ),
                  ],
                ),
                if (!kReleaseMode) _buildDebugButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didPop() {
    // TODO: implement didPop
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
  }

  @override
  void didPush() {
    // TODO: implement didPush
  }

  @override
  void didPushNext() {
    // TODO: implement didPushNext
  }
}

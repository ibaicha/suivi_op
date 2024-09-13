import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';

import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../core/res/constants.dart';
import '../../../../../objectbox.g.dart';
import '../../../../auth/presentation/widgets/fade_in.dart';
import '../../../../auth/presentation/widgets/theme.dart';
import '../../../../auth/presentation/widgets/transition_route_observer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/presentation/widgets/widgets.dart';

class LocalDataScreen extends StatefulWidget {
  static const routeName = '/localData';

  // const LocalDataScreen({Key? key, required this.title}) : super(key: key);
  const LocalDataScreen({Key? key}) : super(key: key);
  // final String title;

  @override
  State<LocalDataScreen> createState() => _LocalDataScreenState();
}

class _LocalDataScreenState extends State<LocalDataScreen>
    with SingleTickerProviderStateMixin
    implements TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/dashboard')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  late TabController _tabController;
  late String title = 'Base Données';
  late int countUser = 0;
  late Color colorsUser = Colors.amber;
  late int countProducteur = 0;
  late Color colorsProducteur = Colors.amber;
  late int countExploitation = 0;
  late Color colorsExploitation = Colors.amber;
  late int countAnnee = 0;
  late Color colorsAnnee = Colors.amber;
  late int countEmballage = 0;
  late Color colorsEmballage = Colors.amber;
  late int countSaison = 0;
  late Color colorsSaison = Colors.amber;
  late int countCampagne = 0;
  late Color colorsCampagne = Colors.amber;
  late int countVariete = 0;
  late Color colorsVariete = Colors.amber;
  late int countTypeCharge = 0;
  late Color colorsTypeCharge = Colors.amber;
  late int countTypeOp = 0;
  late Color colorsTypeOp = Colors.amber;
  late int countOp = 0;
  late Color colorsOp = Colors.amber;
  late int countUserOp = 0;
  late Color colorsUserOp = Colors.amber;
  late int countUserUniteTransformation = 0;
  late Color colorsUserUniteTransformation = Colors.amber;
  late int countCharge = 0;
  late Color colorsCharge = Colors.amber;
  late int countFamilleExploitation = 0;
  late Color colorsFamilleExploitation = Colors.amber;
  late int countExploitationChargeExploitation = 0;
  late Color colorsExploitationChargeExploitation = Colors.amber;

  late int countRecolte = 0;
  late Color colorsRecolte = Colors.amber;
  late int countRemboursement = 0;
  late Color colorsRemboursement = Colors.amber;

  late int countPays = 0;
  late Color colorsPays = Colors.amber;
  late int countZone = 0;
  late Color colorsZone = Colors.amber;
  late int countSousZone = 0;
  late Color colorsSousZone = Colors.amber;

  late int countLocalite = 0;
  late Color colorsLocalite = Colors.amber;
  late int countPoint = 0;
  late Color colorsPoint = Colors.amber;
  late int countVillage = 0;
  late Color colorsVillage = Colors.amber;

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

    final mxuserBox = ObjectBox.mxuserBox;
    countUser = mxuserBox!.query().build().count();
    if (countUser > 0) {
      colorsUser = Colors.greenAccent;
    } else {
      colorsUser = Colors.amber;
    }

    final producteursBox = ObjectBox.mxproducteursBox;
    countProducteur = producteursBox!.query().build().count();
    if (countProducteur > 0) {
      colorsProducteur = Colors.greenAccent;
    } else {
      colorsProducteur = Colors.amber;
    }

    final mxexploitationBox = ObjectBox.mxexploitationBox;
    countExploitation = mxexploitationBox!.query().build().count();
    if (countExploitation > 0) {
      colorsExploitation = Colors.greenAccent;
    } else {
      colorsExploitation = Colors.amber;
    }

    final mxanneeBox = ObjectBox.mxanneesBox;
    countAnnee = mxanneeBox!.query().build().count();
    if (countAnnee > 0) {
      colorsAnnee = Colors.greenAccent;
    } else {
      colorsAnnee = Colors.amber;
    }

    final mxemballagesBox = ObjectBox.mxemballagesBox;
    countEmballage = mxemballagesBox!.query().build().count();
    if (countEmballage > 0) {
      colorsEmballage = Colors.greenAccent;
    } else {
      colorsEmballage = Colors.amber;
    }

    final mxsaisonBox = ObjectBox.mxsaisonsBox;
    countSaison = mxsaisonBox!.query().build().count();
    if (countSaison > 0) {
      colorsSaison = Colors.greenAccent;
    } else {
      colorsSaison = Colors.amber;
    }

    final mxcampagneBox = ObjectBox.mxcampagnesBox;
    countCampagne = mxcampagneBox!.query().build().count();
    if (countCampagne > 0) {
      colorsCampagne = Colors.greenAccent;
    } else {
      colorsCampagne = Colors.amber;
    }

    final mxvarietesBox = ObjectBox.mxvarietesBox;
    countVariete = mxvarietesBox!.query().build().count();
    if (countVariete > 0) {
      colorsVariete = Colors.greenAccent;
    } else {
      colorsVariete = Colors.amber;
    }

    final mxchargeExploitationsBox = ObjectBox.mxchargeExploitationsBox;
    countCharge = mxchargeExploitationsBox!.query().build().count();
    if (countCharge > 0) {
      colorsCharge = Colors.greenAccent;
    } else {
      colorsCharge = Colors.amber;
    }

    final mxtypeChargeExploitationsBox = ObjectBox.mxtypeChargeExploitationsBox;
    countTypeCharge = mxtypeChargeExploitationsBox!.query().build().count();
    if (countTypeCharge > 0) {
      colorsTypeCharge = Colors.greenAccent;
    } else {
      colorsTypeCharge = Colors.amber;
    }

    final mxtypeOpsBox = ObjectBox.mxtypeopsBox;
    countTypeOp = mxtypeOpsBox!.query().build().count();
    if (countTypeOp > 0) {
      colorsTypeOp = Colors.greenAccent;
    } else {
      colorsTypeOp = Colors.amber;
    }

    final mxopsBox = ObjectBox.mxopsBox;
    countOp = mxopsBox!.query().build().count();
    if (countOp > 0) {
      colorsOp = Colors.greenAccent;
    } else {
      colorsOp = Colors.amber;
    }

    final mxrecoltesBox = ObjectBox.mxrecoltesBox;
    countRecolte = mxrecoltesBox!.query().build().count();
    if (countRecolte > 0) {
      colorsRecolte = Colors.greenAccent;
    } else {
      colorsRecolte = Colors.amber;
    }

    final mxremborsementBox = ObjectBox.mxremboursementsBox;
    countRemboursement = mxremborsementBox!.query().build().count();
    if (countRemboursement > 0) {
      colorsRemboursement = Colors.greenAccent;
    } else {
      colorsRemboursement = Colors.amber;
    }

    final mxuserOpsBox = ObjectBox.mxuserOpBox;
    countUserOp = mxuserOpsBox!.query().build().count();
    if (countUserOp > 0) {
      colorsUserOp = Colors.greenAccent;
    } else {
      colorsUserOp = Colors.amber;
    }

/*
    final userUniteTransformationBox = ObjectBox.userUniteTransformationBox;
    countUserUniteTransformation =
        userUniteTransformationBox!.query().build().count();
    if (countUserUniteTransformation > 0) {
      colorsUserUniteTransformation = Colors.greenAccent;
    } else {
      colorsUserUniteTransformation = Colors.amber;
    }
    */

    final mxfamilleChargeExploitationsBox =
        ObjectBox.mxfamilleChargeExploitationsBox;
    countFamilleExploitation =
        mxfamilleChargeExploitationsBox!.query().build().count();
    if (countFamilleExploitation > 0) {
      colorsFamilleExploitation = Colors.greenAccent;
    } else {
      colorsFamilleExploitation = Colors.amber;
    }

    final mxexploitationChargeExploitationObjectBox =
        ObjectBox.mxexploitationChargeExploitationObjectBox;
    countExploitationChargeExploitation =
        mxexploitationChargeExploitationObjectBox!.query().build().count();
    if (countExploitationChargeExploitation > 0) {
      colorsExploitationChargeExploitation = Colors.greenAccent;
    } else {
      colorsExploitationChargeExploitation = Colors.amber;
    }

    final mxpayBox = ObjectBox.mxpaysBox;
    countPays = mxpayBox!.query().build().count();
    if (countPays > 0) {
      colorsPays = Colors.greenAccent;
    } else {
      colorsPays = Colors.amber;
    }
    final mxzonesBox = ObjectBox.mxzonesBox;
    countZone = mxzonesBox!.query().build().count();
    if (countZone > 0) {
      colorsZone = Colors.greenAccent;
    } else {
      colorsZone = Colors.amber;
    }

    final mxsouszonesBox = ObjectBox.mxsouszonesBox;
    countSousZone = mxsouszonesBox!.query().build().count();
    if (countSousZone > 0) {
      colorsSousZone = Colors.greenAccent;
    } else {
      colorsSousZone = Colors.amber;
    }

    final mxlocalitesBox = ObjectBox.mxlocalitesBox;
    countLocalite = mxlocalitesBox!.query().build().count();
    if (countLocalite > 0) {
      colorsLocalite = Colors.greenAccent;
    } else {
      colorsLocalite = Colors.amber;
    }

    final mxvillagesBox = ObjectBox.mxvillagesBox;
    countVillage = mxvillagesBox!.query().build().count();
    if (countVillage > 0) {
      colorsVillage = Colors.greenAccent;
    } else {
      colorsVillage = Colors.amber;
    }

    final mxpointsBox = ObjectBox.mxpointsBox;
    countPoint = mxpointsBox!.query().build().count();
    if (countPoint > 0) {
      colorsPoint = Colors.greenAccent;
    } else {
      colorsPoint = Colors.amber;
    }
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
      ],
      title: title,
      backgroundColor: theme.primaryColor.withOpacity(.1),
      elevation: 0,
      // toolbarTextStyle: TextStle(),
      // textTheme: theme.accentTextTheme,
      // iconTheme: theme.accentIconTheme,
    );
  }

  Widget _buildDatas(ThemeData theme) {
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

    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.white,
                    child: ListView(
                      shrinkWrap: true,
                      reverse: true,
                      padding: const EdgeInsets.all(10),
                      itemExtent: 100,
                      children: <Widget>[
                        Card(
                          color: colorsRemboursement,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("RECOLTES EXPLOITATION"),
                            subtitle: Text(
                                'Nombre enregistrements: $countRemboursement '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('recoltesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsExploitationChargeExploitation,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("DETAILS EXPLOITATION"),
                            subtitle: Text(
                                'Nombre enregistrements: $countExploitationChargeExploitation '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox(
                                            'exploitationChargeExploitationBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsExploitation,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("EXPLOITATION"),
                            subtitle: Text(
                                'Nombre enregistrements: $countExploitation '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('exploitationsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsCharge,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("CHARGE EXPLOITATION"),
                            subtitle:
                                Text('Nombre enregistrements: $countCharge '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('mxchargeExploitationsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsFamilleExploitation,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("FAMILLE CHARGE"),
                            subtitle: Text(
                                'Nombre enregistrements: $countFamilleExploitation '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox(
                                            'familleChargeExploitationsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsTypeCharge,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("TYPE CHARGE"),
                            subtitle: Text(
                                'Nombre enregistrements: $countTypeCharge '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('typeChargeExploitationsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsProducteur,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("PRODUCTEURS"),
                            subtitle: Text(
                                'Nombre enregistrements: $countProducteur '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('producteursBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsUserUniteTransformation,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("User Unite Transformation"),
                            subtitle: Text(
                                'Nombre enregistrements: $countUserUniteTransformation '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('userUniteTransformationBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsUserOp,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("User OPs"),
                            subtitle:
                                Text('Nombre enregistrements: $countUserOp '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('userOpsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsOp,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text("OP"),
                            subtitle:
                                Text('Nombre enregistrements: ${countOp} '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('opsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsTypeOp,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("TYPE OP"),
                            subtitle:
                                Text('Nombre enregistrements: $countTypeOp '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('typeOpsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsVariete,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("VARIETE"),
                            subtitle:
                                Text('Nombre enregistrements: $countVariete '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('varietesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsSaison,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("SAISON"),
                            subtitle:
                                Text('Nombre enregistrements: $countSaison '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('saisonsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsCampagne,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("CAMPAGNE"),
                            subtitle:
                                Text('Nombre enregistrements: $countCampagne '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('campagnesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsVillage,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("VILLAGE"),
                            subtitle:
                                Text('Nombre enregistrements: $countVillage '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('villageBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsPoint,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("POINT COLLECTE"),
                            subtitle:
                                Text('Nombre enregistrements: $countPoint '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('PointsBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsLocalite,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("LOCALITE"),
                            subtitle:
                                Text('Nombre enregistrements: $countLocalite '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('localitesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsSousZone,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("SOUS ZONE"),
                            subtitle:
                                Text('Nombre enregistrements: $countSousZone '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('sousZonesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsZone,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("ZONE"),
                            subtitle:
                                Text('Nombre enregistrements: $countZone '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('zonesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsPays,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("PAYS"),
                            subtitle:
                                Text('Nombre enregistrements: $countPays '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('paysBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsEmballage,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("EMBALLAGE"),
                            subtitle: Text(
                                'Nombre enregistrements: $countEmballage '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('emballagesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsAnnee,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("ANNEE"),
                            subtitle:
                                Text('Nombre enregistrements: $countAnnee '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        updateBox('anneesBox');
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: colorsUser,
                          elevation: 20,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: const Text("UTILISATEUR"),
                            subtitle:
                                Text('Nombre enregistrements: $countUser '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_box)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  updateBox(String myBox) async {
    if (myBox == 'mxuserBox') {
      Box<MxUserObject>? mxuserBox;
      mxuserBox!.removeAll();
      ObjectBox.getMxUserData();
    }

    if (myBox == 'anneesBox') {
      final mxanneesBox = ObjectBox.mxanneesBox;
      print('Avant suppresion: ' + mxanneesBox!.count().toString());
      mxanneesBox!.removeAll();
      print('Apres suppression: ' + mxanneesBox!.count().toString());
      await ObjectBox.getMxAnneeData();
      print('Apres chargement: ' + mxanneesBox!.count().toString());
    }
    if (myBox == 'saisonsBox') {
      final mxsaisonsBox = ObjectBox.mxsaisonsBox;
      print('Avant suppresion: ' + mxsaisonsBox!.count().toString());
      mxsaisonsBox!.removeAll();
      print('Apres suppression: ' + mxsaisonsBox!.count().toString());
      await ObjectBox.getMxSaisonData();
      print('Apres chargement: ' + mxsaisonsBox!.count().toString());
    }

    if (myBox == 'campagnesBox') {
      ObjectBox.getMxCampagneData();
      final mxcampagnesBox = ObjectBox.mxcampagnesBox;
      print('Avant suppresion: ' + mxcampagnesBox!.count().toString());
      mxcampagnesBox!.removeAll();
      print('Apres suppression: ' + mxcampagnesBox!.count().toString());
      await ObjectBox.getMxSaisonData();
      print('Apres chargement: ' + mxcampagnesBox!.count().toString());
    }
    if (myBox == 'varietesBox') {
      final mxvarietesBox = ObjectBox.mxvarietesBox;
      print('Avant suppresion: ' + mxvarietesBox!.count().toString());
      mxvarietesBox!.removeAll();
      print('Apres suppression: ' + mxvarietesBox!.count().toString());
      await ObjectBox.getMxVarieteData();
      print('Apres chargement: ' + mxvarietesBox!.count().toString());
    }
    if (myBox == 'mxtypeChargeExploitationsBox') {
      // final mxtypeChargeExploitationsBox = ObjectBox.mxtypeChargeExploitationsBox;
      // mxtypeChargeExploitationsBox!.removeAll();
      ObjectBox.getMxTypeChargeExploitationData();
    }
    if (myBox == 'typeOpsBox') {
      // final typeOpBox = ObjectBox.mxtypeopsBox;
      // typeOpBox!.removeAll();
      ObjectBox.getMxTypeOpData();
    }
    if (myBox == 'opsBox') {
      // final mxopsBox = ObjectBox.mxopsBox;
      // opsBox!.removeAll();
      ObjectBox.getMxOpData();
    }

    if (myBox == 'producteursBox') {
      print('----------------- PRODUCTEUR  -------------');
      ObjectBox.getMxProducteurData();
    }

    if (myBox == 'paysBox') {
      // final anneesBox = ObjectBox.anneesBox;
      // print('Avant suppresion: ' + anneesBox!.count().toString());

      // print('Apres suppression: ' + anneesBox!.count().toString());
      ObjectBox.getMxPaysData();
      // print('Apres chargement: ' + anneesBox!.count().toString());
    }

    if (myBox == 'sousZonesBox') {
      print('----------------- SOUS ZONE  -------------');
      final mxsouszonesBox = ObjectBox.mxsouszonesBox;
      print('Avant suppresion: ' + mxsouszonesBox!.count().toString());

      print('Apres suppression: ' + mxsouszonesBox!.count().toString());
      await ObjectBox.getMxSousZoneData();
      print('Apres chargement: ' + mxsouszonesBox!.count().toString());
    }
    if (myBox == 'zonesBox') {
      print('----------------- ZONE  -------------');
      final mxzonesBox = ObjectBox.mxzonesBox;
      print('Avant suppresion: ' + mxzonesBox!.count().toString());

      print('Apres suppression: ' + mxzonesBox!.count().toString());
      await ObjectBox.getMxZoneData();
      print('Apres chargement: ' + mxzonesBox!.count().toString());
    }
    if (myBox == 'LocalitesBox') {
      print('----------------- LOCALITES  -------------');
      final mxlocalitesBox = ObjectBox.mxlocalitesBox;
      print('Avant suppresion: ' + mxlocalitesBox!.count().toString());

      print('Apres suppression: ' + mxlocalitesBox!.count().toString());
      await ObjectBox.getMxLocaliteData();
      print('Apres chargement: ' + mxlocalitesBox!.count().toString());
    }
    if (myBox == 'PointsBox') {
      print('----------------- POINT COLLECTE  -------------');
      final mxpointsBox = ObjectBox.mxpointsBox;
      print('Avant suppresion: ' + mxpointsBox!.count().toString());

      print('Apres suppression: ' + mxpointsBox!.count().toString());
      await ObjectBox.getMxPointData();
      print('Apres chargement: ' + mxpointsBox!.count().toString());
    }

    if (myBox == 'VillagesBox') {
      print('----------------- VILLAGE  -------------');
      final mxvillagesBox = ObjectBox.mxvillagesBox;
      print('Avant suppresion: ' + mxvillagesBox!.count().toString());

      print('Apres suppression: ' + mxvillagesBox!.count().toString());
      await ObjectBox.getMxVillageData();
      print('Apres chargement: ' + mxvillagesBox!.count().toString());
    }

    if (myBox == 'emballagesBox') {
      print('----------------- Emballage  -------------');
      final mxemballagesBox = ObjectBox.mxemballagesBox;
      print('Avant suppresion: ' + mxemballagesBox!.count().toString());

      print('Apres suppression: ' + mxemballagesBox!.count().toString());
      await ObjectBox.getMxEmballageData();
      print('Apres chargement: ' + mxemballagesBox!.count().toString());
    }

    if (myBox == 'userOpBox') {
      // final opsBox = ObjectBox.opsBox;
      // opsBox!.removeAll();
      ObjectBox.getMxUserOpData();
    }
    /*
    if (myBox == 'userUniteTransformationBox') {
      ObjectBox.getUserUniteTransformationsData();
    }
    */
    if (myBox == 'mxchargeExploitationsBox') {
      print('----------------- Charge Exploitations  -------------');
      final mxchargeExploitationBox = ObjectBox.mxchargeExploitationsBox;

      print('Avant suppresion: ' + mxchargeExploitationBox!.count().toString());
      mxchargeExploitationBox!.removeAll();
      print(
          'Apres suppression: ' + mxchargeExploitationBox!.count().toString());
      await ObjectBox.getMxChargeExploitationData();

      print('Apres chargement: ' + mxchargeExploitationBox!.count().toString());

      List<MxChargeExploitationObject> mesChargeExploitations =
          mxchargeExploitationBox.getAll();
      //print(mesExploitations);

      mesChargeExploitations?.forEach((element) {
        //print(element.toJson());
        print(
            'ObjectBox - ${element.id} - ${element.name} - ${element.unite} -   ');
      });
    }
    if (myBox == 'mxfamilleChargeExploitationsBox') {
      //final mxfamilleChargeExploitationsBox = ObjectBox.mxfamilleChargeExploitationsBox;
      // mxfamilleChargeExploitationsBox!.removeAll();
      ObjectBox.getMxFamilleChargeExploitationData();
    }
    if (myBox == 'exploitationsBox') {
      print('----------------- Exploitations  -------------');
      final mxexploitationBox = ObjectBox.mxexploitationBox;
      print('Avant suppresion: ' + mxexploitationBox!.count().toString());
      mxexploitationBox!.removeAll();
      print('Apres suppression: ' + mxexploitationBox!.count().toString());
      await ObjectBox.getMxExploitationData();

      print('Apres chargement: ' + mxexploitationBox!.count().toString());

      List<MxExploitationObject> mesExploitations = mxexploitationBox.getAll();
      //print(mesExploitations);

      mesExploitations?.forEach((element) {
        //print(element.toJson());
        print(
            'ObjectBox - ${element.id} - ${element.createdAt}  - ${element.updatedAt}- ${element.compte} - ${element.unite}  - Annee: ${element.mxanneeObject.target!.name} - Saison: ${element.mxsaisonObject.target!.name}   ');
      });
    }
    if (myBox == 'exploitationChargeExploitationBox') {
      print('----------------- ECE -------------');
      final mxexploitationChargeExploitationObjectBox =
          ObjectBox.mxexploitationChargeExploitationObjectBox;
      print('Avant suppresion: ' +
          mxexploitationChargeExploitationObjectBox!.count().toString());
      mxexploitationChargeExploitationObjectBox!.removeAll();
      print('Apres suppression: ' +
          mxexploitationChargeExploitationObjectBox!.count().toString());
      await ObjectBox.getMxExploitationChargeExploitationData();

      print('Apres chargement: ' +
          mxexploitationChargeExploitationObjectBox!.count().toString());

      List<MxExploitationChargeExploitationObject>
          mesExploitationChargeExploitations =
          mxexploitationChargeExploitationObjectBox.getAll();
      //print(mesExploitations);

      mesExploitationChargeExploitations?.forEach((element) {
        //print(element.toJson());
        print(
            'ObjectBox - ${element.id}  - exploitation: ${element.mxexploitation.target!.id}  - chargeexploitation: ${element.mxchargeexploitationObject.target!.id} - ${element.unite} - ${element.pu} -  ');
      });

      /////// ObjectBox.getExploitationChargeExploitationData();
    }

    if (myBox == 'recoltesBox') {
      print('----------------- RECOLTES  -------------');
      final mxrecoltesBox = ObjectBox.mxrecoltesBox;
      print('Avant suppresion: ' + mxrecoltesBox!.count().toString());

      print('Apres suppression: ' + mxrecoltesBox!.count().toString());
      await ObjectBox.getMxRecoltesData(1);
      print('Apres chargement: ' + mxrecoltesBox!.count().toString());
    }
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
                    const SizedBox(height: 40),
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
                        child: _buildDatas(theme),
                      ),
                    ),
                  ],
                ),
                //if (!kReleaseMode) _buildDebugButtons(),
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

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'dart:async';
import 'dart:ffi';
// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:dropdown_pro/dropdown.dart';
import 'package:dropdown_pro/dropdown_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:ges_op/ui/Stockage_charge_Stockage/widgets/ece_idStockage/bloc/ece_id_Stockage_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../core/res/constants.dart';
import '../../../../../objectbox.g.dart';

class XListStockagesWidget extends StatefulWidget {
  const XListStockagesWidget({super.key});

  @override
  State<XListStockagesWidget> createState() => _XListStockagesWidgetState();
}

class _XListStockagesWidgetState extends State<XListStockagesWidget> {
  late List<String> _mutiSelectedVarietesIds = [];
  late List<String> _mutiSelectedSaisonsIds = [];
  late List<String> _mutiSelectedAnneesIds = [];
  late List<String> _mutiSelectedProducteursIds = [];

  var mesEmballages = [];
  bool _isDropdownEmballageEnabled = false;

  String pagination = '(${Constants.num_page}/${Constants.nb_page})';

  String _singleSelectedOpId = "";

  late final bool allowDecimal;

  // late Map<String, dynamic> _singleSelectedMapVarieteId = {};

  var _singleSelectedMapVarieteId = new Map();
  var _singleSelectedMapVarieteName = new Map();

  var _singleSelectedMapSaisonId = new Map();
  var _singleSelectedMapSaisonName = new Map();

  var _singleSelectedMapAnneeId = new Map();
  var _singleSelectedMapAnneeName = new Map();

  var _singleSelectedMapEmballageId = new Map();
  var _singleSelectedMapEmballageName = new Map();

  late int _OpId = 0;

  late int idProduit = 0;

  late int idTypeChargeStockage = 0;

  late int idStockage = 0;

  // final _filtterController = TextEditingController();
  final _compte = TextEditingController();
  final _pagination = TextEditingController();

  final Map<int, TextEditingController> _mapSurfaceControlleur = {};
  Map<int, TextEditingController> mapSurfaceControlleur = {};

  final int _currentSortColumn = 0;
  final bool _isAscending = true;

  String? _sortColumnCompte;
  bool _sortAscendingCompte = true;

  int tappedIndex = 0;
  var _tappedIndex = new Map();

  @override
  void initState() {
    super.initState();

    _OpId = Constants.idOp;
    _singleSelectedOpId = Constants.idOp.toString();
    //_compte = _filtterController.text.toString();

    pagination = '(${Constants.num_page}/${Constants.nb_page})';

    _pagination.text = '(${Constants.num_page}/${Constants.nb_page})';

    final mxcampagnesBox = ObjectBox.mxcampagnesBox;

    MxCampagneObject? valueCampagne =
        mxcampagnesBox!.query().build().findFirst();

    Constants.campagneObject = valueCampagne!;

    _mutiSelectedAnneesIds
        .add(Constants.campagneObject.mxanneeObject.target!.id.toString());
    _mutiSelectedSaisonsIds
        .add(Constants.campagneObject.mxsaisonObject.target!.id.toString());

    _generateListeStockages();
  }

  _generateListeStockages() async {
    final mxmouvementstocksBox = ObjectBox.mxmouvementstocksBox;

    List<MxMouvementStockObject> mesMouvementStocks = [];
    Query<MxMouvementStockObject> query = mxmouvementstocksBox!.query().build();
    mesMouvementStocks = query.find();
    query.close();
    print("Count ${mesMouvementStocks.length}");
    mesMouvementStocks.forEach((element) {
      print(
          ' id: ${element.id} variete: ${element.mxvarieteObject.target!.name}');
      // print( ' id: ${element.id} pu: ${element.pu}  quantiteEntreeEmballage: ${element.quantiteEntreeEmballage} quantiteSortieEmballage: ${element.quantiteSortieEmballage} varieteId: ${element.mxvarieteObject.target!.name}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              // Marge avant le conteneur
              SizedBox(height: 25),
              // Titre de la page avec marge
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                      bottom: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    'LISTE DES ENTREES & SORTIES',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Marge après le conteneur
              SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }

  String _getRegexString() =>
      allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}

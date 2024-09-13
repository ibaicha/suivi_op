import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:suivi_op/core/res/constants.dart';
import 'package:suivi_op/features/application/stockage/pages/edit_stockage_layout.dart';
import 'package:suivi_op/features/application/stockage/widgets/edit_stockages_widget.dart';

import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../objectbox.g.dart';
import '../../../../core/data/service/ObjectBoxHelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListStockagesWidget extends StatefulWidget {
  const ListStockagesWidget({super.key});

  @override
  State<ListStockagesWidget> createState() => _ListStockagesWidgetState();
}

class _ListStockagesWidgetState extends State<ListStockagesWidget> {
  late List<DatatableHeader> _headers;

  List<int> _perPages = [1, 5, 10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 5;
  List<bool>? _expanded;
  String? _searchKey = "id";

  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  // ignore: unused_field
  String _selectableKey = "id";

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;
  var random = new Random();

  List<MxMouvementStockObject> mesMouvementStocks = [];

  List<Map<String, dynamic>> _generateData() {
    List<Map<String, dynamic>> temps = [];
    mesMouvementStocks.forEach((element) {
      print('element : ' + element.toJson().toString());
    });

    mesMouvementStocks.forEach((element) {
      element.quantiteEntreeEmballage != 0
          ? element.quantiteEntreeEmballage
          : element.quantiteSortieEmballage;
      temps.add({
        "id": element.id,
        //"date": element.date,
        "mouvementstockname":
            element.mxmodeentreesortiestockObject.target!.name,
        "produit":
            element.mxvarieteObject.target!.mxProduitObject.target!.name +
                " - " +
                element.mxvarieteObject.target!.name,
        "pu": Constants.formatCurrencyFCFA(element.pu),

        "quantite": (element.quantiteEntreeEmballage != 0
                    ? element.quantiteEntreeEmballage
                    : element.quantiteSortieEmballage)
                .toString() +
            " ( " +
            element.mxemballageObject.target!.name +
            " )",

        "valeur": Constants.formatCurrencyFCFA(element.valeur),
        //"emballage": element.mxemballageObject.target!.name,
        "structure": element.mxmodeentreesortiestockObject.target!
                    .mxtypemouvementstockObject.target!.id ==
                1
            ? element.mxopObject.target!.name
            : element.mxunitetransformationObject.target!.name,
        "magasin": element.mxemplacementObject.target!.name,
        "issended": element.isSended //== true ? 1 : 0,
      });
    });

    /*
    for (var data in source) {
      temps.add({
        "id": i,
        "sku": "$i\000$i",
        "name": "Product $i",
        "category": "Category-$i",
        "price": i * 10.00,
        "cost": "20.00",
        "margin": "${i}0.20",
        "in_stock": "${i}0",
        "alert": "5",
        "received": [i + 20, 150]
      });
      i++;
    }
    */
    return temps;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true); // Activer le spinner de chargement

    // Simuler un délai de 3 secondes avant de récupérer les données
    await Future.delayed(Duration(seconds: 3));

    // Récupérer et traiter les données
    _sourceOriginal.clear();
    _sourceOriginal.addAll(_generateData());
    _sourceFiltered = _sourceOriginal;
    _total = _sourceFiltered.length;

    if (_currentPerPage! < _total) {
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
    } else {
      _source = _sourceFiltered.getRange(0, _total).toList();
    }

    setState(() => _isLoading =
        false); // Désactiver le spinner de chargement une fois les données chargées
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    final mxmouvementstocksBox = ObjectBox.mxmouvementstocksBox;
    Query<MxMouvementStockObject> query = mxmouvementstocksBox!.query().build();
    mesMouvementStocks = query.find();
    query.close();

    _total = mesMouvementStocks.length;

    /// set headers
    _headers = [
      /*
      DatatableHeader(
          text: "ID",
          value: "id",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
          */
      DatatableHeader(
          text: "MODE",
          value: "mouvementstockname",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "PRODUIT",
          value: "produit",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "STRUCTURE",
          value: "structure",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "QUANTITE",
          value: "quantite",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      /*
      DatatableHeader(
          text: "Emballage",
          value: "emballage",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
          */
      DatatableHeader(
          text: "MAGASIN",
          value: "magasin",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "P.U",
          value: "pu",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Valeur",
          value: "valeur",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
        text: "Envoyé?",
        value: "issended",
        show: true,
        sortable: false,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) {
          // Récupérer l'ID de la ligne associée à cet en-tête
          return Row(
            children: [
              /*
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GFCheckbox(
                  //size: GFSize.SMALL,
                  //activeBgColor: GFColors.SUCCESS,
                  onChanged: (value) {},
                  value: row['issended'] ==
                      true, //bool.parse("issended") //"issended" == true ? true : false,
                ),
              ),
              */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //child: GFTypography(text: row['issended'] == true ? "OUI" : "NON",),
                child: Text(row['issended'] == true ? "OUI" : "NON",
                    style: TextStyle(
                      color:
                          row['issended'] == true ? Colors.red : Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          );
        },
      ),
      DatatableHeader(
        text: "",
        value: "name",
        show: true,
        flex: 2,
        sortable: false,
        editable: true,
        textAlign: TextAlign.left,
        sourceBuilder: (value, row) {
          // Récupérer l'ID de la ligne associée à cet en-tête
          int id = row['id'] as int; // Supposons que 'id' est de type int

          return Row(
            children: [
              //Text('Editer'),
              /*
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Imprimez l'ID lorsque le bouton est appuyé
                  print('ID: $id');

                  _showDialogEditItem(context, id);
                },
                // Styling properties for the button
                color: Colors.blue, // Change the color of the button
                iconSize: 24, // Change the size of the button's icon
                padding: EdgeInsets.all(8), // Add padding around the button
                splashColor: Colors
                    .green, // Change the splash color when the button is pressed
              ),
            */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GFButton(
                    size: GFSize.SMALL,
                    text: 'Edit',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: GFColors.WHITE,
                    ),
                    icon: const Icon(
                      Icons.edit,
                    ),
                    color: GFColors.WARNING,
                    onPressed: () {
                      print('ID: $id');

                      _showDialogEditItem(context, id);
                    }),
              ),
            ],
          );
        },
      ),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showDialogEditItem(BuildContext context, int idStockage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            idStockage == 0
                ? "Ajouter...." + idStockage.toString()
                : "Modifier..." + idStockage.toString(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //position
            mainAxisSize: MainAxisSize.min,
            // wrap content in flutter
            children: <Widget>[
              EditStockagesWidget(
                idStockage: idStockage,
              ),
            ],
          ),
        );
      },
    );
  }

// Fonction pour démarrer le temporisateur
  void startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      // Fermez la boîte de dialogue après 3 secondes
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ) // Afficher le spinner au milieu de l'écran si _isLoading est vrai
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(0),
                    constraints: BoxConstraints(
                      maxHeight: 700,
                    ),
                    child: Card(
                      elevation: 1,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.none,
                      child: ResponsiveDatatable(
                        title: TextButton.icon(
                          onPressed: () => {_showDialogEditItem(context, 0)},
                          icon: Icon(Icons.add),
                          label: Text("ADD"),
                        ),
                        reponseScreenSizes: [ScreenSize.xs],
                        actions: [
                          if (_selecteds.length > 0)
                            IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () async {
                                  List<int> maListe = [];
                                  // print('RIEN');

                                  _selecteds.forEach((element) async {
                                    /*
                                    await Future.delayed(Duration(seconds: 3))
                                        .then((value) {
                                      MxMouvementStockObject? myMouvementStock =
                                          mxmouvementstocksBox!
                                              .get(element['id'])!;
                                      print(myMouvementStock.toJson());
                                    });
                                    */
                                    print('element : ${element['id']}');
                                    maListe.add(element['id']);
                                  });
/*
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialogWithAction(
                                        idsStockage: maListe,
                                      );
                                    },
                                  );
                                  */

/*
                                  final mxmouvementstocksBox =
                                      ObjectBox.mxmouvementstocksBox;

                                  for (var element in _selecteds) {
                                    await Future.delayed(Duration(seconds: 3))
                                        .then((value) {
                                      MxMouvementStockObject? myMouvementStock =
                                          mxmouvementstocksBox!
                                              .get(element['id'])!;
                                      print(myMouvementStock.toJson());
                                    });
                                  }
                                  */
                                }),
                          if (_isSearch)
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Rechercher ... ' +
                                      _searchKey!
                                          .replaceAll(
                                              new RegExp('[\\W_]+'), ' ')
                                          .toUpperCase(),
                                  prefixIcon: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () {
                                        setState(() {
                                          _isSearch = false;
                                        });
                                        _initializeData();
                                      }),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {})),
                              onSubmitted: (value) {
                                _filterData(value);
                              },
                            )),
                          if (!_isSearch)
                            IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  setState(() {
                                    _isSearch = true;
                                  });
                                })
                        ],
                        headers: _headers,
                        source: _source,
                        selecteds: _selecteds,
                        showSelect: _showSelect,
                        autoHeight: false,
                        dropContainer: (data) {
                          if (int.tryParse(data['id'].toString())!.isEven) {
                            return Text("is Even");
                          }
                          return _DropDownContainer(data: data);
                        },
                        onChangedRow: (value, header) {
                          /// print(value);
                          /// print(header);
                        },
                        onSubmittedRow: (value, header) {
                          /// print(value);
                          /// print(header);
                        },
                        onTabRow: (data) {
                          print(data);
                        },
                        onSort: (value) {
                          setState(() => _isLoading = true);
                          setState(() {
                            _sortColumn = value;
                            _sortAscending = !_sortAscending;
                            if (_sortAscending) {
                              _sourceFiltered.sort((a, b) => b["$_sortColumn"]
                                  .compareTo(a["$_sortColumn"]));
                            } else {
                              _sourceFiltered.sort((a, b) => a["$_sortColumn"]
                                  .compareTo(b["$_sortColumn"]));
                            }
                            var _rangeTop =
                                _currentPerPage! < _sourceFiltered.length
                                    ? _currentPerPage!
                                    : _sourceFiltered.length;
                            _source =
                                _sourceFiltered.getRange(0, _rangeTop).toList();
                            _searchKey = value;

                            _isLoading = false;
                          });
                        },
                        expanded: _expanded,
                        sortAscending: _sortAscending,
                        sortColumn: _sortColumn,
                        isLoading: _isLoading,
                        onSelect: (value, item) {
                          print("$value  $item ");
                          if (value!) {
                            setState(() => _selecteds.add(item));
                          } else {
                            setState(() =>
                                _selecteds.removeAt(_selecteds.indexOf(item)));
                          }
                        },
                        onSelectAll: (value) {
                          if (value!) {
                            setState(() => _selecteds =
                                _source.map((entry) => entry).toList().cast());
                          } else {
                            setState(() => _selecteds.clear());
                          }
                        },
                        footers: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Rows per page:"),
                          ),
                          if (_perPages.isNotEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: DropdownButton<int>(
                                value: _currentPerPage,
                                items: _perPages
                                    .map((e) => DropdownMenuItem<int>(
                                          child: Text("$e"),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _currentPerPage = value;
                                    _currentPage = 1;
                                    _resetData();
                                  });
                                },
                                isExpanded: false,
                              ),
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                                "$_currentPage - $_currentPerPage of $_total"),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                            ),
                            onPressed: _currentPage == 1
                                ? null
                                : () {
                                    var _nextSet =
                                        _currentPage - _currentPerPage!;
                                    setState(() {
                                      _currentPage =
                                          _nextSet > 1 ? _nextSet : 1;
                                      _resetData(start: _currentPage - 1);
                                    });
                                  },
                            padding: EdgeInsets.symmetric(horizontal: 15),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed:
                                _currentPage + _currentPerPage! - 1 > _total
                                    ? null
                                    : () {
                                        var _nextSet =
                                            _currentPage + _currentPerPage!;

                                        setState(() {
                                          _currentPage = _nextSet < _total
                                              ? _nextSet
                                              : _total - _currentPerPage!;
                                          _resetData(start: _nextSet - 1);
                                        });
                                      },
                            padding: EdgeInsets.symmetric(horizontal: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const _DropDownContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Container(
      /// height: 100,
      child: Column(
        /// children: [
        ///   Expanded(
        ///       child: Container(
        ///     color: Colors.red,
        ///     height: 50,
        ///   )),

        /// ],
        children: _children,
      ),
    );
  }
}

class AlertDialogWithAction extends StatefulWidget {
  late List<int> idsStockage = [];
  AlertDialogWithAction({Key? key, required this.idsStockage})
      : super(key: key);
  @override
  _AlertDialogWithActionState createState() => _AlertDialogWithActionState();
}

class _AlertDialogWithActionState extends State<AlertDialogWithAction> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulez une action longue

    //Future.delayed(Duration(seconds: 3), () {
    setState(() {
      _showAlertLoop();
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
      });
    });
    //});
  }

  Future<void> _showAlertLoop() async {
    List<MxMouvementStockObject> myListMxMouvementStock = [];

    widget.idsStockage.forEach((element) {
      // print('element : $element');

      final mxmouvementstocksBox = ObjectBox.mxmouvementstocksBox;
      MxMouvementStockObject? valueMouvementStock =
          mxmouvementstocksBox!.get(element);
      // print(valueMouvementStock!.toJson());

      myListMxMouvementStock.add(valueMouvementStock!);

      valueMouvementStock.isSended = true;
      valueMouvementStock.dateSended = DateTime.now();

      mxmouvementstocksBox.put(valueMouvementStock);

/*
      MxMouvementStockObject myMxMouvementStock = MxMouvementStockObject(
          id: 0,
          date: valueMouvementStock!.date,
          pu: valueMouvementStock.pu,
          quantiteEntreeEmballage: valueMouvementStock.quantiteEntreeEmballage,
          quantiteSortieEmballage: valueMouvementStock.quantiteSortieEmballage,
          nombreUnite: valueMouvementStock.nombreUnite,
          valeur: valueMouvementStock.valeur);

      myMxMouvementStock.mxanneeObject.target =
          valueMouvementStock.mxanneeObject.target;
      myMxMouvementStock.mxsaisonObject.target =
          valueMouvementStock.mxsaisonObject.target;
      myMxMouvementStock.mxopObject.target =
          valueMouvementStock.mxopObject.target;
      myMxMouvementStock.mxmodeentreesortiestockObject.target =
          valueMouvementStock.mxmodeentreesortiestockObject.target;
      myMxMouvementStock.mxunitetransformationObject.target =
          valueMouvementStock.mxunitetransformationObject.target;
      myMxMouvementStock.mxvarieteObject.target =
          valueMouvementStock.mxvarieteObject.target;
      myMxMouvementStock.mxemplacementObject.target =
          valueMouvementStock.mxemplacementObject.target;
      myMxMouvementStock.mxemballageObject.target =
          valueMouvementStock.mxemballageObject.target;
*/
      // print(myMxMouvementStock.toJson());

      // ObjectBox.EditMxMouvementStock(modeEdition: 'add', myMxMouvementStock: myMxMouvementStock);
    });

/*
    myListMxMouvementStock.forEach((element) {
      print(element.toJson());
      print(element.mxemplacementObject.target!.toJson());
    });
*/

    ObjectBox.EditListMxMouvementStock(
        modeEdition: 'add', myListMxMouvementStock: myListMxMouvementStock);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alerte avec Action"),
      content: _isLoading
          ? CircularProgressIndicator() // Affichez un indicateur de chargement tant que l'action est en cours
          : Text("Action terminée !"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fermer l'alerte
          },
          child: Text("Fermer"),
        ),
      ],
    );
  }
}

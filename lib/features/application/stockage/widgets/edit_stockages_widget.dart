import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropdown_plus/dropdown.dart';
import 'package:flutter_dropdown_plus/dropdown_item.dart';
import 'package:getwidget/components/alert/gf_alert.dart';
import 'package:intl/intl.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../core/res/constants.dart';
import '../../../../../objectbox.g.dart';

class EditStockagesWidget extends StatefulWidget {
  static const routeName = '/editstockage';
  late int idStockage;
  EditStockagesWidget({Key? key, required this.idStockage}) : super(key: key);

  @override
  State<EditStockagesWidget> createState() => _EditStockagesWidgetState();
}

class _EditStockagesWidgetState extends State<EditStockagesWidget> {
  final TextEditingController _dateTextEditingController =
      TextEditingController();
  final TextEditingController _textFieldQteController = TextEditingController();
  final TextEditingController _textFieldPrixUnitaireController =
      TextEditingController();
  var mesEmballages = [];
  bool _isDropdownEmballageEnabled = false;

  String pagination = '(${Constants.num_page}/${Constants.nb_page})';

  late final bool allowDecimal;

  String singleSelectedAnneeId = "";
  String singleSelectedSaisonId = "";
  String singleSelectedModeEntreeSortieStockId = "1";
  String singleSelectedVarieteId = "";

  String singleSelectedOpId = "";
  String singleSelectedUniteTransformationId = "";
  String singleSelectedEmballageId = "";
  String singleSelectedEmplacementId = "";

  String titleSelectedEmballage = "CHOISIR UN EMBALLAGE";
  String labelTextSelectedEmballage = "EMBALLAGE";
  String hintTextTextSelectedEmballage = "Selection Emballage";

  String unite = "";
  late int _OpId = 0;

  late int NombreAddOrEdit = 0;

  late int idProduit = 0;
  late int idTypeMouvementStock = 0;

  late int idTypeChargeStockage = 0;

  //late int idStockage = 0;
  late int idPoint = 0;

  final _pagination = TextEditingController();

  int tappedIndex = 0;

  String _selectedItem = "";
  final formatter = NumberFormat('#,##0.0', 'fr_FR');
  final dateFormat = DateFormat('dd MMMM yyyy', 'fr_FR');

  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    pagination = '(${Constants.num_page}/${Constants.nb_page})';
    _pagination.text = '(${Constants.num_page}/${Constants.nb_page})';

    final mxcampagnesBox = ObjectBox.mxcampagnesBox;
    MxCampagneObject? valueCampagne =
        mxcampagnesBox!.query().build().findFirst();

    Constants.campagneObject = valueCampagne!;

    singleSelectedAnneeId =
        Constants.campagneObject.mxanneeObject.target!.id.toString();
    singleSelectedSaisonId =
        Constants.campagneObject.mxsaisonObject.target!.id.toString();

    _dateTextEditingController.text = dateFormat.format(DateTime.now());

    final mxuserpointBox = ObjectBox.mxuserPointBox;
    MxUserPointObject? valuePoint = mxuserpointBox!
        .query(MxUserPointObject_.userId.equals(Constants.mxUserObject.id))
        .build()
        .findFirst();
    idPoint = valuePoint!.mxPointObject.target!.id;
  }

  _renderAnneesItems() {
    List<DropdownItem> itemAnneesList = [];
    List<DropdownItem> list = [];

    final mxanneeBox = ObjectBox.mxanneesBox;
    var mesAnnees = mxanneeBox?.getAll();

    mesAnnees?.forEach((element) {
      list.add(DropdownItem(
          id: element.id.toString(),
          // value:'${element.name.toString().toUpperCase()} | ${element.valeur.toString().toUpperCase()}',
          value: '${element.name.toString().toUpperCase()}',
          data: MxAnneeObject(
            id: element.id,
            name: element.name,
            valeur: element.valeur,
          )));
    });

    itemAnneesList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR UNE ANNEE",
        labelText: "ANNEE",
        hintText: "Selection année",
        list: itemAnneesList,
        selectedId: singleSelectedAnneeId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedAnneeId = selectedItem.id;
            print('_isButtonDisabled: $_isButtonDisabled');
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;
          MxAnneeObject anneeObject = selectedItem.data as MxAnneeObject;

          //print("Item Id: $itemId -- Item Name: $itemName ## Other Details ## Annee Id: ${anneeObject.id} -- Annee name: ${anneeObject.name}");
        });
  }

  _renderSaisonsItems() {
    List<DropdownItem> itemSaisonsList = [];
    List<DropdownItem> list = [];

    final mxsaisonBox = ObjectBox.mxsaisonsBox;
    var mesSaisons = mxsaisonBox?.getAll();

    mesSaisons?.forEach((element) {
      list.add(DropdownItem(
          id: element.id.toString(),
          // value:'${element.name.toString().toUpperCase()} | ${element.description.toString().toUpperCase()}',
          value: '${element.name.toString().toUpperCase()}',
          data: MxSaisonObject(
            id: element.id,
            name: element.name,
            description: element.description,
          )));
    });

    itemSaisonsList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR UNE SAISON",
        labelText: "SAISON",
        hintText: "Selection saison",
        list: itemSaisonsList,
        selectedId: singleSelectedSaisonId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedSaisonId = selectedItem.id;
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;
          MxSaisonObject saisonObject = selectedItem.data as MxSaisonObject;

          //print("Item Id: $itemId -- Item Name: $itemName ## Other Details ## Saison Id: ${saisonObject.id} -- Saison name: ${saisonObject.name}");
        });
  }

  _renderVarietesItems() {
    List<DropdownItem> itemVarietesList = [];
    List<DropdownItem> list = [];

    final mxvarietesBox = ObjectBox.mxvarietesBox;
    var mesVarietes = mxvarietesBox?.getAll();

    mesVarietes?.forEach((element) {
      Map<String, dynamic> mxProduiteMap = {
        'id': element.mxProduitObject.target!.id,
        'name': element.mxProduitObject.target!.name,
        'isDerive': element.mxProduitObject.target!.isDerive,
        'isEnsachage': element.mxProduitObject.target!.isEnsachage,
        'isActive': element.mxProduitObject.target!.isActive,
      };

      list.add(DropdownItem(
          id: element.id.toString(),
          value:
              '${element.mxProduitObject.target!.name.toString().toUpperCase()} | ${element.name.toString().toUpperCase()}',
          data: MxVarieteObject(
              id: element.id,
              name: element.name,
              surface_unite: element.surface_unite,
              quantite_unite: element.quantite_unite,
              pu_unite: element.pu_unite,
              rendement_unite: element.rendement_unite,
              isActive: element.isActive,
              produit: mxProduiteMap)));
    });

    itemVarietesList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR UNE VARIETE",
        labelText: "VARIETE",
        hintText: "Selection variété",
        list: itemVarietesList,
        selectedId: singleSelectedVarieteId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedVarieteId = selectedItem.id;
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;
          MxVarieteObject varieteObject = selectedItem.data as MxVarieteObject;

          print(varieteObject.toJson());
          idProduit = varieteObject.produit['id'];

          _textFieldPrixUnitaireController.text =
              Constants.formatNumber(varieteObject.pu_unite ?? 0.0).toString();

          final mxemballageBox = ObjectBox.mxemballagesBox;
          MxEmballageObject? myEmballage = mxemballageBox!
              .query(MxEmballageObject_.mxProduitObject.equals(idProduit))
              .build()
              .findFirst();
          singleSelectedEmballageId = myEmballage!.id.toString();

          this.unite =
              myEmballage!.mxUniteGrandeurObject.target!.name.toString();

          titleSelectedEmballage = "CHOISIR UN " +
              myEmballage.mxTypeEmballageObject.target!.name.toString();

          labelTextSelectedEmballage =
              myEmballage.mxTypeEmballageObject.target!.name.toString();

          hintTextTextSelectedEmballage = "Selection " +
              myEmballage.mxTypeEmballageObject.target!.name.toString();

          // print("Item Id: $itemId -- Item Name: $itemName ## Other Details ## Variete Id: ${varieteObject.id} -- Variete name: ${varieteObject.name} ");
        });
  }

  _renderEmballagesItems(int myIdProduit) {
    List<DropdownItem> itemEmballagesList = [];
    List<DropdownItem> list = [];

    final mxemballagesBox = ObjectBox.mxemballagesBox;
    Query<MxEmballageObject> query = mxemballagesBox!
        .query(MxEmballageObject_.mxProduitObject.equals(myIdProduit))
        .build();

    //print('widget.idProduit ' + idProduit.toString());
    List<MxEmballageObject> mesEmballages = query.find();

    mesEmballages.forEach((element) {
      list.add(DropdownItem(
          id: element.id.toString(),
          // value: '${element.mxProduitObject.target!.name.toString().toUpperCase()} | ${element.name.toString().toUpperCase()}',
          value: '${element.name.toString().toUpperCase()}',
          data: MxEmballageObject(
              id: element.id,
              name: element.name,
              conditionnement: element.conditionnement,
              quantite: element.quantite,
              pu: element.pu,
              valeur: element.valeur,
              isActive: element.isActive,
              isDefault: element.isDefault,
              uniteGrandeur: element.mxUniteGrandeurObject.target!.toJson())));
    });

    itemEmballagesList = list;
    return Dropdown.singleSelection(
        title: titleSelectedEmballage,
        labelText: labelTextSelectedEmballage,
        hintText: hintTextTextSelectedEmballage,
        list: itemEmballagesList,
        selectedId: singleSelectedEmballageId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedEmballageId = selectedItem.id;
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;
          MxEmballageObject emballageObject =
              selectedItem.data as MxEmballageObject;

          print(emballageObject.uniteGrandeur);

          this.unite = emballageObject.uniteGrandeur['name'];

          //print("Item Id: $itemId -- Item Name: $itemName ## Other Detailsvar ballage Id: ${emballageObject.id} -- Emballage name: ${emballageObject.name}");
        });
  }

  _renderModeEntreeSortieStocksItems() {
    List<DropdownItem> itemModeEntreeSortieStocksList = [];
    List<DropdownItem> list = [];

    final mxmodeEntreeSortieStocksBox = ObjectBox.mxmodeentreesortiestocksBox;
    var mesModeEntreeSortieStocks = mxmodeEntreeSortieStocksBox?.getAll();

    mesModeEntreeSortieStocks?.forEach((element) {
      Map<String, dynamic> mxTypeMouvementStockMap = {
        'id': element.mxtypemouvementstockObject.target!.id,
        'name': element.mxtypemouvementstockObject.target!.name,
      };

      list.add(DropdownItem(
          id: element.id.toString(),
          value:
              '${element.mxtypemouvementstockObject.target!.name.toString().toUpperCase()} | ${element.name.toString().toUpperCase()}',
          data: MxModeEntreeSortieStockObject(
            id: element.id,
            code: element.code,
            name: element.name,
            typeMouvementStock: mxTypeMouvementStockMap,
          )));
    });

    itemModeEntreeSortieStocksList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR TYPE MOUVEMENT STOCK",
        labelText: "TYPE MOUVEMENT STOCK",
        hintText: "Selection type mouvement stock",
        list: itemModeEntreeSortieStocksList,
        selectedId: singleSelectedModeEntreeSortieStockId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedModeEntreeSortieStockId = selectedItem.id;
            print('_isButtonDisabled: $_isButtonDisabled');
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;

/*
          MxModeEntreeSortieStockObject modeEntreeSortieStockObject =
              selectedItem.data as MxModeEntreeSortieStockObject;

          idTypeMouvementStock =
              modeEntreeSortieStockObject.typeMouvementStock['id'];
              */

          // print('modeEntreeSortieStockObject.typeMouvementStock: ${modeEntreeSortieStockObject.typeMouvementStock['id']}');
          //print("Item Id: $itemId -- Item Name: $itemName ## Other Details ## ModeEntreeSortieStock Id: ${modeEntreeSortieStockObject.id} -- ModeEntreeSortieStock name: ${modeEntreeSortieStockObject.name} ");
        });
  }

  _renderOpsItems(int idPoint) {
    List<DropdownItem> itemOpsList = [];
    List<DropdownItem> list = [];

    final mxopsBox = ObjectBox.mxopsBox;
    Query<MxOpObject> query =
        mxopsBox!.query(MxOpObject_.mxPointObject.equals(idPoint)).build();
    var mesOps = query.find();
    query.close();

    mesOps?.forEach((element) {
      //print('element: ${element.name} pointId: ${element.mxPointObject.target!.id} pointName: ${element.mxPointObject.target!.name}');
      list.add(DropdownItem(
          id: element.id.toString(),
          value:
              '${element.mxTypeOpObject.target!.name.toString().toUpperCase()} | ${element.name.toString().toUpperCase()}',
          data: MxOpObject(
            id: element.id,
            name: element.name,
            sigle: element.sigle,
            email: element.email,
            telephone: element.telephone,
            adresse: element.adresse,
            prenom_contact: element.prenom_contact,
            nom_contact: element.nom_contact,
            email_contact: element.email_contact,
            telephone_contact: element.telephone_contact,
          )));
    });

    itemOpsList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR OP",
        labelText: "OP",
        hintText: "Selection OP",
        list: itemOpsList,
        selectedId: singleSelectedOpId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedOpId = selectedItem.id;
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;

          MxOpObject opObject = selectedItem.data as MxOpObject;

          // print('modeEntreeSortieStockObject.typeMouvementStock: ${modeEntreeSortieStockObject.typeMouvementStock['id']}');
          print("Item Id: $itemId -- Item Name: $itemName ## ");
        });
  }

  _renderEmplacementsItems(int idPoint) {
    List<DropdownItem> itemEmplacementsList = [];
    List<DropdownItem> list = [];

    final mxemplacementsBox = ObjectBox.mxemplacementsBox;
    Query<MxEmplacementObject> query = mxemplacementsBox!
        // .query()
        .query(MxEmplacementObject_.mxentrepotObject.notEquals(1))
        .build();
    var mesEmplacements = query.find();
    query.close();

    mesEmplacements?.forEach((element) {
      if (element.mxentrepotObject.target!.mxpointObject.target!.id ==
          idPoint) {
        //print('element: ${element.name} entrepotId: ${element.mxentrepotObject.target!.id} entrepotName: ${element.mxentrepotObject.target!.name}');
        list.add(DropdownItem(
            id: element.id.toString(),
            value: ' ${element.name.toString().toUpperCase()}',
            data: MxEmplacementObject(
              id: element.id,
              name: element.name,
              code: element.code,
              capacite: element.capacite,
            )));
      }
    });

    itemEmplacementsList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR EMPLACEMENT",
        labelText: "EMPLACEMENT",
        hintText: "Selection EMPLACEMENT",
        list: itemEmplacementsList,
        selectedId: singleSelectedEmplacementId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedEmplacementId = selectedItem.id;
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;

          // print('modeEntreeSortieStockObject.typeMouvementStock: ${modeEntreeSortieStockObject.typeMouvementStock['id']}');
          print("Item Id: $itemId -- Item Name: $itemName ## ");
        });
  }

  _renderUniteTransformationsItems() {
    List<DropdownItem> itemUniteTransformationsList = [];
    List<DropdownItem> list = [];

    final mxuniteTransformationsBox = ObjectBox.mxunitetransformationsBox;
    var mesUniteTransformations = mxuniteTransformationsBox?.getAll();

    mesUniteTransformations?.forEach((element) {
      list.add(DropdownItem(
          id: element.id.toString(),
          value:
              '${element.sigle.toString().toUpperCase()} | ${element.name.toString().toUpperCase()}',
          data: MxUniteTransformationObject(
            id: element.id,
            sigle: element.sigle,
            name: element.name,
            adresse: element.adresse,
            telephone: element.telephone,
          )));
    });

    itemUniteTransformationsList = list;
    return Dropdown.singleSelection(
        title: "CHOISIR INDUSTRIEL",
        labelText: "INDUSTRIEL",
        hintText: "Selection Industriel",
        list: itemUniteTransformationsList,
        selectedId: singleSelectedUniteTransformationId,
        onTapAddItem: (searchValue) {
          print(searchValue);
        },
        onSingleItemListener: (selectedItem) {
          setState(() {
            singleSelectedUniteTransformationId = selectedItem.id;
          });

          String itemId = selectedItem.id;
          String itemName = selectedItem.value;

          MxUniteTransformationObject uniteTransformationObject =
              selectedItem.data as MxUniteTransformationObject;

          //print('singleSelectedUniteTransformationId: ${singleSelectedUniteTransformationId}');

          // print('modeEntreeSortieStockObject.typeMouvementStock: ${modeEntreeSortieStockObject.typeMouvementStock['id']}');
          print("Item Id: $itemId -- Item Name: $itemName ## ");
        });
  }

// Method to check if the form is valid
  void _validateForm() {
    print('_formKey.currentState: ${_formKey.currentState}');
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

// set up the AlertDialog
  GFAlert alert = GFAlert(
    type: GFAlertType.rounded,
    title: 'Alerte avec Action',
    content: Text("Action terminée !"),
    bottomBar: GFButton(
      onPressed: () {
        //Navigator.of(context).pop(); // Fermer l'alerte
      },
      text: "Fermer",
    ),
  );
  void _showAlertGF(BuildContext context) {
    GFAlert(
      type: GFAlertType.rounded,
      title: 'Alerte avec Action',
      content: Text("Action terminée !"),
      bottomBar: GFButton(
        onPressed: () {
          //Navigator.of(context).pop(); // Fermer l'alerte
        },
        text: "Fermer",
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerte champs'),
          content: Text('$message: est vide'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Récupérer les arguments passés lors de la navigation
    /*
    return Form(
        key: _formKey,
        //onChanged: _validateForm,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                // Marge avant le conteneur 
                // SizedBox(height: 5),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: _renderAnneesItems(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: _renderSaisonsItems(),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(height: 20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: _renderEmplacementsItems(idPoint),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(height: 20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: _renderModeEntreeSortieStocksItems(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(height: 20),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: singleSelectedModeEntreeSortieStockId == '1'
                        ? _renderOpsItems(idPoint)
                        : _renderUniteTransformationsItems()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(height: 20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextField(
                    controller: _dateTextEditingController,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      //icon: Icon(Icons.calendar_today),
                      labelText: "Date", //label text of field
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),

                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          locale: const Locale("fr", "FR"),
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2030),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.dark(),
                              child: child!,
                            );
                          });

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd MMMM yyyy', 'fr_FR')
                                .format(pickedDate);
                        //String formattedDate = DateFormat('dd MMMM yyyy', 'fr_FR');
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          _dateTextEditingController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: _renderVarietesItems(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(height: 15),
                ),
                if (idProduit != 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ENTRER LE P.U SVP';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // print('value: $value');
                        print('_isButtonDisabled: $_isButtonDisabled');
                      },
                      controller: _textFieldPrixUnitaireController,
                      readOnly: false,
                      textAlign: TextAlign.right,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(_getRegexString())),
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(
                            text: newValue.text.replaceAll('.', ','),
                          ),
                        ),
                      ],
                      decoration: InputDecoration(
                        labelText: 'P.U' + ' ( ' + this.unite + ' )',
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                if (idProduit != 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                if (idProduit != 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: _renderEmballagesItems(idProduit),
                  ),
                if (idProduit != 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      height: 15,
                    ),
                  ),
                if (idProduit != 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ENTRER LE NB SAC SVP';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // print('value: $value');
                      },
                      controller: _textFieldQteController,
                      readOnly: false,
                      textAlign: TextAlign.right,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(_getRegexString())),
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(
                            text: newValue.text.replaceAll('.', ','),
                          ),
                        ),
                      ],
                      decoration: InputDecoration(
                        labelText: 'NOMBRE - SAC',
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Positioned(
                  bottom:
                      20, // Ajustez la position verticale selon vos préférences
                  left:
                      0, // Ajustez la position horizontale selon vos préférences
                  right:
                      0, // Ajustez la position horizontale selon vos préférences
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GFButton(
                            size: GFSize.LARGE,
                            text: 'Add',
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: GFColors.WHITE,
                            ),
                            icon: const Icon(
                              Icons.add,
                            ),
                            color: GFColors.WARNING,
                            onPressed: _isButtonDisabled
                                ? null
                                : () {
                                  /*
                                    if (_formKey.currentState!.validate() ) {
                                      /* DEBUT FORMATAGE DATE */
                                      String originalDateString =
                                          _dateTextEditingController.text
                                              .trim(); // Example date string in dd-MM-yyyy format
                                      DateFormat originalFormat =
                                          DateFormat('dd MMMM yyyy', 'fr_FR');
                                      DateFormat targetFormat =
                                          DateFormat('yyyy-MM-dd');
                                      DateTime parsedDate = originalFormat
                                          .parse(originalDateString);
                                      String targetDateString =
                                          targetFormat.format(parsedDate);
                                      /* FIN FORMATAGE DATE */

                                      final mxanneesBox = ObjectBox.mxanneesBox;
                                      MxAnneeObject myAnnee = mxanneesBox!.get(
                                          int.parse(singleSelectedAnneeId))!;

                                      final mxsaisonsBox =
                                          ObjectBox.mxsaisonsBox;
                                      MxSaisonObject mySaison = mxsaisonsBox!
                                          .get(int.parse(
                                              singleSelectedSaisonId))!;

                                      final mxvarietesBox =
                                          ObjectBox.mxvarietesBox;
                                      MxVarieteObject? myVariete =
                                          mxvarietesBox!.get(int.parse(
                                              singleSelectedVarieteId))!;

                                      final mxemballageBox =
                                          ObjectBox.mxemballagesBox;
                                      MxEmballageObject myEmballage =
                                          mxemballageBox!.get(int.parse(
                                              singleSelectedEmballageId))!;

                                      final mxmodentreesortiestocksBox =
                                          ObjectBox.mxmodeentreesortiestocksBox;
                                      MxModeEntreeSortieStockObject?
                                          myModeEntreeSortieStock =
                                          mxmodentreesortiestocksBox!.get(int.parse(
                                              singleSelectedModeEntreeSortieStockId))!;

                                      MxUniteTransformationObject?
                                          myUniteTransformation = null;

                                      MxOpObject? myOp = null;

                                      if (myModeEntreeSortieStock
                                              .mxtypemouvementstockObject
                                              .target!
                                              .id ==
                                          2) {
                                        final mxunitetrensformationsBox =
                                            ObjectBox.mxunitetransformationsBox;
                                        myUniteTransformation =
                                            mxunitetrensformationsBox!.get(
                                                int.parse(
                                                    singleSelectedUniteTransformationId))!;
                                      }

                                      if (myModeEntreeSortieStock
                                              .mxtypemouvementstockObject
                                              .target!
                                              .id ==
                                          1) {
                                        final mxopsBox = ObjectBox.mxopsBox;
                                        myOp = mxopsBox!.get(
                                            int.parse(singleSelectedOpId))!;
                                      }

                                      final mxemplacementsBox =
                                          ObjectBox.mxemplacementsBox;
                                      MxEmplacementObject? myEmplacement =
                                          mxemplacementsBox!.get(int.parse(
                                              singleSelectedEmplacementId))!;

                                      MxMouvementStockObject object =
                                          MxMouvementStockObject(
                                        id: 0,
                                        date: DateTime.parse(targetDateString),
                                        pu: double.parse(
                                            _textFieldPrixUnitaireController
                                                .text),
                                        quantiteEntreeEmballage:
                                            myModeEntreeSortieStock
                                                        .mxtypemouvementstockObject
                                                        .target!
                                                        .id ==
                                                    1
                                                ? double.parse(
                                                    _textFieldQteController
                                                        .text)
                                                : 0,
                                        quantiteSortieEmballage:
                                            myModeEntreeSortieStock
                                                        .mxtypemouvementstockObject
                                                        .target!
                                                        .id ==
                                                    2
                                                ? double.parse(
                                                    _textFieldQteController
                                                        .text)
                                                : 0,
                                        nombreUnite: myEmballage.quantite *
                                            double.parse(
                                                _textFieldQteController.text),
                                        valeur: myEmballage.quantite *
                                            double.parse(
                                                _textFieldQteController.text) *
                                            double.parse(
                                                _textFieldPrixUnitaireController
                                                    .text),
                                        lot: '',
                                      );

                                      object.mxvarieteObject.target = myVariete;
                                      object.mxsaisonObject.target = mySaison;
                                      object.mxanneeObject.target = myAnnee;
                                      object.mxopObject.target = myOp;
                                      object.mxmodeentreesortiestockObject
                                          .target = myModeEntreeSortieStock;
                                      object.mxemballageObject.target =
                                          myEmballage;
                                      object.mxunitetransformationObject
                                          .target = myUniteTransformation;
                                      object.mxemplacementObject.target =
                                          myEmplacement;

                                      print(object.toJson());

                                      if (widget.idStockage == 0) {
                                        print('ADD');
                                        final mxmouvementstocksBox =
                                            ObjectBox.mxmouvementstocksBox;
                                        int idMouvementStock =
                                            mxmouvementstocksBox!.put(object);

                                        print(
                                            'idRemboursement: $idMouvementStock');
                                        NombreAddOrEdit = NombreAddOrEdit + 1;
                                      }
                                      if (widget.idStockage != 0) {
                                        print('UPDATE');
                                        NombreAddOrEdit = NombreAddOrEdit + 1;
                                      }

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Formulaire valide')));
                                    }
                                    */
                                  },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GFButton(
                            size: GFSize.LARGE,
                            text: 'Cancel',
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: GFColors.WHITE,
                            ),
                            icon: const Icon(
                              Icons.cancel,
                            ),
                            color: GFColors.SUCCESS,
                            onPressed: () {
                              if (NombreAddOrEdit == 0) {
                                Navigator.of(context).pop();
                              }
                              if (NombreAddOrEdit != 0) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/list_stockage');
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ));
  */

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(children: [
            // Marge avant le conteneur
            // SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: _renderAnneesItems(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: _renderSaisonsItems(),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(height: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _renderEmplacementsItems(idPoint),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(height: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _renderModeEntreeSortieStocksItems(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(height: 20),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: singleSelectedModeEntreeSortieStockId == '1'
                    ? _renderOpsItems(idPoint)
                    : _renderUniteTransformationsItems()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(height: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                controller: _dateTextEditingController,
                //editing controller of this TextField
                decoration: InputDecoration(
                  //icon: Icon(Icons.calendar_today),
                  labelText: "Date", //label text of field
                  labelStyle:
                      TextStyle(fontSize: 18, color: Colors.grey.shade800),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),

                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      locale: const Locale("fr", "FR"),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.dark(),
                          child: child!,
                        );
                      });

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd MMMM yyyy', 'fr_FR').format(pickedDate);
                    //String formattedDate = DateFormat('dd MMMM yyyy', 'fr_FR');
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      _dateTextEditingController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                height: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _renderVarietesItems(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(height: 15),
            ),
            if (idProduit != 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: TextField(
                  onChanged: (value) {
                    // print('value: $value');
                  },
                  controller: _textFieldPrixUnitaireController,
                  readOnly: false,
                  textAlign: TextAlign.right,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(_getRegexString())),
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => newValue.copyWith(
                        text: newValue.text.replaceAll('.', ','),
                      ),
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'P.U' + ' ( ' + this.unite + ' )',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            if (idProduit != 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: SizedBox(
                  height: 15,
                ),
              ),
            if (idProduit != 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: _renderEmballagesItems(idProduit),
              ),
            if (idProduit != 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: SizedBox(
                  height: 15,
                ),
              ),
            if (idProduit != 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: TextField(
                  onChanged: (value) {
                    // print('value: $value');
                  },
                  controller: _textFieldQteController,
                  readOnly: false,
                  textAlign: TextAlign.right,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(_getRegexString())),
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => newValue.copyWith(
                        text: newValue.text.replaceAll('.', ','),
                      ),
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'NOMBRE - SAC',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),

            /*
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: TextField(
                        onChanged: (value) {
                          // print('value: $value');
                        },
                        controller: _textFieldQteController,
                        readOnly: false,
                        textAlign: TextAlign.right,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(_getRegexString())),
                          TextInputFormatter.withFunction(
                            (oldValue, newValue) => newValue.copyWith(
                              text: newValue.text.replaceAll('.', ','),
                            ),
                          ),
                        ],
                        decoration: InputDecoration(
                          labelText: 'NOMBRE - SAC',
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: _renderEmballagesItems(idProduit),
                    ),
                  ),
                ]),
              ),
            */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                height: 10,
              ),
            ),
            Positioned(
              bottom: 20, // Ajustez la position verticale selon vos préférences
              left: 0, // Ajustez la position horizontale selon vos préférences
              right: 0, // Ajustez la position horizontale selon vos préférences
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GFButton(
                        size: GFSize.LARGE,
                        text: 'Add',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: GFColors.WHITE,
                        ),
                        icon: const Icon(
                          Icons.add,
                        ),
                        color: GFColors.WARNING,
                        onPressed: () {
                          if (_textFieldPrixUnitaireController.text == "") {
                            _showAlertDialog(context, 'Prix Unitaire');
                            return;
                          }
                          if (_textFieldQteController.text == "") {
                            _showAlertDialog(context, 'Quantié');
                            return;
                          } else if (singleSelectedEmballageId == "") {
                            _showAlertDialog(context, 'Emballage');
                            return;
                          } else if (singleSelectedEmplacementId == "") {
                            _showAlertDialog(context, 'Emplacement');
                            return;
                          } else if (singleSelectedAnneeId == "") {
                            _showAlertDialog(context, 'Annees');
                            return;
                          } else if (singleSelectedSaisonId == "") {
                            _showAlertDialog(context, 'Saisons');
                            return;
                          } else if (singleSelectedVarieteId == "") {
                            _showAlertDialog(context, 'Varietes');
                            return;
                          } else if (singleSelectedModeEntreeSortieStockId ==
                              "") {
                            _showAlertDialog(
                                context, 'Mode Entree/Sortie Stock');
                            return;
                          } else if (singleSelectedModeEntreeSortieStockId ==
                              1) {
                            if (singleSelectedOpId == "") {
                              _showAlertDialog(context, 'OP');
                              return;
                            }
                          } else if (singleSelectedModeEntreeSortieStockId ==
                              2) {
                            if (singleSelectedOpId == "") {
                              _showAlertDialog(context, 'Unité Transformation');
                              return;
                            }
                          } else {
                            /* DEBUT FORMATAGE DATE */
                            String originalDateString = _dateTextEditingController
                                .text
                                .trim(); // Example date string in dd-MM-yyyy format
                            DateFormat originalFormat =
                                DateFormat('dd MMMM yyyy', 'fr_FR');
                            DateFormat targetFormat = DateFormat('yyyy-MM-dd');
                            DateTime parsedDate =
                                originalFormat.parse(originalDateString);
                            String targetDateString =
                                targetFormat.format(parsedDate);
                            /* FIN FORMATAGE DATE */

                            final mxanneesBox = ObjectBox.mxanneesBox;
                            MxAnneeObject myAnnee = mxanneesBox!
                                .get(int.parse(singleSelectedAnneeId))!;

                            final mxsaisonsBox = ObjectBox.mxsaisonsBox;
                            MxSaisonObject mySaison = mxsaisonsBox!
                                .get(int.parse(singleSelectedSaisonId))!;

                            final mxvarietesBox = ObjectBox.mxvarietesBox;
                            MxVarieteObject? myVariete = mxvarietesBox!
                                .get(int.parse(singleSelectedVarieteId))!;

                            final mxemballageBox = ObjectBox.mxemballagesBox;
                            MxEmballageObject myEmballage = mxemballageBox!
                                .get(int.parse(singleSelectedEmballageId))!;

                            final mxmodentreesortiestocksBox =
                                ObjectBox.mxmodeentreesortiestocksBox;
                            MxModeEntreeSortieStockObject?
                                myModeEntreeSortieStock =
                                mxmodentreesortiestocksBox!.get(int.parse(
                                    singleSelectedModeEntreeSortieStockId))!;

                            MxUniteTransformationObject? myUniteTransformation =
                                null;

                            MxOpObject? myOp = null;

                            if (myModeEntreeSortieStock
                                    .mxtypemouvementstockObject.target!.id ==
                                2) {
                              final mxunitetrensformationsBox =
                                  ObjectBox.mxunitetransformationsBox;
                              myUniteTransformation = mxunitetrensformationsBox!
                                  .get(int.parse(
                                      singleSelectedUniteTransformationId))!;
                            }

                            if (myModeEntreeSortieStock
                                    .mxtypemouvementstockObject.target!.id ==
                                1) {
                              final mxopsBox = ObjectBox.mxopsBox;
                              myOp =
                                  mxopsBox!.get(int.parse(singleSelectedOpId))!;
                            }

                            final mxemplacementsBox =
                                ObjectBox.mxemplacementsBox;
                            MxEmplacementObject? myEmplacement =
                                mxemplacementsBox!.get(
                                    int.parse(singleSelectedEmplacementId))!;

                            MxMouvementStockObject object =
                                MxMouvementStockObject(
                              id: 0,
                              date: DateTime.parse(targetDateString),
                              pu: double.parse(
                                  _textFieldPrixUnitaireController.text),
                              quantiteEntreeEmballage: myModeEntreeSortieStock
                                          .mxtypemouvementstockObject
                                          .target!
                                          .id ==
                                      1
                                  ? double.parse(_textFieldQteController.text)
                                  : 0,
                              quantiteSortieEmballage: myModeEntreeSortieStock
                                          .mxtypemouvementstockObject
                                          .target!
                                          .id ==
                                      2
                                  ? double.parse(_textFieldQteController.text)
                                  : 0,
                              nombreUnite: myEmballage.quantite *
                                  double.parse(_textFieldQteController.text),
                              valeur: myEmballage.quantite *
                                  double.parse(_textFieldQteController.text) *
                                  double.parse(
                                      _textFieldPrixUnitaireController.text),
                              lot: '',
                              isSended: false,
                              dateSended: null,

                              /*
                            variete: myVariete.toJson(),
                            saison: mySaison.toJson(),
                            annee: myAnnee.toJson(),
                            op: myOp.toJson(),
                            uniteTransformation: myUniteTransformation.toJson(),
                            modeEntreeSortieStock:
                                myModeEntreeSortieStock.toJson(),
                            emballage: myEmballage.toJson(),
                            emplacement: myEMplacement.toJson(),
                            */
                            );

                            object.mxvarieteObject.target = myVariete;
                            object.mxsaisonObject.target = mySaison;
                            object.mxanneeObject.target = myAnnee;
                            object.mxopObject.target = myOp;
                            object.mxmodeentreesortiestockObject.target =
                                myModeEntreeSortieStock;
                            object.mxemballageObject.target = myEmballage;
                            object.mxunitetransformationObject.target =
                                myUniteTransformation;
                            object.mxemplacementObject.target = myEmplacement;

                            print(object.toJson());

                            if (widget.idStockage == 0) {
                              print('ADD');
                              final mxmouvementstocksBox =
                                  ObjectBox.mxmouvementstocksBox;
                              int idMouvementStock =
                                  mxmouvementstocksBox!.put(object);

                              this._textFieldQteController.clear();

                              print('idRemboursement: $idMouvementStock');
                              NombreAddOrEdit = NombreAddOrEdit + 1;
                            }
                            if (widget.idStockage != 0) {
                              print('UPDATE');
                              NombreAddOrEdit = NombreAddOrEdit + 1;
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GFButton(
                        size: GFSize.LARGE,
                        text: 'Cancel',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: GFColors.WHITE,
                        ),
                        icon: const Icon(
                          Icons.cancel,
                        ),
                        color: GFColors.SUCCESS,
                        onPressed: () {
                          if (NombreAddOrEdit == 0) {
                            Navigator.of(context).pop();
                          }
                          if (NombreAddOrEdit != 0) {
                            Navigator.of(context)
                                .pushReplacementNamed('/list_stockage');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  String _getRegexString() => true ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';

import '../../../features/auth/data/service/ApiServices.dart';
import '../../../objectbox.g.dart';
import '../../res/constants.dart';
import '../model/ObjectBox/objectBoxModels.dart';

final ApiService apiService = ApiService();

class ObjectBox {
  /// The Store of this app.
  ///
  static List<dynamic> url_var = [];
  static List<dynamic> res_var = [];

  late final Store store;

  ///********************* BOX ************************ */
  static Box<MxPostObject>? mxpostBox;
  static Box<MxCommentObject>? mxcommentBox;

  static Box<MxUserObject>? mxuserBox;
  static Box<MxRoleObject>? mxroleBox;
  static Box<MxUserPermissionObject>? mxuserPermissionBox;
  static Box<MxTypeChargeExploitationObject>? mxtypeChargeExploitationsBox;
  static Box<MxFamilleChargeExploitationObject>?
      mxfamilleChargeExploitationsBox;
  static Box<MxChargeExploitationObject>? mxchargeExploitationsBox;
  static Box<MxExploitationObject>? mxexploitationBox;
  static Box<MxExploitationChargeExploitationObject>?
      mxexploitationChargeExploitationObjectBox;
  static Box<MxFiliereObject>? mxfilieresBox;
  static Box<MxFamilleEmplacementObject>? mxfamilleEmplacementsBox;
  static Box<MxProduitObject>? mxproduitsBox;
  static Box<MxVarieteObject>? mxvarietesBox;
  static Box<MxAnneeObject>? mxanneesBox;
  static Box<MxSaisonObject>? mxsaisonsBox;
  static Box<MxCampagneObject>? mxcampagnesBox;
  static Box<MxPaysObject>? mxpaysBox;
  static Box<MxZoneObject>? mxzonesBox;
  static Box<MxSousZoneObject>? mxsouszonesBox;
  static Box<MxLocaliteObject>? mxlocalitesBox;
  static Box<MxVillageObject>? mxvillagesBox;
  static Box<MxPointObject>? mxpointsBox;
  static Box<MxTypeOpObject>? mxtypeopsBox;
  static Box<MxOpObject>? mxopsBox;
  static Box<MxProducteurObject>? mxproducteursBox;

  static Box<MxTypeEmballageObject>? mxtypeemballagesBox;
  static Box<MxTypeUniteGrandeurObject>? mxtypeunitegrandeursBox;
  static Box<MxUniteGrandeurObject>? mxunitegrandeursBox;
  static Box<MxEmballageObject>? mxemballagesBox;

  static Box<MxRecolteObject>? mxrecoltesBox;
  static Box<MxRemboursementObject>? mxremboursementsBox;
  static Box<MxCreditObject>? mxcreditsBox;

  static Box<MxUserOpObject>? mxuserOpBox;
  static Box<MxUserPointObject>? mxuserPointBox;

  static Box<MxTypeMouvementStockObject>? mxtypemouvementstocksBox;
  static Box<MxModeEntreeSortieStockObject>? mxmodeentreesortiestocksBox;
  static Box<MxMouvementStockObject>? mxmouvementstocksBox;
  static Box<MxUniteTransformationObject>? mxunitetransformationsBox;
  static Box<MxEntrepotObject>? mxentrepotsBox;
  static Box<MxEmplacementObject>? mxemplacementsBox;
  static Box<MxProduitChargeExploitationObject>?
      mxproduitchargeexploitationsBox;

  ///*********************END BOX ************************ */
  static Box<UserObject>? userBox;
  static Box<SaisonObject>? saisonsBox;
  static Box<AnneeObject>? anneesBox;
  static Box<EmballageObject>? emballagesBox;
  static Box<VarieteObject>? varietesBox;
  static Box<TypeChargeExploitationObject>? typeChargeExploitationsBox;
  static Box<OpObject>? opsBox;
  static Box<FamilleChargeExploitationObject>? familleChargeExploitationsBox;
  static Box<ChargeExploitationObject>? chargeExploitationsBox;
  static Box<ExploitationChargeExploitationObject>?
      exploitationChargeExploitationBox;
  static Box<ExploitationObject>? exploitationsBox;
  static Box<UserOpObject>? userOpBox;
  static Box<UserPointObject>? userPointBox;
  static Box<UserUniteTransformationObject>? userUniteTransformationBox;
  static Box<ProducteurObject>? producteurBox;
  static Box<TypeTransformationObject>? typeTransformationBox;

  ObjectBox._create(this.store) {
    /******************** BOX ************************ */
    mxpostBox = Box<MxPostObject>(store);
    mxcommentBox = Box<MxCommentObject>(store);

    mxroleBox = Box<MxRoleObject>(store);
    mxuserBox = Box<MxUserObject>(store);
    mxuserPermissionBox = Box<MxUserPermissionObject>(store);
    mxtypeChargeExploitationsBox = Box<MxTypeChargeExploitationObject>(store);
    mxfamilleChargeExploitationsBox =
        Box<MxFamilleChargeExploitationObject>(store);
    mxchargeExploitationsBox = Box<MxChargeExploitationObject>(store);
    mxexploitationBox = Box<MxExploitationObject>(store);
    mxexploitationChargeExploitationObjectBox =
        Box<MxExploitationChargeExploitationObject>(store);
    mxfilieresBox = Box<MxFiliereObject>(store);
    mxfamilleEmplacementsBox = Box<MxFamilleEmplacementObject>(store);
    mxproduitsBox = Box<MxProduitObject>(store);
    mxvarietesBox = Box<MxVarieteObject>(store);
    mxanneesBox = Box<MxAnneeObject>(store);
    mxsaisonsBox = Box<MxSaisonObject>(store);
    mxcampagnesBox = Box<MxCampagneObject>(store);

    mxpaysBox = Box<MxPaysObject>(store);
    mxzonesBox = Box<MxZoneObject>(store);
    mxsouszonesBox = Box<MxSousZoneObject>(store);
    mxlocalitesBox = Box<MxLocaliteObject>(store);
    mxvillagesBox = Box<MxVillageObject>(store);
    mxpointsBox = Box<MxPointObject>(store);
    mxtypeopsBox = Box<MxTypeOpObject>(store);
    mxopsBox = Box<MxOpObject>(store);
    mxproducteursBox = Box<MxProducteurObject>(store);
    mxrecoltesBox = Box<MxRecolteObject>(store);
    mxremboursementsBox = Box<MxRemboursementObject>(store);
    mxcreditsBox = Box<MxCreditObject>(store);

    mxtypeemballagesBox = Box<MxTypeEmballageObject>(store);
    mxtypeunitegrandeursBox = Box<MxTypeUniteGrandeurObject>(store);
    mxunitegrandeursBox = Box<MxUniteGrandeurObject>(store);
    mxemballagesBox = Box<MxEmballageObject>(store);

    mxuserOpBox = Box<MxUserOpObject>(store);
    mxuserPointBox = Box<MxUserPointObject>(store);

    mxtypemouvementstocksBox = Box<MxTypeMouvementStockObject>(store);
    mxmodeentreesortiestocksBox = Box<MxModeEntreeSortieStockObject>(store);
    mxmouvementstocksBox = Box<MxMouvementStockObject>(store);
    mxunitetransformationsBox = Box<MxUniteTransformationObject>(store);
    mxentrepotsBox = Box<MxEntrepotObject>(store);
    mxemplacementsBox = Box<MxEmplacementObject>(store);
    mxproduitchargeexploitationsBox =
        Box<MxProduitChargeExploitationObject>(store);

    /******************** END BOX ************************* */
    userBox = Box<UserObject>(store);

    userOpBox = Box<UserOpObject>(store);
    userPointBox = Box<UserPointObject>(store);
    userUniteTransformationBox = Box<UserUniteTransformationObject>(store);
    producteurBox = Box<ProducteurObject>(store);
    saisonsBox = Box<SaisonObject>(store);
    anneesBox = Box<AnneeObject>(store);
    emballagesBox = Box<EmballageObject>(store);
    varietesBox = Box<VarieteObject>(store);
    //typeOpsBox = Box<TypeOpObject>(store);
    opsBox = Box<OpObject>(store);
    typeChargeExploitationsBox = Box<TypeChargeExploitationObject>(store);
    familleChargeExploitationsBox = Box<FamilleChargeExploitationObject>(store);
    chargeExploitationsBox = Box<ChargeExploitationObject>(store);
    exploitationsBox = Box<ExploitationObject>(store);
    exploitationChargeExploitationBox =
        Box<ExploitationChargeExploitationObject>(store);
    typeTransformationBox = Box<TypeTransformationObject>(store);

    /*********************** VOIR SI CONNECTIVITY *********************/
    //getUserData(); //
    //if (!userObject!.isEmpty()) {
    // getProducteurData();
    // getSaisonData(); //
    // getAnneeData(); //
    // getVarieteData(); //
    // getTypeChargeExploitationData(); //
    // getTypeOpData(); //
    // getOpData(); //
    // getFamilleExploitationData(); //
    // getChargeExploitationData(); //
    // getExploitationData(); //
    // getExploitationChargeExploitationData();
    //} //
    /*********************** VOIR SI CONNECTIVITY 
    for (int i = 0; i < Constants.producteurIdList.length; i++) {
      print('item --- : ' + Constants.producteurIdList[i].toString());
    }
    *********************/
    if (Admin.isAvailable()) {
      // Keep a reference until no longer needed or manually closed.
      Admin(store);
    }
  }

  static loadDatas() async {
    getMxUserData();
    if (mxtypeChargeExploitationsBox!.isEmpty() ||
        mxtypeChargeExploitationsBox!.count() == 0) {
      await getMxTypeChargeExploitationData();
    }
    if (mxanneesBox!.isEmpty() || mxanneesBox!.count() == 0) {
      await getMxAnneeData();
    }
    if (mxsaisonsBox!.isEmpty() || mxsaisonsBox!.count() == 0) {
      await getMxSaisonData();
    }
    if (mxcampagnesBox!.isEmpty() || mxcampagnesBox!.count() == 0) {
      await getMxCampagneData();
    }
    if (mxfamilleChargeExploitationsBox!.isEmpty() ||
        mxfamilleChargeExploitationsBox!.count() == 0) {
      await getMxFamilleChargeExploitationData();
    }

    if (mxfamilleEmplacementsBox!.isEmpty() ||
        mxfamilleEmplacementsBox!.count() == 0) {
      await getMxFamilleEmplacementObjectData();
    }
    if (mxfilieresBox!.isEmpty() || mxfilieresBox!.count() == 0) {
      await getMxFiliereData();
    }
    if (mxproduitsBox!.isEmpty() || mxproduitsBox!.count() == 0) {
      await getMxProduitData();
    }
    if (mxvarietesBox!.isEmpty() || mxvarietesBox!.count() == 0) {
      await getMxVarieteData();
    }
    if (mxchargeExploitationsBox!.isEmpty() ||
        mxchargeExploitationsBox!.count() == 0) {
      await getMxChargeExploitationData();
    }
    if (mxpaysBox!.isEmpty() || mxpaysBox!.count() == 0) {
      await getMxPaysData();
    }
    if (mxzonesBox!.isEmpty() || mxzonesBox!.count() == 0) {
      await getMxZoneData();
    }
    if (mxsouszonesBox!.isEmpty() || mxsouszonesBox!.count() == 0) {
      await getMxSousZoneData();
    }
    if (mxlocalitesBox!.isEmpty() || mxlocalitesBox!.count() == 0) {
      await getMxLocaliteData();
    }
    if (mxvillagesBox!.isEmpty() || mxvillagesBox!.count() == 0) {
      await getMxVillageData();
    }
    if (mxpointsBox!.isEmpty() || mxpointsBox!.count() == 0) {
      await getMxPointData();
    }
    if (mxtypeopsBox!.isEmpty() || mxtypeopsBox!.count() == 0) {
      await getMxTypeOpData();
    }
    if (mxopsBox!.isEmpty() || mxopsBox!.count() == 0) {
      await getMxOpData();
    }
    if (mxproducteursBox!.isEmpty() || mxproducteursBox!.count() == 0) {
      await getMxProducteurData();
    }

    if (mxtypeemballagesBox!.isEmpty() || mxtypeemballagesBox!.count() == 0) {
      await getMxTypeEmballageData();
    }

    if (mxtypeunitegrandeursBox!.isEmpty() ||
        mxtypeunitegrandeursBox!.count() == 0) {
      await getMxTypeUniteGrandeurData();
    }

    if (mxunitegrandeursBox!.isEmpty() || mxunitegrandeursBox!.count() == 0) {
      await getMxUniteGrandeurData();
    }

    if (mxemballagesBox!.isEmpty() || mxemballagesBox!.count() == 0) {
      await getMxEmballageData();
    }
    if (Constants.mxUserObject.roleName == 'Op') {
      if (mxuserOpBox!.isEmpty() || mxuserOpBox!.count() == 0) {
        await getMxUserOpData();
      }
    }

    if (Constants.mxUserObject.roleName == 'Point') {
      if (mxuserPointBox!.isEmpty() || mxuserPointBox!.count() == 0) {
        await getMxUserPointData();
      }
    }
    if (Constants.mxUserObject.roleName == 'Op') {
      if (mxexploitationBox!.isEmpty() || mxexploitationBox!.count() == 0) {
        await getMxExploitationData();
      }
    }

    if (mxexploitationChargeExploitationObjectBox!.isEmpty() ||
        mxexploitationChargeExploitationObjectBox!.count() == 0) {
      await getMxExploitationChargeExploitationData();
    }

    if (mxtypemouvementstocksBox!.isEmpty() ||
        mxtypemouvementstocksBox!.count() == 0) {
      await getMxTypeMouvementStockData();
    }
    if (mxmodeentreesortiestocksBox!.isEmpty() ||
        mxmodeentreesortiestocksBox!.count() == 0) {
      await getMxModeEntreeSortieStockData();
    }

    if (mxunitetransformationsBox!.isEmpty() ||
        mxunitetransformationsBox!.count() == 0) {
      await getMxUniteTransformationData();
    }
    if (mxentrepotsBox!.isEmpty() || mxentrepotsBox!.count() == 0) {
      await getMxEntrepotData();
    }
    if (mxemplacementsBox!.isEmpty() || mxemplacementsBox!.count() == 0) {
      await getMxEmplacementData();
    }

    if (mxproduitchargeexploitationsBox!.isEmpty() ||
        mxproduitchargeexploitationsBox!.count() == 0) {
      await getMxProduitChargeExploitationData();
    }

    if (Constants.mxUserObject.roleName == 'Point Collecte') {
      if (mxmouvementstocksBox!.isEmpty() ||
          mxmouvementstocksBox!.count() == 0) {
        await getMxMouvementStockData();
      }
    }

    /*
    getUserData();
    getSaisonData();
    getAnneeData();
    getEmballageData();
    getVarieteData();
    getTypeChargeExploitationData();
    getFamilleExploitationData();
    getChargeExploitationData();
    getTypeOpData();
    getUserOpsData();

    getUserPointsData();

    getUserUniteTransformationsData();
    getTypeTransformationData();
    */
  }

  static getMxUserData() async {
    try {
      final mxuserBox = ObjectBox.mxuserBox;
      mxuserBox?.removeAll();
      print(' REMOVE USER');
      final mxuserPermissionBox = ObjectBox.mxuserPermissionBox;
      print('REMOVE PERMISSION');
      mxuserPermissionBox?.removeAll();
      //print('Avant write user: ${mxuserBox!.count()}');
      //print('Avant write permission: ${mxuserPermissionBox!.count()}');

      //Constants.mxUserObject.mxUserPermissionObjects.add(element);

      mxuserBox!.put(Constants.mxUserObject);

      //print('AFTER Constants.groups:  + ${Constants.groups!.length}');

      for (int i = 0; i < Constants.groups!.length; i++) {
        MxUserPermissionObject object = MxUserPermissionObject(
            id: Constants.groups!.toList()[i].id,
            name: Constants.groups!.toList()[i].name);
        object.mxuserObject.target = Constants.mxUserObject;
        int mxuserPermissionBoxId = mxuserPermissionBox!.put(object);
        //print('Permission object id : $mxuserPermissionBoxId');
      }

      MxUserObject objectAdmin = MxUserObject(
          id: 0,
          token: '',
          email: 'admin@gmx.fr',
          username: 'admin',
          password: '123456',
          firstname: 'ibrahima',
          lastname: 'CAMARA',
          phone: '775559708',
          address: '177 rue Bancal Sud Saint-Louis',
          roleId: 1,
          roleName: 'Admin');
      mxuserBox.put(objectAdmin);

      return true;
    } catch (e) {
      print('Info erreur userBox e: $e');
      return false;
    }
  }

  static getMxAnneeData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallannees);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxAnneeObject> data =
          jsonResponse.map((e) => MxAnneeObject.fromJson(e)).toList();
      //print('data Annee $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      // await writeMxAnnee(data);
      await mxanneesBox!.putMany(data);
      return true;
    } catch (e) {
      print('Info erreur annee e: $e');
      return false;
    }
  }

  static Future<bool> writeMxAnnee(List<MxAnneeObject> data) async {
    try {
      mxanneesBox?.removeAll();
      print('REMOVE ANNEES');
      //print('Avant write mxanneesBox: ${mxanneesBox!.count()}');
      //if (mxanneesBox!.count() == 0) {
      print('-------- ANNEES LODING -----');
      for (MxAnneeObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxAnneeObject object =
            MxAnneeObject(id: item.id, name: item.name, valeur: item.valeur);
        mxanneesBox!.put(object);
      }
      //} else {
      //print('----------- ANN LODED -----------');
      //}
      //print(
      //'Apres write mxanneesBox: ${mxanneesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxSaisonData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallsaisons);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxSaisonObject> data =
          jsonResponse.map((e) => MxSaisonObject.fromJson(e)).toList();
      //print('data Saison $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      //await writeMxSaison(data);
      await mxsaisonsBox!.putMany(data);
      return true;
    } catch (e) {
      print('Info erreur annee e: $e');
      return false;
    }
  }

  static Future<bool> writeMxSaison(List<MxSaisonObject> data) async {
    try {
      mxsaisonsBox?.removeAll();
      print('REMOVE SAISONS');
      //print('Avant write mxSaisonsBox: ${mxSaisonsBox!.count()}');
      //if (mxSaisonsBox!.count() == 0) {
      print('-------- SAISONS LODING -----');
      for (MxSaisonObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxSaisonObject object = MxSaisonObject(
            id: item.id, name: item.name, description: item.description);
        mxsaisonsBox!.put(object);
      }
      //} else {
      //print('----------- ANN LODED -----------');
      //}
      //print(
      //'Apres write mxSaisonsBox: ${mxSaisonsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxCampagneData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallcampagnes);
      print('url campagne: $url');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      print('json campagne: $jsonResponse');

      List<MxCampagneObject> data =
          jsonResponse.map((e) => MxCampagneObject.fromJson(e)).toList();

      print('data Campagne $data');

/*
      data.forEach((element) {
        print(element);
      });
*/
      await writeMxCampagne(data);
      //await mxcampagnesBox!.putMany(data);
      return true;
    } catch (e) {
      print('Info erreur campagne e: $e');
      return false;
    }
  }

  static Future<bool> writeMxCampagne(List<MxCampagneObject> data) async {
    try {
      mxcampagnesBox?.removeAll();
      print('REMOVE CAMPAGNES');
      //print('Avant write mxcampagnesBox: ${mxcampagnesBox!.count()}');
      //if (mxcampagnesBox!.count() == 0) {
      print('-------- CAMAPAGNES LODING -----');
      for (MxCampagneObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.annee['name'].toString()} ---- ${item.saison['name'].toString()}  ');

        MxCampagneObject object = MxCampagneObject(id: item.id);

        MxAnneeObject myAnnee = MxAnneeObject(
            id: item.annee['id'],
            name: item.annee['name'],
            valeur: item.annee['valeur']);
        object.mxanneeObject.target = myAnnee;

        MxSaisonObject mySaison = MxSaisonObject(
            id: item.saison['id'],
            name: item.saison['name'],
            description: item.saison['description']);
        object.mxsaisonObject.target = mySaison;

        mxcampagnesBox!.put(object);
      }

      //} else {
      //print('----------- ANN LODED -----------');
      //}
      //print(
      //'Apres write mxcampagnesBox: ${mxcampagnesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxTypeChargeExploitationData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxalltypechargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxTypeChargeExploitationObject> data = jsonResponse
          .map((e) => MxTypeChargeExploitationObject.fromJson(e))
          .toList();
      //print('data Type Charge Exploitation $data');
      /*
      data.forEach((element) {
        print(element.name);
      });
      */
      await writeMxBoxTypeChargeExploitationObject(data);
      return true;
    } catch (e) {
      print('Info erreur typeChargeExploitation e: $e');
      return false;
    }
  }

  static Future<bool> writeMxBoxTypeChargeExploitationObject(
      List<MxTypeChargeExploitationObject> data) async {
    try {
      mxtypeChargeExploitationsBox?.removeAll();
      print('REMOVE TYPE CHARGES EXPLOITATION');
      //print('Avant write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      //if (mxtypeChargeExploitationsBox!.count() == 0) {
      print('-------- TYPE CHARGES EXPLOITATION LODING -----');
      for (MxTypeChargeExploitationObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxTypeChargeExploitationObject object =
            MxTypeChargeExploitationObject(id: item.id, name: item.name);
        mxtypeChargeExploitationsBox!.put(object);
      }
      //} else {
      //print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      //print(
      //'Apres write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxFamilleChargeExploitationData() async {
    try {
      var url = Uri.parse(
          Constants.baseUrl + Constants.Mxallfamillechargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxFamilleChargeExploitationObject> data = jsonResponse
          .map((e) => MxFamilleChargeExploitationObject.fromJson(e))
          .toList();
      //print('data Famille Charge Exploitation $data');
      await writeMxBoxFalmilleChargeExploitationObject(data);
      return true;
    } catch (e) {
      print('Info erreur familleChargeExploitation e: $e');
      return false;
    }
  }

  static Future<bool> writeMxBoxFalmilleChargeExploitationObject(
      List<MxFamilleChargeExploitationObject> data) async {
    try {
      mxfamilleChargeExploitationsBox?.removeAll();
      print('REMOVE FAMILLE CHARGES EXPLOITATION');
      //print(
      //'Avant write mxfamilleChargeExploitationsBox: ${mxfamilleChargeExploitationsBox!.count()}');
      //if (mxfamilleChargeExploitationsBox!.count() == 0) {
      print('-------- FAMILLE CHARGES EXPLOITATION LODING -----');
      for (MxFamilleChargeExploitationObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxFamilleChargeExploitationObject object =
            MxFamilleChargeExploitationObject(id: item.id, name: item.name);
        mxfamilleChargeExploitationsBox!.put(object);
      }
      //} else {
      //print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      //print('Apres write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxChargeExploitationData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxallchargeexploitations);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      //print(jsonResponse);

      List<MxChargeExploitationObject> data = jsonResponse
          .map((e) => MxChargeExploitationObject.fromJson(e))
          .toList();

      //print('data Charge Exploitation $data');
      await writeMxBoxChargeExploitationObject(data);
      return true;
    } catch (e) {
      print('Info erreur chargeExploitation e: $e');
      return false;
    }
  }

  static Future<bool> writeMxBoxChargeExploitationObject(
      List<MxChargeExploitationObject> data) async {
    try {
      mxchargeExploitationsBox?.removeAll();
      print('REMOVE CHARGES EXPLOITATION');
      // print('Avant write mxchargeExploitationsBox: ${mxchargeExploitationsBox!.count()}');
      //if (chargeExploitationsBox!.count() == 0) {
      print('--------- CHARGES EXPLOITATION LODING----------------');
      for (MxChargeExploitationObject item in data) {
        // print('${item.id.toString()}  ------  ${item.name.toString()} ');
        // print(item.toJson());

        MxChargeExploitationObject object = MxChargeExploitationObject(
            //id: 0, //int.parse(item.id.toString()),
            id: item.id,
            name: item.name,
            unite: item.unite,
            pu: double.parse(item.pu.toString()),
            quantite_unite_superficie:
                double.parse(item.quantite_unite_superficie.toString()),
            isAchat: item.isAchat.toString() == 'true' ? true : false,
            isProduit: item.isProduit.toString() == 'true' ? true : false,
            isIntrant: item.isIntrant.toString() == 'true' ? true : false);

        MxTypeChargeExploitationObject myType = MxTypeChargeExploitationObject(
            id: item.typeChargeExploitation['id'],
            name: item.typeChargeExploitation['name']);
        print(myType.toJson());
        object.mxtypeChargeExploitationObject.target = myType;

        MxFamilleChargeExploitationObject myFamille =
            MxFamilleChargeExploitationObject(
                id: item.familleChargeExploitation['id'],
                name: item.familleChargeExploitation['name']);
        print(myFamille.toJson());
        object.mxfamilleChargeExploitationObject.target = myFamille;

        MxUniteGrandeurObject myUniteGrandeur = MxUniteGrandeurObject(
            id: item.uniteGrandeur['id'], name: item.uniteGrandeur['name']);

        object.mxunitegrandeurObject.target = myUniteGrandeur;

        mxchargeExploitationsBox!.put(object);
      }
      //} else {
      //print('--------------- CHARGES EXPLOITATION LODED--------------');
      //}
      // print('Apres write chargeExploitationsBox: ${chargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxFiliereData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallfilieres);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxFiliereObject> data =
          jsonResponse.map((e) => MxFiliereObject.fromJson(e)).toList();
      //print('data Filiere $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      await writeMxFiliere(data);
      return true;
    } catch (e) {
      print('Info erreur filiere e: $e');
      return false;
    }
  }

  static Future<bool> writeMxFiliere(List<MxFiliereObject> data) async {
    try {
      mxfilieresBox?.removeAll();
      print('REMOVE FILIERES');
      //print('Avant write mxfilieresBox: ${mxfilieresBox!.count()}');
      //if (mxfilieresBox!.count() == 0) {
      print('-------- FILIERES LODING -----');
      for (MxFiliereObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxFiliereObject object = MxFiliereObject(id: item.id, name: item.name);
        mxfilieresBox!.put(object);
      }
      //} else {
      //print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      //print(
      //'Apres write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxProduitData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallproduits);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxProduitObject> data =
          jsonResponse.map((e) => MxProduitObject.fromJson(e)).toList();
      //print('data Produit $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxProduit(data);
      return true;
    } catch (e) {
      print('Info erreur produit e: $e');
      return false;
    }
  }

  static Future<bool> writeMxProduit(List<MxProduitObject> data) async {
    try {
      mxproduitsBox?.removeAll();
      print('REMOVE PRODUITS');
      //print('Avant write mxproduitsBox: ${mxproduitsBox!.count()}');
      //if (mxproduitsBox!.count() == 0) {
      print('-------- PRODUITS LODING -----');
      for (MxProduitObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxProduitObject object = MxProduitObject(
          id: item.id,
          name: item.name,
          isDerive: item.isDerive.toString() == 'true' ? true : false,
          isEnsachage: item.isEnsachage.toString() == 'true' ? true : false,
          isActive: item.isActive.toString() == 'true' ? true : false,
        );

        MxFiliereObject myFiliere =
            MxFiliereObject(id: item.filiere['id'], name: item.filiere['name']);
        object.mxFiliereObject.target = myFiliere;

        MxFamilleEmplacementObject myFamilleEmplacement =
            MxFamilleEmplacementObject(
                id: item.familleEmplacement['id'],
                name: item.familleEmplacement['name']);
        object.mxFamilleEmplacementObject.target = myFamilleEmplacement;

        mxproduitsBox!.put(object);
      }
      //} else {
      //print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      //print(
      //'Apres write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxPaysData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallpays);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxPaysObject> data =
          jsonResponse.map((e) => MxPaysObject.fromJson(e)).toList();
      //print('data Annee $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      await writeMxPays(data);
      return true;
    } catch (e) {
      print('Info erreur pays e: $e');
      return false;
    }
  }

  static Future<bool> writeMxPays(List<MxPaysObject> data) async {
    try {
      mxpaysBox?.removeAll();
      print('REMOVE PAYS');
      //print('Avant write mxpaysBox: ${mxpaysBox!.count()}');
      //if (mxpaysBox!.count() == 0) {
      print('-------- PAYS LODING -----');
      for (MxPaysObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxPaysObject object =
            MxPaysObject(id: item.id, name: item.name, sigle: item.sigle);
        mxpaysBox!.put(object);
      }
      //} else {
      //print('----------- PAYS LODED -----------');
      //}
      //print(
      //'Apres write mxpaysBox: ${mxpaysBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxZoneData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallzones);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxZoneObject> data =
          jsonResponse.map((e) => MxZoneObject.fromJson(e)).toList();
      //print('data Zone $data');

/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxZone(data);
      return true;
    } catch (e) {
      //print('Info erreur zones e: $e');
      return false;
    }
  }

  static Future<bool> writeMxZone(List<MxZoneObject> data) async {
    try {
      mxzonesBox?.removeAll();
      print('REMOVE ZONE');
      //print('Avant write mxzonesBox: ${mxzonesBox!.count()}');
      //if (mxzonesBox!.count() == 0) {
      print('-------- ZONE LODING -----');
      for (MxZoneObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()} --  ${item.pays['name'].toString()} --  ${item.pays['sigle'].toString()} ');
        MxZoneObject object = MxZoneObject(id: item.id, name: item.name);

        MxPaysObject myPays = MxPaysObject(
            id: item.pays['id'],
            name: item.pays['name'],
            sigle: item.pays['sigle']);
        object.mxPaysObject.target = myPays;

        mxzonesBox!.put(object);
      }

      //} else {
      //print('----------- ZONE LODED -----------');
      //}
      //print(
      //'Apres write mxzonesBox: ${mxzonesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxSousZoneData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallsouszones);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxSousZoneObject> data =
          jsonResponse.map((e) => MxSousZoneObject.fromJson(e)).toList();
      // print('data SousZone $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxSousZone(data);
      return true;
    } catch (e) {
      //print('Info erreur SousZones e: $e');
      return false;
    }
  }

  static Future<bool> writeMxSousZone(List<MxSousZoneObject> data) async {
    try {
      mxsouszonesBox?.removeAll();
      print('REMOVE SOUS ZONE');
      //print('Avant write mxzonesBox: ${mxzonesBox!.count()}');
      //if (mxzonesBox!.count() == 0) {
      print('-------- SOUS ZONE LODING -----');
      for (MxSousZoneObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()} --  ${item.zone['name'].toString()} ');
        MxSousZoneObject object =
            MxSousZoneObject(id: item.id, name: item.name);

        MxZoneObject myZone =
            MxZoneObject(id: item.zone['id'], name: item.zone['name']);
        object.mxZoneObject.target = myZone;

        mxsouszonesBox!.put(object);
      }
      //} else {
      //print('----------- ZONE LODED -----------');
      //}
      //print(
      //'Apres write mxzonesBox: ${mxzonesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxLocaliteData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxalllocalites);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxLocaliteObject> data =
          jsonResponse.map((e) => MxLocaliteObject.fromJson(e)).toList();
      //print('data Localite $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxLocalite(data);
      return true;
    } catch (e) {
      //print('Info erreur Localites e: $e');
      return false;
    }
  }

  static Future<bool> writeMxLocalite(List<MxLocaliteObject> data) async {
    try {
      mxlocalitesBox?.removeAll();
      print('REMOVE LOCALITE');
      //print('Avant write mxlocalitesBox: ${mxlocalitesBox!.count()}');
      //if (mxlocalitesBox!.count() == 0) {
      print('-------- LOCALITE LODING -----');
      for (MxLocaliteObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()} --  ${item.sousZone['name'].toString()} ');
        MxLocaliteObject object =
            MxLocaliteObject(id: item.id, name: item.name);

        MxSousZoneObject myZone = MxSousZoneObject(
            id: item.sousZone['id'], name: item.sousZone['name']);
        object.mxSousZoneObject.target = myZone;

        mxlocalitesBox!.put(object);
      }
      //} else {
      //print('----------- LOCALITELODED -----------');
      //}
      //print(
      //'Apres write mxlocalitesBox: ${mxlocalitesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxVillageData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallvillages);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxVillageObject> data =
          jsonResponse.map((e) => MxVillageObject.fromJson(e)).toList();
      //print('data Village $data');

      data.forEach((element) {
        print(element.toJson());
      });

      await writeMxVillage(data);
      return true;
    } catch (e) {
      //print('Info erreur Villages e: $e');
      return false;
    }
  }

  static Future<bool> writeMxVillage(List<MxVillageObject> data) async {
    try {
      mxvillagesBox?.removeAll();
      print('REMOVE Village');
      //print('Avant write mxvillagesBox: ${mxvillagesBox!.count()}');
      //if (mxVillagesBox!.count() == 0) {
      print('-------- Village LODING -----');
      for (MxVillageObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()} --  ${item.localite['name'].toString()} ');
        MxVillageObject object = MxVillageObject(id: item.id, name: item.name);

        MxLocaliteObject myLocalite = MxLocaliteObject(
            id: item.localite['id'], name: item.localite['name']);
        object.mxLocaliteObject.target = myLocalite;

        mxvillagesBox!.put(object);
      }
      //} else {
      //print('----------- VillageLODED -----------');
      //}
      //print(
      //'Apres write mxvillagesBox: ${mxVillagesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxPointData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallpoints);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      print(jsonResponse);
      List<MxPointObject> data =
          jsonResponse.map((e) => MxPointObject.fromJson(e)).toList();
      //print('data Point $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxPoint(data);
      return true;
    } catch (e) {
      //print('Info erreur Points e: $e');
      return false;
    }
  }

  static Future<bool> writeMxPoint(List<MxPointObject> data) async {
    try {
      mxpointsBox?.removeAll();
      print('REMOVE POINT COLLECTE');
      //print('Avant write mxpointsBox: ${mxpointsBox!.count()}');
      //if (mxpointsBox!.count() == 0) {
      print('-------- POINT COLLECTE LODING -----');
      for (MxPointObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()} --  ${item.localite['name'].toString()} ');
        MxPointObject object = MxPointObject(
          id: item.id,
          name: item.name,
          isProduit: item.isProduit.toString() == 'true' ? true : false,
          isIntrant: item.isIntrant.toString() == 'true' ? true : false,
          isVirtuel: item.isVirtuel.toString() == 'true' ? true : false,
        );

        MxLocaliteObject myLocalite = MxLocaliteObject(
            id: item.localite['id'], name: item.localite['name']);
        object.mxLocaliteObject.target = myLocalite;

        mxpointsBox!.put(object);
      }
      //} else {
      //print('----------- POINT COLLECTE LODED -----------');
      //}
      //print(
      //'Apres write mxpointsBox: ${mxpointsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxVarieteData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallvarietes);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxVarieteObject> data =
          jsonResponse.map((e) => MxVarieteObject.fromJson(e)).toList();
      //print('data Variete $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxVariete(data);
      return true;
    } catch (e) {
      print('Info erreur variete e: $e');
      return false;
    }
  }

  static Future<bool> writeMxVariete(List<MxVarieteObject> data) async {
    try {
      mxvarietesBox?.removeAll();
      print('REMOVE VARIETES');
      //print('Avant write mxvarietesBox: ${mxvarietesBox!.count()}');
      //if (mxvarietesBox!.count() == 0) {
      print('-------- VARIETES LODING -----');
      for (MxVarieteObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxVarieteObject object = MxVarieteObject(
          id: item.id,
          name: item.name,
          surface_unite: item.surface_unite,
          quantite_unite: item.quantite_unite,
          pu_unite: double.parse(item.pu_unite.toString()),
          rendement_unite: double.parse(item.rendement_unite.toString()),
          isActive: item.isActive.toString() == 'true' ? true : false,
        );

        MxProduitObject myProduit = MxProduitObject(
            id: item.produit['id'],
            name: item.produit['name'],
            isDerive:
                item.produit['isDerive'].toString() == 'true' ? true : false,
            isEnsachage:
                item.produit['isEnsachage'].toString() == 'true' ? true : false,
            isActive:
                item.produit['isActive'].toString() == 'true' ? true : false);
        object.mxProduitObject.target = myProduit;
        print(object.toJson());
        mxvarietesBox!.put(object);
      }
      //} else {
      //print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      //print(
      //'Apres write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxFamilleEmplacementObjectData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxallfamilleemplacements);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxFamilleEmplacementObject> data = jsonResponse
          .map((e) => MxFamilleEmplacementObject.fromJson(e))
          .toList();
      //print('data FamilleEmplacement $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      await writeMxFamilleEmplacementObject(data);
      return true;
    } catch (e) {
      print('Info erreur Famille Emplacement e: $e');
      return false;
    }
  }

  static Future<bool> writeMxFamilleEmplacementObject(
      List<MxFamilleEmplacementObject> data) async {
    try {
      mxfamilleEmplacementsBox?.removeAll();
      print('REMOVE FAMILLE EMPLACEMENT');
      //print('Avant write mxfamilleEmplacementBox: ${mxfamilleEmplacementBox!.count()}');
      //if (mxfamilleEmplacementBox!.count() == 0) {
      print('-------- FAMILLE EMPLACEMENT LODING -----');
      for (MxFamilleEmplacementObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxFamilleEmplacementObject object =
            MxFamilleEmplacementObject(id: item.id, name: item.name);
        mxfamilleEmplacementsBox!.put(object);
      }
      //} else {
      //print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      //print(
      //'Apres write mxtypeChargeExploitationsBox: ${mxtypeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxTypeOpData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxalltypeops);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxTypeOpObject> data =
          jsonResponse.map((e) => MxTypeOpObject.fromJson(e)).toList();
      //print('data Annee $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      await writeMxTypeOp(data);
      return true;
    } catch (e) {
      print('Info erreur TypeOp e: $e');
      return false;
    }
  }

  static Future<bool> writeMxTypeOp(List<MxTypeOpObject> data) async {
    try {
      mxtypeopsBox?.removeAll();
      print('REMOVE TYPE OP');
      //print('Avant write mxtypeopsBox: ${mxtypeopsBox!.count()}');
      //if (mxtypeopsBox!.count() == 0) {
      print('-------- TYPE OP LODING -----');
      for (MxTypeOpObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxTypeOpObject object = MxTypeOpObject(id: item.id, name: item.name);
        mxtypeopsBox!.put(object);
      }
      //} else {
      //print('----------- TYPE OP LODED -----------');
      //}
      //print(
      //'Apres write mxtypeopsBox: ${mxtypeopsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxOpData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallops);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxOpObject> data =
          jsonResponse.map((e) => MxOpObject.fromJson(e)).toList();
      //print('data op $data');
      /*
      data.forEach((element) {
        print(element.toJson());
      });
      */

      await writeMxOp(data);
      return true;
    } catch (e) {
      //print('Info erreur Ops e: $e');
      return false;
    }
  }

  static Future<bool> writeMxOp(List<MxOpObject> data) async {
    try {
      mxopsBox?.removeAll();
      print('REMOVE OP');
      //print('Avant write mxopsBox: ${mxopsBox!.count()}');
      //if (mxopsBox!.count() == 0) {
      print('-------- OP LODING -----');
      for (MxOpObject item in data) {
        print(
            '${item.id.toString()}  --  ${item.name.toString()} --  ${item.typeOp['name'].toString()}  ');
        MxOpObject object = MxOpObject(
          id: item.id,
          name: item.name,
          sigle: item.sigle,
          email: item.email,
          telephone: item.telephone,
          adresse: item.adresse,
          prenom_contact: item.prenom_contact,
          nom_contact: item.nom_contact,
          email_contact: item.email_contact,
          telephone_contact: item.telephone_contact,
        );

        MxTypeOpObject myTypeOp =
            MxTypeOpObject(id: item.typeOp['id'], name: item.typeOp['name']);
        object.mxTypeOpObject.target = myTypeOp;

        if (item.localite.isNotEmpty) {
          MxLocaliteObject myLocalite = MxLocaliteObject(
              id: item.localite['id'], name: item.localite['name']);
          object.mxLocaliteObject.target = myLocalite;
        }

        if (item.point.isNotEmpty) {
          MxPointObject myPoint = MxPointObject(
              id: item.point['id'],
              name: item.point['name'],
              isProduit:
                  item.point['isProduit'].toString() == 'true' ? true : false,
              isIntrant:
                  item.point['isIntrant'].toString() == 'true' ? true : false,
              isVirtuel:
                  item.point['isVirtuel'].toString() == 'true' ? true : false);

          object.mxPointObject.target = myPoint;
        }

        if (item.village.isNotEmpty) {
          MxVillageObject myVillage = MxVillageObject(
              id: item.village['id'], name: item.village['name']);
          object.mxVillageObject.target = myVillage;
        }

        mxopsBox!.put(object);
      }
      //} else {
      //print('----------- OP LODED -----------');
      //}
      //print(
      //'Apres write mxopsBox: ${mxopsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxProducteurData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallproducteurs);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });
      // print(res.body);

      List jsonResponse = json.decode(res.body);

      List<MxProducteurObject> data =
          jsonResponse.map((e) => MxProducteurObject.fromJson(e)).toList();

/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxProducteur(data);
      return true;
    } catch (e) {
      print('Info erreur Producteurs e: $e');
      return false;
    }
  }

  static Future<bool> writeMxProducteur(List<MxProducteurObject> data) async {
    try {
      mxproducteursBox?.removeAll();
      print('REMOVE PRODUCTEUR');
      //print('Avant write mxproducteursBox: ${mxproducteursBox!.count()}');
      //if (mxproducteursBox!.count() == 0) {
      print('-------- PRODUCTEUR LODING -----');
      for (MxProducteurObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.prenom.toString()} ------  ${item.nom.toString()}--  ${item.op['name'].toString()} ');

        MxProducteurObject object = MxProducteurObject(
          id: item.id,
          compte: item.compte,
          prenom: item.prenom,
          nom: item.nom,
          cni: item.cni,
          email: item.email,
          telephone: item.telephone,
          adresse: item.adresse,
          isActive: item.isActive.toString() == 'true' ? true : false,
        );

        MxOpObject myOp = MxOpObject(
          id: item.op['id'],
          name: item.op['name'],
          sigle: item.op['sigle'],
          email: item.op['email'],
          telephone: item.op['telephone'],
          adresse: item.op['adresse'],
          prenom_contact: item.op['prenom_contact'],
          nom_contact: item.op['nom_contact'],
          email_contact: item.op['email_contact'],
          telephone_contact: item.op['telephone_contact'],
        );
        object.mxOpObject.target = myOp;

        mxproducteursBox!.put(object);
      }
      //} else {
      //print('----------- OP LODED -----------');
      //}
      print('Apres write mxproducteursBox: ${mxproducteursBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxTypeEmballageData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxalltypeemballages);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxTypeEmballageObject> data =
          jsonResponse.map((e) => MxTypeEmballageObject.fromJson(e)).toList();
      //print('data Type Emballage $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxTypeEmballage(data);
      return true;
    } catch (e) {
      //print('Info erreur type emballages e: $e');
      return false;
    }
  }

  static Future<bool> writeMxTypeEmballage(
      List<MxTypeEmballageObject> data) async {
    try {
      mxtypeemballagesBox?.removeAll();
      print('REMOVE TYPE EMBALLAGE');
      //print('Avant write mxtypeemballagesBox: ${mxtypeemballagesBox!.count()}');
      //if (mxtypeemballagesBox!.count() == 0) {
      print('-------- TYPE EMBALLAGE LODING -----');
      for (MxTypeEmballageObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxTypeEmballageObject object =
            MxTypeEmballageObject(id: item.id, name: item.name);
        mxtypeemballagesBox!.put(object);
      }
      //} else {
      //print('----------- TYPE EMBALLAGE LODED -----------');
      //}
      //print(
      //'Apres write mxtypeemballagesBox: ${mxtypeemballagesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxTypeUniteGrandeurData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxalltypeunitegrandeurs);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxTypeUniteGrandeurObject> data = jsonResponse
          .map((e) => MxTypeUniteGrandeurObject.fromJson(e))
          .toList();
      //print('data Type Emballage $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxTypeUniteGrandeur(data);
      return true;
    } catch (e) {
      //print('Info erreur type emballages e: $e');
      return false;
    }
  }

  static Future<bool> writeMxTypeUniteGrandeur(
      List<MxTypeUniteGrandeurObject> data) async {
    try {
      mxtypeunitegrandeursBox?.removeAll();
      print('REMOVE TYPE UNITE GRANDEUR');
      //print('Avant write mxtypeemballagesBox: ${mxtypeemballagesBox!.count()}');
      //if (mxtypeemballagesBox!.count() == 0) {
      print('-------- TYPE UNITE GRANDEUR LODING -----');
      for (MxTypeUniteGrandeurObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxTypeUniteGrandeurObject object =
            MxTypeUniteGrandeurObject(id: item.id, name: item.name);
        mxtypeunitegrandeursBox!.put(object);
      }
      //} else {
      //print('----------- TYPE EMBALLAGE LODED -----------');
      //}
      //print(
      //'Apres write mxtypeemballagesBox: ${mxtypeemballagesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxUniteGrandeurData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallunitegrandeurs);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxUniteGrandeurObject> data =
          jsonResponse.map((e) => MxUniteGrandeurObject.fromJson(e)).toList();
      //print('data Unite Grandeur $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxUniteGrandeur(data);
      return true;
    } catch (e) {
      //print('Info erreur unite grandeur e: $e');
      return false;
    }
  }

  static Future<bool> writeMxUniteGrandeur(
      List<MxUniteGrandeurObject> data) async {
    try {
      mxunitegrandeursBox?.removeAll();
      print('REMOVE UNITE GRANDEUR');
      //print('Avant write mxtypeemballagesBox: ${mxtypeemballagesBox!.count()}');
      //if (mxtypeemballagesBox!.count() == 0) {
      print('--------  UNITE GRANDEUR LODING -----');
      for (MxUniteGrandeurObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxUniteGrandeurObject object =
            MxUniteGrandeurObject(id: item.id, name: item.name);

        MxTypeUniteGrandeurObject myTypeUniteGrandeur =
            MxTypeUniteGrandeurObject(
                id: item.typeUniteGrandeur['id'],
                name: item.typeUniteGrandeur['name']);
        object.mxTypeUniteGrandeurObject.target = myTypeUniteGrandeur;

        mxunitegrandeursBox!.put(object);
      }
      //} else {
      //print('----------- TYPE EMBALLAGE LODED -----------');
      //}
      //print(
      //'Apres write mxtypeemballagesBox: ${mxtypeemballagesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxEmballageData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallemballages);
      //print(url);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      //print(res.body);
      List jsonResponse = json.decode(res.body);
      //print(jsonResponse);
      List<MxEmballageObject> data =
          jsonResponse.map((e) => MxEmballageObject.fromJson(e)).toList();
      //print(data);
      //print('data Unite Grandeur $data');
/*
      data.forEach((element) {
        print(element);
      });
*/

      await writeMxEmballage(data);
      return true;
    } catch (e) {
      //print('Info erreur emballage e: $e');
      return false;
    }
  }

  static Future<bool> writeMxEmballage(List<MxEmballageObject> data) async {
    try {
      mxemballagesBox?.removeAll();
      print('REMOVE EMBALLAGE');
      //print('Avant write mxemballagesBox: ${mxemballagesBox!.count()}');
      //if (mxemballagesBox!.count() == 0) {
      print('--------  EMBALLAGE LODING -----');
      for (MxEmballageObject item in data) {
        print(item.toJson());

        //print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxEmballageObject object = MxEmballageObject(
          id: item.id,
          name: item.name,
          conditionnement: item.conditionnement,
          quantite: item.quantite,
          pu: item.pu,
          valeur: item.valeur,
          isActive: item.isActive.toString() == 'true' ? true : false,
          isDefault: item.isDefault.toString() == 'true' ? true : false,
        );

        MxProduitObject myProduit = MxProduitObject(
            id: item.produit['id'],
            name: item.produit['name'],
            isDerive:
                item.produit['isDerive'].toString() == 'true' ? true : false,
            isEnsachage:
                item.produit['isEnsachage'].toString() == 'true' ? true : false,
            isActive:
                item.produit['isActive'].toString() == 'true' ? true : false);
        object.mxProduitObject.target = myProduit;

        MxTypeEmballageObject myTypeEmballage = MxTypeEmballageObject(
            id: item.typeEmballage['id'], name: item.typeEmballage['name']);
        object.mxTypeEmballageObject.target = myTypeEmballage;

        MxUniteGrandeurObject myUniteGrandeur = MxUniteGrandeurObject(
            id: item.uniteGrandeur['id'], name: item.uniteGrandeur['name']);
        object.mxUniteGrandeurObject.target = myUniteGrandeur;

        mxemballagesBox!.put(object);
      }
      //} else {
      //print('----------- TYPE EMBALLAGE LODED -----------');
      //}
      //print(
      //'Apres write mxemballagesBox: ${mxemballagesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxUserOpData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxalluserops);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

/*
      List jsonResponse = json.decode(res.body);
      List<MxUserOpObject> data =
          jsonResponse.map((e) => MxUserOpObject.fromJson(e)).toList();
*/
/*
      List jsonResponse = json.decode(res.body);
      List<MxUserOpObject> data =
          jsonResponse.map((e) => MxUserOpObject.fromJson(e)).toList();
*/
      List jsonResponse = json.decode(res.body);
      List<MxUserOpObject> data = jsonResponse
          .map((e) => MxUserOpObject.fromJson(e))
          .toList()
          .where((element) => element.userId == Constants.mxUserObject.id)
          .toList();

      data.forEach((element) {
        print(element.toJson());
      });

      await writeMxUserOp(data);
      return true;
    } catch (e) {
      print('Info erreur user op e: $e');
      return false;
    }
  }

  static Future<bool> writeMxUserOp(List<MxUserOpObject> data) async {
    try {
      mxuserOpBox?.removeAll();
      print('REMOVE USER OP');
      //print('Avant write mxuserOpBox: ${mxuserOpBox!.count()}');
      //if (mxuserOpBox!.count() == 0) {
      print('--------  USER OP LODING -----');
      for (MxUserOpObject item in data) {
        print(item.toJson());

        //print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxUserOpObject object =
            MxUserOpObject(id: item.id, userId: item.userId);

        MxOpObject myOp = MxOpObject(
          id: item.op!['id'],
          name: item.op!['name'],
          sigle: item.op!['sigle'],
          email: item.op!['email'],
          telephone: item.op!['telephone'],
          adresse: item.op!['adresse'],
          prenom_contact: item.op!['prenom_contact'],
          nom_contact: item.op!['nom_contact'],
          email_contact: item.op!['email_contact'],
          telephone_contact: item.op!['telephone_contact'],
        );
        object.mxOpObject.target = myOp;

        mxuserOpBox!.put(object);
      }
      //} else {
      //print('----------- TYPE USER OP LODED -----------');
      //}
      //print(
      //'Apres write mxuserOpBox: ${mxuserOpBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxUserPointData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxalluserpoints);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxUserPointObject> data = jsonResponse
          .map((e) => MxUserPointObject.fromJson(e))
          .toList()
          /*
          .where((userpointbox) =>
              userpointbox.mxUserObject.target!.id ==
              Constants.mxUserObject.id)
          .toList();
      */
          .where((element) => element.userId == Constants.mxUserObject.id)
          .toList();

      data.forEach((element) {
        print(element.toJson());
      });

      await writeMxUserPoint(data);
      return true;
    } catch (e) {
      print('Info erreur user point e: $e');
      return false;
    }
  }

  static Future<bool> writeMxUserPoint(List<MxUserPointObject> data) async {
    try {
      mxuserOpBox?.removeAll();
      print('REMOVE USER POINT');

      print('--------  USER POINT LODING -----');
      for (MxUserPointObject item in data) {
        MxUserPointObject object =
            MxUserPointObject(id: item.id, userId: item.userId);

        MxPointObject myPoint = MxPointObject(
            id: item.point!['id'],
            name: item.point!['name'],
            isProduit: item.point!['isProduit'],
            isIntrant: item.point!['isIntrant'],
            isVirtuel: item.point!['isVirtuel']);
        object.mxPointObject.target = myPoint;

        mxuserPointBox!.put(object);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxProduitChargeExploitationData() async {
    try {
      var url = Uri.parse(
          Constants.baseUrl + Constants.Mxallproduitchargeexploitations);

      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      //print('data jsonResponse $jsonResponse');

      List<MxProduitChargeExploitationObject> data = jsonResponse
          .map((e) => MxProduitChargeExploitationObject.fromJson(e))
          .toList();

      data.forEach((element) {
        print(element.toJson());
      });

      await writeBoxProduitChargeExploitation(data);
      return true;
    } catch (e) {
      print('Info erreur Produit Charge Exploitation e: $e');
      return false;
    }
  }

  static Future<bool> writeBoxProduitChargeExploitation(
      List<MxProduitChargeExploitationObject> data) async {
    try {
      mxproduitchargeexploitationsBox?.removeAll();
      print('REMOVE PRODUIT CHARGE EXPLOITATION');
      for (MxProduitChargeExploitationObject item in data) {
        MxProduitChargeExploitationObject object =
            MxProduitChargeExploitationObject(id: item.id);

        if (item.produit.isNotEmpty) {
          MxProduitObject myProduit = MxProduitObject(
            id: item.produit['id'],
            name: item.produit['name'],
            isActive:
                item.produit['isActive'].toString() == 'true' ? true : false,
            isEnsachage:
                item.produit['isEnsachage'].toString() == 'true' ? true : false,
            isDerive:
                item.produit['isDerive'].toString() == 'true' ? true : false,
          );
          print('myProduit: ${myProduit.toJson()}');
          object.mxProduitObject.target = myProduit;
          if (item.chargeExploitation.isNotEmpty) {
            MxChargeExploitationObject myChargeExploitation =
                MxChargeExploitationObject(
              id: item.chargeExploitation['id'],
              name: item.chargeExploitation['name'],
              unite: item.chargeExploitation['unite'],
              pu: double.parse(item.chargeExploitation['pu'].toString()),
              quantite_unite_superficie: double.parse(item
                  .chargeExploitation['quantite_unite_superficie']
                  .toString()),
              isAchat: item.chargeExploitation['isAchat'].toString() == 'true'
                  ? true
                  : false,
              isIntrant:
                  item.chargeExploitation['isIntrant'].toString() == 'true'
                      ? true
                      : false,
              isProduit:
                  item.chargeExploitation['isProduit'].toString() == 'true'
                      ? true
                      : false,
            );
            object.mxChargeExploitationObject.target = myChargeExploitation;
          }

          mxproduitchargeexploitationsBox!.put(object);
        }
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxExploitationData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallexploitations);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });
      //print(res.body.toString());
      List jsonResponse = json.decode(res.body);
      //print('data jsonResponse $jsonResponse');
      List<MxExploitationObject> data =
          jsonResponse.map((e) => MxExploitationObject.fromJson(e)).toList();
      //print('data exploitation $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxExploitation(data);
      //await mxexploitationBox!.putMany(data);
      return true;
    } catch (e) {
      print('Info erreur exploitation e: $e');
      return false;
    }
  }

  static Future<bool> writeMxExploitation(
      List<MxExploitationObject> data) async {
    try {
      mxexploitationBox?.removeAll();
      print('REMOVE EXPLOITATION');
      //print('Avant write mxuserOpBox: ${mxuserOpBox!.count()}');
      //if (mxuserOpBox!.count() == 0) {
      print('--------   EXPLOITATION LODING -----');
      for (MxExploitationObject item in data) {
        print(item.toJson());

        //print('${item.id.toString()}  ------  ${item.name.toString()} ');

        MxExploitationObject object = MxExploitationObject(
          id: item.id,
          compte: item.compte,
          date: DateTime.parse(item.date.toString()),
          unite: item.unite,
          //pu: double.parse(item.pu.toString()),
          surface: double.parse(item.surface.toString()),
          //production: double.parse(item.production.toString()),
          createdAt: DateTime.parse(item.createdAt.toString()),
          updatedAt: DateTime.parse(item.updatedAt.toString()),
        );
        if (item.agence.isNotEmpty) {
          MxAgenceObject myAgence = MxAgenceObject(
              id: item.agence['id'],
              name: item.agence['name'],
              sigle: item.agence['sigle']);
          object.mxagenceObject.target = myAgence;
        }

        if (item.variete.isNotEmpty) {
          //print('add sous variete ' + item.variete['id'].toString());

          MxVarieteObject myVariete = MxVarieteObject(
            id: item.variete['id'],
            name: item.variete['name'],
            surface_unite: item.variete['surface_unite'],
            quantite_unite: item.variete['quantite_unite'],
            pu_unite: item.variete['pu_unite'],
            rendement_unite:
                double.parse(item.variete['rendement_unite'].toString()),
            isActive:
                item.variete['isActive'].toString() == 'true' ? true : false,
          );
          //print(myVariete.toJson());
          object.mxvarieteObject.target = myVariete;
        }

        if (item.annee.isNotEmpty) {
          //print('add sous annee ' + item.annee['id'].toString());

          MxAnneeObject myAnnee = MxAnneeObject(
              id: item.annee['id'],
              name: item.annee['name'],
              valeur: item.annee['valeur']);
          //print(myAnnee.toJson());
          object.mxanneeObject.target = myAnnee;
        }

        if (item.saison.isNotEmpty) {
          //print('add sous saison ' + item.saison['id'].toString());

          MxSaisonObject mySaison = MxSaisonObject(
            id: item.saison['id'],
            name: item.saison['name'],
            description: item.saison['description'],
          );
          //print(mySaison.toJson());
          object.mxsaisonObject.target = mySaison;
        }

        if (item.producteur.isNotEmpty) {
          //print('add sous producteur ' + item.producteur['id'].toString());

          MxProducteurObject myProducteur = MxProducteurObject(
            id: item.producteur['id'],
            compte: item.producteur['compte'],
            prenom: item.producteur['prenom'],
            nom: item.producteur['nom'],
            cni: item.producteur['cni'],
            email: item.producteur['email'],
            telephone: item.producteur['telephone'],
            adresse: item.producteur['adresse'],
            isActive:
                item.producteur['isActive'].toString() == 'true' ? true : false,
          );
          //print(myProducteur.toJson());
          object.mxproducteurObject.target = myProducteur;
        }

        if (item.op.isNotEmpty) {
          //print('add sous op ' + item.op['id'].toString());

          MxOpObject myOp = MxOpObject(
            id: item.op['id'],
            name: item.op['name'],
            sigle: item.op['sigle'],
            email: item.op['email'],
            telephone: item.op['telephone'],
            adresse: item.op['adresse'],
            prenom_contact: item.op['prenom_contact'],
            nom_contact: item.op['nom_contact'],
            email_contact: item.op['email_contact'],
            telephone_contact: item.op['telephone_contact'],
          );
          //print(myOp.toJson());
          object.mxopObject.target = myOp;
        }

        int idExploitation = await mxexploitationBox!.put(object);

        getMxCreditsData(idExploitation);
        getMxRecoltesData(idExploitation);
        getMxRemboursementsData(idExploitation);

        print('add ' + object.toJson().toString());
      }
      //} else {
      //print('----------- TYPE USER OP LODED -----------');
      //}
      //print(
      //'Apres write mxuserOpBox: ${mxuserOpBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxRecoltesData(int idExploitation) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.MxmanyrecoltesByExploitationId +
          idExploitation.toString());
      print(url);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      // print('data jsonResponse $jsonResponse');
      List<MxRecolteObject> data =
          jsonResponse.map((e) => MxRecolteObject.fromJson(e)).toList();
      // print('data data $data');

      /*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxRecolte(data);

      return true;
    } catch (e) {
      print('Info erreur recolte e: $e');
      return false;
    }
  }

  static Future<bool> writeMxRecolte(List<MxRecolteObject> data) async {
    try {
      for (MxRecolteObject item in data) {
        print(
            ' --------------- REMOVE RECOLTE EXPLOITATION ${item.exploitation['id']}');
        //print( ' --------------- REMOVE RECOLTE EXPLOITATION ${item.mxExploitationObject.target!.id}');

        Query<MxRecolteObject> recolteQuery = mxrecoltesBox!
            .query(MxRecolteObject_.mxExploitationObject
                .equals(item.exploitation['id']))
            .build();
        List<MxRecolteObject> mesRecoltesToDelete = recolteQuery.find();

        mxrecoltesBox!.removeMany(
            mesRecoltesToDelete.map((recolte) => recolte.id).toList());
      }

      print('--------   RECOLTES LODING -----');

      for (MxRecolteObject item in data) {
        MxRecolteObject object = MxRecolteObject(
          id: item.id,
          date: DateTime.parse(item.date.toString()),
          pu: double.parse(item.pu.toString()),
          nombre_unite: double.parse(item.nombre_unite.toString()),
          nombre_emballage: double.parse(item.nombre_emballage.toString()),
          valeur: double.parse(item.valeur.toString()),
        );

        if (item.exploitation.isNotEmpty) {
          MxExploitationObject myExploitation = MxExploitationObject(
            id: item.exploitation['id'],
            compte: item.exploitation['compte'],
            date: DateTime.parse(item.exploitation['date'].toString()),
            unite: item.exploitation['unite'],
            //pu: double.parse(item.exploitation['pu'].toString()),
            surface: double.parse(item.exploitation['surface'].toString()),
            //production:double.parse(item.exploitation['production'].toString()),
            createdAt:
                DateTime.parse(item.exploitation['createdAt'].toString()),
            updatedAt:
                DateTime.parse(item.exploitation['updatedAt'].toString()),
          );
          print('myExploitation: ${myExploitation.toJson()}');
          object.mxExploitationObject.target = myExploitation;
        }

        if (item.emballage.isNotEmpty) {
          MxEmballageObject myEmballage = MxEmballageObject(
            id: item.emballage['id'],
            name: item.emballage['name'],
            conditionnement: item.emballage['conditionnement'],
            quantite: item.emballage['quantite'],
            pu: item.emballage['pu'],
            valeur: item.emballage['valeur'],
            isActive:
                item.emballage['isActive'].toString() == 'true' ? true : false,
            isDefault:
                item.emballage['isDefault'].toString() == 'true' ? true : false,
          );

          print('myEmballage: ${myEmballage.toJson()}');
          object.mxemballageObject.target = myEmballage;
        }

        if (item.variete.isNotEmpty) {
          MxVarieteObject myVariete = MxVarieteObject(
            id: item.variete['id'],
            name: item.variete['name'],
            surface_unite: item.variete['surface_unite'],
            quantite_unite: item.variete['quantite_unite'],
            pu_unite: item.variete['pu_unite'],
            rendement_unite:
                double.parse(item.variete['rendement_unite'].toString()),
            isActive:
                item.variete['isActive'].toString() == 'true' ? true : false,
          );
          print('myVariete: ${myVariete.toJson()}');
          object.mxvarieteObject.target = myVariete;
        }
        mxrecoltesBox!.put(object);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxCreditsData(int idExploitation) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.MxmanycreditsByExploitationId +
          idExploitation.toString());
      print(url);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      //print('data jsonResponse $jsonResponse');
      List<MxCreditObject> data =
          jsonResponse.map((e) => MxCreditObject.fromJson(e)).toList();
      //print('data data $data');

      data.forEach((element) {
        print(element.toJson());
      });

      await writeMxCredit(data);

      return true;
    } catch (e) {
      print('Info erreur credit e: $e');
      return false;
    }
  }

  static Future<bool> writeMxCredit(List<MxCreditObject> data) async {
    try {
      for (MxCreditObject item in data) {
        print(
            ' --------------- REMOVE CREDIT EXPLOITATION ${item.exploitation['id']}');
        //print( ' --------------- REMOVE RECOLTE EXPLOITATION ${item.mxExploitationObject.target!.id}');

        Query<MxCreditObject> creditQuery = mxcreditsBox!
            .query(MxCreditObject_.mxExploitationObject
                .equals(item.exploitation['id']))
            .build();
        List<MxCreditObject> mesCreditsToDelete = creditQuery.find();

        mxcreditsBox!
            .removeMany(mesCreditsToDelete.map((credit) => credit.id).toList());
      }

      print('--------   CREDITS LODING -----');

      for (MxCreditObject item in data) {
        //print(item.toJson());

        print('${item.id.toString()}  ------  ${item.date.toString()} ');
        MxCreditObject object = MxCreditObject(
          id: item.id,
          date: DateTime.parse(item.date.toString()),
          capital: double.parse(item.capital.toString()),
          interet: double.parse(item.interet.toString()),
          moratoire: double.parse(item.moratoire.toString()),
          autres_engagements: double.parse(item.autres_engagements.toString()),
        );

        if (item.exploitation.isNotEmpty) {
          MxExploitationObject myExploitation = MxExploitationObject(
            id: item.exploitation['id'],
            compte: item.exploitation['compte'],
            date: DateTime.parse(item.exploitation['date'].toString()),
            unite: item.exploitation['unite'],
            //pu: double.parse(item.exploitation['pu'].toString()),
            surface: double.parse(item.exploitation['surface'].toString()),
            //production:double.parse(item.exploitation['production'].toString()),
            createdAt:
                DateTime.parse(item.exploitation['createdAt'].toString()),
            updatedAt:
                DateTime.parse(item.exploitation['updatedAt'].toString()),
          );
          print('myExploitation: ${myExploitation.toJson()}');
          object.mxExploitationObject.target = myExploitation;
        }

        if (item.agence.isNotEmpty) {
          MxAgenceObject myAgence = MxAgenceObject(
            id: item.agence['id'],
            name: item.agence['name'],
            sigle: item.agence['sigle'],
          );
          print('myAgence: ${myAgence.toJson()}');
          object.mxagenceObject.target = myAgence;
        }
        mxcreditsBox!.put(object);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxRemboursementsData(int idExploitation) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.MxmanyremboursementsByExploitationId +
          idExploitation.toString());
      print(url);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      // print('data jsonResponse $jsonResponse');
      List<MxRemboursementObject> data =
          jsonResponse.map((e) => MxRemboursementObject.fromJson(e)).toList();
      // print('data data $data');

      /*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxRemboursement(data);

      return true;
    } catch (e) {
      print('Info remboursement recolte e: $e');
      return false;
    }
  }

  static Future<bool> writeMxRemboursement(
      List<MxRemboursementObject> data) async {
    try {
      for (MxRemboursementObject item in data) {
        print(
            ' --------------- REMOVE REMBOURSEMENT EXPLOITATION ${item.exploitation['id']}');

        Query<MxRemboursementObject> remboursementQuery = mxremboursementsBox!
            .query(MxRemboursementObject_.mxExploitationObject
                .equals(item.exploitation['id']))
            .build();
        List<MxRemboursementObject> mesRemboursementsToDelete =
            remboursementQuery.find();

        mxremboursementsBox!.removeMany(
            mesRemboursementsToDelete.map((recolte) => recolte.id).toList());
      }

      print('--------   REMBOURSEMENTS LODING -----');

      for (MxRemboursementObject item in data) {
        MxRemboursementObject object = MxRemboursementObject(
          id: item.id,
          date: DateTime.parse(item.date.toString()),
          pu: double.parse(item.pu.toString()),
          nombre_unite: double.parse(item.nombre_unite.toString()),
          nombre_emballage: double.parse(item.nombre_emballage.toString()),
          valeur: double.parse(item.valeur.toString()),
        );

        if (item.exploitation.isNotEmpty) {
          MxExploitationObject myExploitation = MxExploitationObject(
            id: item.exploitation['id'],
            compte: item.exploitation['compte'],
            date: DateTime.parse(item.exploitation['date'].toString()),
            unite: item.exploitation['unite'],
            //pu: double.parse(item.exploitation['pu'].toString()),
            surface: double.parse(item.exploitation['surface'].toString()),
            //production:double.parse(item.exploitation['production'].toString()),
            createdAt:
                DateTime.parse(item.exploitation['createdAt'].toString()),
            updatedAt:
                DateTime.parse(item.exploitation['updatedAt'].toString()),
          );
          print('myExploitation: ${myExploitation.toJson()}');
          object.mxExploitationObject.target = myExploitation;
        }

        if (item.emballage.isNotEmpty) {
          MxEmballageObject myEmballage = MxEmballageObject(
            id: item.emballage['id'],
            name: item.emballage['name'],
            conditionnement: item.emballage['conditionnement'],
            quantite: item.emballage['quantite'],
            pu: item.emballage['pu'],
            valeur: item.emballage['valeur'],
            isActive:
                item.emballage['isActive'].toString() == 'true' ? true : false,
            isDefault:
                item.emballage['isDefault'].toString() == 'true' ? true : false,
          );

          print('myEmballage: ${myEmballage.toJson()}');
          // object.mxemballageObject.target = myEmballage;
        }

        if (item.variete.isNotEmpty) {
          MxVarieteObject myVariete = MxVarieteObject(
            id: item.variete['id'],
            name: item.variete['name'],
            surface_unite: item.variete['surface_unite'],
            quantite_unite: item.variete['quantite_unite'],
            pu_unite: item.variete['pu_unite'],
            rendement_unite:
                double.parse(item.variete['rendement_unite'].toString()),
            isActive:
                item.variete['isActive'].toString() == 'true' ? true : false,
          );
          print('myVariete: ${myVariete.toJson()}');
          object.mxVarieteObject.target = myVariete;
        }
        mxremboursementsBox!.put(object);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxExploitationChargeExploitationData() async {
    try {
      var url = Uri.parse(
          Constants.baseUrl + Constants.Mxallexploitationchargeexploitations);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxExploitationChargeExploitationObject> data = jsonResponse
          .map((e) => MxExploitationChargeExploitationObject.fromJson(e))
          .toList();
      //print('data exploitation $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxExploitationChargeExploitation(data);
      //await mxexploitationBox!.putMany(data);
      return true;
    } catch (e) {
      print('Info erreur exploitation e: $e');
      return false;
    }
  }

  static Future<bool> writeMxExploitationChargeExploitation(
      List<MxExploitationChargeExploitationObject> data) async {
    try {
      mxexploitationChargeExploitationObjectBox?.removeAll();
      print('REMOVE EXPLOITATION CHARGE EXPLOITATION');
      //print('Avant write mxexploitationChargeExploitationObjectBox: ${mxexploitationChargeExploitationObjectBox!.count()}');
      //if (mxexploitationChargeExploitationObjectBox!.count() == 0) {
      print('--------   EXPLOITATION CHARGE EXPLOITATION LODING -----');
      for (MxExploitationChargeExploitationObject item in data) {
        //print(item.toJson());

        //print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxExploitationChargeExploitationObject object =
            MxExploitationChargeExploitationObject(
          id: item.id,
          date: DateTime.parse(item.date.toString()),
          unite: item.unite,
          pu: double.parse(item.pu.toString()),
          quantite: double.parse(item.quantite.toString()),
          valeur: double.parse(item.valeur.toString()),
          observation: item.observation,
        );

        if (item.exploitation.isNotEmpty) {
          MxExploitationObject myExploitation = MxExploitationObject(
            id: item.exploitation['id'],
            compte: item.exploitation['compte'],
            date: DateTime.parse(item.exploitation['date'].toString()),
            unite: item.exploitation['unite'],
            //pu: double.parse(item.exploitation['pu'].toString()),
            surface: double.parse(item.exploitation['surface'].toString()),
            //production:double.parse(item.exploitation['production'].toString()),
            createdAt:
                DateTime.parse(item.exploitation['createdAt'].toString()),
            updatedAt:
                DateTime.parse(item.exploitation['updatedAt'].toString()),
          );
          print(myExploitation.toJson());
          object.mxexploitation.target = myExploitation;
        }

        if (item.chargeExploitation.isNotEmpty) {
          MxChargeExploitationObject myChargeExploitation =
              MxChargeExploitationObject(
            id: item.chargeExploitation['id'],
            name: item.chargeExploitation['name'],
            unite: item.chargeExploitation['unite'],
            pu: double.parse(item.chargeExploitation['pu'].toString()),
            quantite_unite_superficie: double.parse(item
                .chargeExploitation['quantite_unite_superficie']
                .toString()),
            isAchat: item.chargeExploitation['isAchat'].toString() == 'true'
                ? true
                : false,
            isProduit: item.chargeExploitation['isProduit'].toString() == 'true'
                ? true
                : false,
            isIntrant: item.chargeExploitation['isIntrant'].toString() == 'true'
                ? true
                : false,
          );
          print(myChargeExploitation.toJson());
          object.mxchargeexploitationObject.target = myChargeExploitation;
        }

        mxexploitationChargeExploitationObjectBox!.put(object);
      }
      //} else {
      //print('----------- TYPE USER OP LODED -----------');
      //}
      //print(
      //'Apres write mxuserOpBox: ${mxuserOpBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<MxExploitationObject>?>
      getMxExploitationsLocalData() async {
    try {
      /*
      Query<MxExploitationObject> query = mxexploitationBox!.query().build();
      List<MxExploitationObject> mesExploitations = query.find();
      */

      final mxexploitationBox = ObjectBox.mxexploitationBox;
      List<MxExploitationObject> mesExploitations = mxexploitationBox!.getAll();
/*
      mesExploitations.forEach((element) {
        print(
            'exploitation -------------- : ${element.id} | ${element.compte}');
        print(
            'exploitation -------------- OP: ${element.mxopObject.target!.name}');
        print(
            'exploitation -------------- ANNEE: ${element.mxanneeObject.target!.name}');
        print(
            'exploitation -------------- SAISON: ${element.mxsaisonObject.target!.name}');
        print(
            'exploitation -------------- VARIETE: ${element.mxvarieteObject.target!.name}');
      });
      */

      return mesExploitations;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static Future<List<MxExploitationObject>?> getMxOpExploitationsData(
      int opId) async {
    try {
      var url =
          Uri.parse('${Constants.baseUrl}${Constants.Mxallexploitations}');
      print('url:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      List jsonResponse = json.decode(res.body);
      List<MxExploitationObject> data =
          jsonResponse.map((e) => MxExploitationObject.fromJson(e)).toList();
      return data;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static Future<List<MxExploitationChargeExploitationObject>?>
      getMxExploitationChargeExploitationsByExploitationData(
          int exploitationId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.MxallexploitationchargeexploitationsByExploitationId}${exploitationId}/');
      print('urlece:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      List jsonResponse = json.decode(res.body);
      List<MxExploitationChargeExploitationObject> data = jsonResponse
          .map((e) => MxExploitationChargeExploitationObject.fromJson(e))
          .toList();
      //print('data $data');
      return data;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static Future<MxExploitationChargeExploitationObject?>
      getMxExploitationChargeExploitationsByExploitationEtData(
          int exploitationId, int exploitationChargeId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.ExploitationChargeExploitationsByOpEndpoint}${exploitationId}/get_charge_exploitationid/${exploitationChargeId}/');
      print('urlece:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });
      MxExploitationChargeExploitationObject data =
          MxExploitationChargeExploitationObject.fromJson(jsonDecode(res.body));
      print('dat: $data');
      return data;
    } catch (e) {
      print('Info error: $e');
      return null;
    }
  }

  static getMxTypeMouvementStockData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxalltypemouvementstocks);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxTypeMouvementStockObject> data = jsonResponse
          .map((e) => MxTypeMouvementStockObject.fromJson(e))
          .toList();
      //print('data Annee $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      await writeMxTypeMouvementStock(data);
      return true;
    } catch (e) {
      print('Info erreur TypeMouvementStock e: $e');
      return false;
    }
  }

  static Future<bool> writeMxTypeMouvementStock(
      List<MxTypeMouvementStockObject> data) async {
    try {
      mxtypemouvementstocksBox?.removeAll();
      print('REMOVE TYPE MOUVEMENT STOCK');
      print('-------- TYPE MOUVEMENT STOCK LODING -----');
      for (MxTypeMouvementStockObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxTypeMouvementStockObject object =
            MxTypeMouvementStockObject(id: item.id, name: item.name);
        mxtypemouvementstocksBox!.put(object);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxModeEntreeSortieStockData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxallmodeentreesortiestocks);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxModeEntreeSortieStockObject> data = jsonResponse
          .map((e) => MxModeEntreeSortieStockObject.fromJson(e))
          .toList();
      //print('data ModeEntreeSortieStock $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxModeEntreeSortieStock(data);
      return true;
    } catch (e) {
      print('Info erreur mode entree sortie e: $e');
      return false;
    }
  }

  static Future<bool> writeMxModeEntreeSortieStock(
      List<MxModeEntreeSortieStockObject> data) async {
    try {
      mxmodeentreesortiestocksBox?.removeAll();

      print('REMOVE MODE ENTREE SORTIE STOCKS');

      print('-------- MODE ENTREE SORTIE STOCK LODING -----');
      for (MxModeEntreeSortieStockObject item in data) {
        // print('${item.id.toString()}  ------  ${item.name.toString()} ');
        print(item.toJson());
        MxModeEntreeSortieStockObject object = MxModeEntreeSortieStockObject(
          id: item.id,
          code: item.code,
          name: item.name,
        );

        if (item.typeMouvementStock.isNotEmpty) {
          MxTypeMouvementStockObject myTypeMouvementStock =
              MxTypeMouvementStockObject(
            id: item.typeMouvementStock['id'],
            name: item.typeMouvementStock['name'],
          );
          //print('myTypeMouvementStock: ${myTypeMouvementStock.toJson()}');
          object.mxtypemouvementstockObject.target = myTypeMouvementStock;
          print(object.toJson());
        }

        mxmodeentreesortiestocksBox!.put(object);
      }
      final mxmodeEntreeSortieStocksBox = ObjectBox.mxmodeentreesortiestocksBox;
      var mesModeEntreeSortieStocks = mxmodeEntreeSortieStocksBox?.getAll();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxUniteTransformationData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.Mxallunitetransformations);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxUniteTransformationObject> data = jsonResponse
          .map((e) => MxUniteTransformationObject.fromJson(e))
          .toList();
      //print('data Annee $data');
/*
      data.forEach((element) {
        print(element.name);
      });
*/
      await writeMxUniteTransformation(data);
      return true;
    } catch (e) {
      print('Info erreur UniteTransformation e: $e');
      return false;
    }
  }

  static Future<bool> writeMxUniteTransformation(
      List<MxUniteTransformationObject> data) async {
    try {
      mxunitetransformationsBox?.removeAll();
      print('REMOVE UNITE TRANSFORMATION');
      print('-------- UNITE TRANSFORMATION STOCK LODING -----');
      for (MxUniteTransformationObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxUniteTransformationObject object = MxUniteTransformationObject(
            id: item.id,
            name: item.name,
            sigle: item.sigle,
            adresse: item.adresse,
            telephone: item.telephone);
        mxunitetransformationsBox!.put(object);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxEntrepotData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallentrepots);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxEntrepotObject> data =
          jsonResponse.map((e) => MxEntrepotObject.fromJson(e)).toList();
      //print('data Entrepot $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxEntrepot(data);
      return true;
    } catch (e) {
      print('Info erreur entrepot e: $e');
      return false;
    }
  }

  static Future<bool> writeMxEntrepot(List<MxEntrepotObject> data) async {
    try {
      mxentrepotsBox?.removeAll();
      print('REMOVE ENTREPOT');

      print('-------- ENTREPOT LODING -----');
      for (MxEntrepotObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        MxEntrepotObject object = MxEntrepotObject(
          id: item.id,
          name: item.name,
          adresse: item.adresse,
        );

        if (item.point.isNotEmpty) {
          MxPointObject myPoint = MxPointObject(
            id: item.point['id'],
            name: item.point['name'],
            isProduit: item.point['isProduit'],
            isIntrant: item.point['isIntrant'],
            isVirtuel: item.point['isVirtuel'],
          );
          print('myPoint: ${myPoint.toJson()}');
          object.mxpointObject.target = myPoint;
        }

        mxentrepotsBox!.put(object);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxEmplacementData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallemplacements);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxEmplacementObject> data =
          jsonResponse.map((e) => MxEmplacementObject.fromJson(e)).toList();
      //print('data Emplacement $data');

      data.forEach((element) {
        print(element.toJson());
      });

      await writeMxEmplacement(data);
      return true;
    } catch (e) {
      print('Info erreur emplacements e: $e');
      return false;
    }
  }

  static Future<bool> writeMxEmplacement(List<MxEmplacementObject> data) async {
    try {
      mxemplacementsBox?.removeAll();
      print('REMOVE EMPLACEMENTS');

      print('-------- EMPLACEMENT LODING -----');
      for (MxEmplacementObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        print('item: ${item.toJson()}');

        MxEmplacementObject object = MxEmplacementObject(
          id: item.id,
          name: item.name,
          code: item.code,
          capacite: double.parse(item.capacite.toString()),
        );

        if (item.entrepot.isNotEmpty) {
          MxEntrepotObject myEntrepot = MxEntrepotObject(
            id: item.entrepot['id'],
            name: item.entrepot['name'],
            adresse: item.entrepot['adresse'],
          );
          print('myEntrepot: ${myEntrepot.toJson()}');
          object.mxentrepotObject.target = myEntrepot;
        }

        if (item.familleEmplacement.isNotEmpty) {
          MxFamilleEmplacementObject myFamilleEmplacement =
              MxFamilleEmplacementObject(
            id: item.entrepot['id'],
            name: item.entrepot['name'],
          );
          print('myFamilleEmplacement: ${myFamilleEmplacement.toJson()}');
          object.mxfamilleemplacementObject.target = myFamilleEmplacement;
        }

        print('object: ${object.toJson()}');
        mxemplacementsBox!.put(object);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getMxMouvementStockData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.Mxallmouvementstocks);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<MxMouvementStockObject> data =
          jsonResponse.map((e) => MxMouvementStockObject.fromJson(e)).toList();
      //print('data MouvementStock $data');
/*
      data.forEach((element) {
        print(element.toJson());
      });
*/
      await writeMxMouvementStock(data);
      return true;
    } catch (e) {
      print('Info erreur mouvement stock e: $e');
      return false;
    }
  }

  static Future<bool> writeMxMouvementStock(
      List<MxMouvementStockObject> data) async {
    try {
      mxmouvementstocksBox?.removeAll();
      print('REMOVE MOUVEMENT STOCK');

      print('-------- MODE MOUVEMENT STOCK LODING -----');
      for (MxMouvementStockObject item in data) {
        print('${item.id.toString()}  ------  ${item.date.toString()} ');
        MxMouvementStockObject object = MxMouvementStockObject(
          id: item.id,
          date: DateTime.parse(item.date.toString()),
          pu: double.parse(item.pu.toString()),
          quantiteEntreeEmballage:
              double.parse(item.quantiteEntreeEmballage.toString()),
          quantiteSortieEmballage:
              double.parse(item.quantiteSortieEmballage.toString()),
          nombreUnite: double.parse(item.nombreUnite.toString()),
          valeur: double.parse(item.valeur.toString()),
          lot: item.lot,
          isSended: false,
          dateSended: null
        );

        if (item.emballage.isNotEmpty) {
          MxEmballageObject myEmballage = MxEmballageObject(
            id: item.emballage['id'],
            name: item.emballage['name'],
            conditionnement: item.emballage['conditionnement'],
            quantite: item.emballage['quantite'],
            pu: item.emballage['pu'],
            valeur: item.emballage['valeur'],
            isActive:
                item.emballage['isActive'].toString() == 'true' ? true : false,
            isDefault:
                item.emballage['isDefault'].toString() == 'true' ? true : false,
          );

          print('myEmballage: ${myEmballage.toJson()}');
          object.mxemballageObject.target = myEmballage;
        }

        if (item.op.isNotEmpty) {
          MxOpObject myOp = MxOpObject(
            id: item.op['id'],
            name: item.op['name'],
            sigle: item.op['sigle'],
            email: item.op['email'],
            telephone: item.op['telephone'],
            adresse: item.op['adresse'],
            prenom_contact: item.op['prenom_contact'],
            nom_contact: item.op['nom_contact'],
            email_contact: item.op['email_contact'],
            telephone_contact: item.op['telephone_contact'],
          );
          print('myOp: ${myOp.toJson()}');
          object.mxopObject.target = myOp;
        }

        if (item.uniteTransformation.isNotEmpty) {
          MxUniteTransformationObject myUniteTransformation =
              MxUniteTransformationObject(
            id: item.uniteTransformation['id'],
            name: item.uniteTransformation['name'],
            sigle: item.uniteTransformation['sigle'],
            adresse: item.uniteTransformation['adresse'],
            telephone: item.uniteTransformation['telephone'],
          );
          print('myUniteTransformation: ${myUniteTransformation.toJson()}');
          object.mxunitetransformationObject.target = myUniteTransformation;
        }

        if (item.variete.isNotEmpty) {
          MxVarieteObject myVariete = MxVarieteObject(
            id: item.variete['id'],
            name: item.variete['name'],
            surface_unite: item.variete['surface_unite'],
            quantite_unite: item.variete['quantite_unite'],
            pu_unite: item.variete['pu_unite'],
            rendement_unite:
                double.parse(item.variete['rendement_unite'].toString()),
            isActive:
                item.variete['isActive'].toString() == 'true' ? true : false,
          );
          print('myVariete: ${myVariete.toJson()}');
          object.mxvarieteObject.target = myVariete;
        }

        if (item.modeEntreeSortieStock.isNotEmpty) {
          MxModeEntreeSortieStockObject myModeEntreeSortieStock =
              MxModeEntreeSortieStockObject(
            id: item.modeEntreeSortieStock['id'],
            code: item.modeEntreeSortieStock['code'],
            name: item.modeEntreeSortieStock['name'],
          );
          print('myModeEntreeSortieStock: ${myModeEntreeSortieStock.toJson()}');
          object.mxmodeentreesortiestockObject.target = myModeEntreeSortieStock;
        }

        if (item.emplacement.isNotEmpty) {
          MxEmplacementObject myEmplacement = MxEmplacementObject(
            id: item.op['id'],
            name: item.op['name'],
            code: item.op['code'],
            capacite: double.parse(item.op['capacite'].toString()),
          );
          print('myEmplacement: ${myEmplacement.toJson()}');
          object.mxemplacementObject.target = myEmplacement;
        }

        mxmouvementstocksBox!.put(object);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> EditMxMouvementStock(
      {required MxMouvementStockObject myMxMouvementStock,
      required String modeEdition}) async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.loginEndpoint);

      Constants.url = url.toString();

      final dio = Dio();

      print('Constants.userConnexion.email: ${Constants.userConnexion.email}');

      print(
          'Constants.userConnexion.password: ${Constants.userConnexion.password}');

      final response = await dio.post('${url}',
          data: {
            'email': Constants.userConnexion.email,
            'password': Constants.userConnexion.password,
          },
          options: Options(
            headers: {'Content-type': 'application/json; charset=utf-8'},
          ));

      if (response.statusCode == 201) {
        //print(' xxxx user is Connected xxxx');
        Map<String, dynamic> data = response.data;
        // print('data: ${data}');
        Constants.access = data['token'];
        Constants.refresh = data['token'];
        // print('xxxx access: ${Constants.access}');

        Map<String, dynamic> postData = {
          'id': myMxMouvementStock.id,
          'date': DateTime.now()
              .toIso8601String(), //DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()), //DateTime.parse(myMxMouvementStock.date.toString()), //DateTime.parse(myMxMouvementStock.date.toString()),
          'pu': double.parse(myMxMouvementStock.pu.toString()),
          'quantiteEntreeEmballage': double.parse(
              myMxMouvementStock.quantiteEntreeEmballage.toString()),
          'quantiteSortieEmballage': double.parse(
              myMxMouvementStock.quantiteSortieEmballage.toString()),
          'nombreUnite':
              double.parse(myMxMouvementStock.nombreUnite.toString()),
          'valeur': double.parse(myMxMouvementStock.valeur.toString()),
          'opId': myMxMouvementStock.mxopObject.target!.id,

          //'uniteTransformationId':myMxMouvementStock.mxunitetransformationObject.target!.id,
          'uniteTransformationId': 0,
          'varieteId': myMxMouvementStock.mxvarieteObject.target!.id,
          'modeEntreeSortieStockId':
              myMxMouvementStock.mxmodeentreesortiestockObject.target!.id,
          'emplacementId': myMxMouvementStock.mxemplacementObject.target!.id,
          'emballageId': myMxMouvementStock.mxemballageObject.target!.id,
          'anneeId': myMxMouvementStock.mxanneeObject.target!.id,
          'saisonId': myMxMouvementStock.mxsaisonObject.target!.id,
        };

        final body = jsonEncode({
          'id': myMxMouvementStock.id,
          'date': myMxMouvementStock.date
              .toUtc()
              .toIso8601String(), // DateTime.now().toUtc().toIso8601String(),
          //DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()), //DateTime.parse(myMxMouvementStock.date.toString()), //DateTime.parse(myMxMouvementStock.date.toString()),
          'pu': double.parse(myMxMouvementStock.pu.toString()),
          'quantiteEntreeEmballage': double.parse(
              myMxMouvementStock.quantiteEntreeEmballage.toString()),
          'quantiteSortieEmballage': double.parse(
              myMxMouvementStock.quantiteSortieEmballage.toString()),
          'nombreUnite':
              double.parse(myMxMouvementStock.nombreUnite.toString()),
          'valeur': double.parse(myMxMouvementStock.valeur.toString()),
          'opId': myMxMouvementStock.mxopObject.target!.id,

          //'uniteTransformationId':myMxMouvementStock.mxunitetransformationObject.target!.id,
          //'uniteTransformationId': Null,
          'varieteId': myMxMouvementStock.mxvarieteObject.target!.id,
          'modeEntreeSortieStockId':
              myMxMouvementStock.mxmodeentreesortiestockObject.target!.id,
          'emplacementId': myMxMouvementStock.mxemplacementObject.target!.id,
          'emballageId': myMxMouvementStock.mxemballageObject.target!.id,
          'anneeId': myMxMouvementStock.mxanneeObject.target!.id,
          'saisonId': myMxMouvementStock.mxsaisonObject.target!.id,
        });

        print(body);
        if (modeEdition == 'add') {
          // AJOUT
          var url = Uri.parse(
              Constants.baseUrl + Constants.Mxallmouvementstocks + 'create');
          // print('url:' + url.toString());
          print('Constants.access:' + Constants.access);
          //Constants.url = url.toString();

          final dio = Dio();
          final responseEdit = await dio.post('${url}',
              data: body,
              options: Options(
                headers: {
                  'Content-type': 'application/json; charset=utf-8',
                  'Authorization': "Bearer ${Constants.access}"
                },
              ));

          if (responseEdit.statusCode == 201) {
            print('Ajout ok');
          }
        }
        /*
        else if (modeEdition == 'edit') {
          // MODIFICATION
          var url = Uri.parse(Constants.baseUrl +
              Constants.Mxallmodeentreesortiestocks +
              'update/: + ${myMxMouvementStock.id}');
          Constants.url = url.toString();
          final dio = Dio();
          final response = await dio.put('${url}',
              data: postData,
              options: Options(
                headers: {
                  'Content-type': 'application/json; charset=utf-8',
                  'Authorization': "Bearer ${Constants.access}"
                },
              ));
          if (response.statusCode == 201) {
            print('Modification ok');
          }
        } else if (modeEdition == 'delete') {
          print('a supprimer ${myMxMouvementStock.id}');
        }
        */
      }

      return true;
    } catch (e) {
      print('Erreur edition stock e: $e');
      return false;
    }
  }

  static Future<bool> EditListMxMouvementStock(
      {required List<MxMouvementStockObject> myListMxMouvementStock,
      required String modeEdition}) async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.loginEndpoint);

      Constants.url = url.toString();

      final dio = Dio();

      final response = await dio.post('${url}',
          data: {
            'email': Constants.userConnexion.email,
            'password': Constants.userConnexion.password,
          },
          options: Options(
            headers: {'Content-type': 'application/json; charset=utf-8'},
          ));

      if (response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        Constants.access = data['token'];
        Constants.refresh = data['token'];

        if (modeEdition == 'add') {
          // AJOUT
          var url = Uri.parse(
              Constants.baseUrl + Constants.Mxallmouvementstocks + 'create');
          // print('url:' + url.toString());
          // print('Constants.access:' + Constants.access);
          // Constants.url = url.toString();

          final dioEdit = Dio();

          myListMxMouvementStock.forEach((element) async {
            //print(element.mxvarieteObject.target!.toJson());

            final body = jsonEncode({
              'id': 0,
              'date': element.date
                  .toUtc()
                  .toIso8601String(), // DateTime.now().toUtc().toIso8601String(),
              //DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()), //DateTime.parse(myMxMouvementStock.date.toString()), //DateTime.parse(myMxMouvementStock.date.toString()),
              'pu': double.parse(element.pu.toString()),
              'quantiteEntreeEmballage':
                  double.parse(element.quantiteEntreeEmballage.toString()),
              'quantiteSortieEmballage':
                  double.parse(element.quantiteSortieEmballage.toString()),
              'nombreUnite': double.parse(element.nombreUnite.toString()),
              'valeur': double.parse(element.valeur.toString()),

              'opId': element.mxmodeentreesortiestockObject.target!.id == 1
                  ? element.mxopObject.target!.id
                  : null,

              'uniteTransformationId':
                  element.mxmodeentreesortiestockObject.target!.id == 2
                      ? element.mxunitetransformationObject.target!.id
                      : null,

              'varieteId': element.mxvarieteObject.target!.id,
              'modeEntreeSortieStockId':
                  element.mxmodeentreesortiestockObject.target!.id,
              'emplacementId': element.mxemplacementObject.target!.id,
              'emballageId': element.mxemballageObject.target!.id,
              'anneeId': element.mxanneeObject.target!.id,
              'saisonId': element.mxsaisonObject.target!.id,
              /*
           */
            });

            final responseEdit = await dioEdit.post('${url}',
                data: body,
                options: Options(
                  headers: {
                    'Content-type': 'application/json; charset=utf-8',
                    'Authorization': "Bearer ${Constants.access}"
                  },
                ));
            if (responseEdit.statusCode == 201) {
              print('Ajout ok: ${element.id}');
            }
          });
        }

        /*
        else if (modeEdition == 'edit') {
          // MODIFICATION
          var url = Uri.parse(Constants.baseUrl +
              Constants.Mxallmodeentreesortiestocks +
              'update/: + ${myMxMouvementStock.id}');
          Constants.url = url.toString();
          final dio = Dio();
          final response = await dio.put('${url}',
              data: postData,
              options: Options(
                headers: {
                  'Content-type': 'application/json; charset=utf-8',
                  'Authorization': "Bearer ${Constants.access}"
                },
              ));
          if (response.statusCode == 201) {
            print('Modification ok');
          }
        } else if (modeEdition == 'delete') {
          print('a supprimer ${myMxMouvementStock.id}');
        }
        */
      }

      return true;
    } catch (e) {
      print('Erreur edition stock e: $e');
      return false;
    }
  }

  ///************************************END OF ROAD**************************************** */

  static getUserData() async {
    try {
      final userBox = ObjectBox.userBox;
      userBox?.removeAll();
      print('Avant write user: ${userBox!.count()}');

      UserObject objectAdmin = UserObject(
        id: 0,
        token: '',
        refresh: '',
        access: '',
        email: 'admin',
        password: 'password',
        firstname: 'adminFirstName',
        lastname: 'adminLastName',
        op_id: 0,
        op_name: '',
        sous_zone_id: 0,
        sous_zone_name: '',
        zone_id: 0,
        zone_name: '',
        point_id: 0,
        point_name: '',
      );
      userBox.put(objectAdmin);
      //}

      return true;
    } catch (e) {
      print('Info erreur userBox e: $e');
      return false;
    }
  }

  static Future<ExploitationObject?> getExploitationByIdData(
      int exploitationId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.ExploitationsByIdEndpoint}${exploitationId}/');
      print('urlee:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      return ExploitationObject.fromJson(jsonDecode(res.body));
      //return data;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static Future<List<ExploitationObject>?> getOpExploitationsData(
      int opId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.ExploitationsByOpEndpoint}${opId}/');
      print('url:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationObject> data =
          jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();
      return data;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static getOpExploitationsDatas(int opId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.ExploitationsByOpEndpoint}${opId}/');
      print('url:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      List jsonResponse = json.decode(res.body);

      List<ExploitationObject> data =
          jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();
      //print(list);

      return data;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static Future<List<ExploitationChargeExploitationObject>?>
      getExploitationChargeExploitationsByExploitationData(
          int exploitationId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.ExploitationChargeExploitationsByOpEndpoint}${exploitationId}/');
      print('urlece:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationChargeExploitationObject> data = jsonResponse
          .map((e) => ExploitationChargeExploitationObject.fromJson(e))
          .toList();
      //print('data $data');
      return data;
    } catch (e) {
      print('Info e: $e');
      return null;
    }
  }

  static Future<ExploitationChargeExploitationObject?>
      getExploitationChargeExploitationsByExploitationEtData(
          int exploitationId, int exploitationChargeId) async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.ExploitationChargeExploitationsByOpEndpoint}${exploitationId}/get_charge_exploitationid/${exploitationChargeId}/');
      print('urlece:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });
      ExploitationChargeExploitationObject data =
          ExploitationChargeExploitationObject.fromJson(jsonDecode(res.body));
      print('dat: $data');
      return data;
    } catch (e) {
      print('Info error: $e');
      return null;
    }
  }

  static getUserUniteTransformationsData() async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.user_unite_transformations}${Constants.idUser}/');
      // print('UUT--------- url:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });
      // print(' xxxxxxxxxxx $res');
      List jsonResponse = json.decode(res.body);
      List<UserUniteTransformationObject> data = jsonResponse
          .map((e) => UserUniteTransformationObject.fromJson(e))
          .toList();
      // print(' xxxxx --- xxxxxx ' + data.first.unitetransformationname);
      await writeBoxUserUniteTransformations(data);
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getUserPointsData() async {
    try {
      var url = Uri.parse(
          '${Constants.baseUrl}${Constants.user_point_collectes}${Constants.idUser}/');
      // print('UUT--------- url:' + url.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });
      // print(' xxxxxxxxxxx $res');
      List jsonResponse = json.decode(res.body);

      List<UserPointObject> data =
          jsonResponse.map((e) => UserPointObject.fromJson(e)).toList();

      // print(' xxxxx --- xxxxxx ' + data.first.unitetransformationname);
      await writeBoxUserPoints(data);
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getSaisonData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.allsaisons);

      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<SaisonObject> data =
          jsonResponse.map((e) => SaisonObject.fromJson(e)).toList();
      await writeBoxSaison(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getAnneeData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.allannees);

      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<AnneeObject> data =
          jsonResponse.map((e) => AnneeObject.fromJson(e)).toList();
      // print(data);
      await writeBoxAnnee(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getEmballageData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.allemballages);

      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<EmballageObject> data =
          jsonResponse.map((e) => EmballageObject.fromJson(e)).toList();

      await writeBoxEmballage(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getVarieteData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.allvarietes);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });
      List jsonResponse = json.decode(res.body);
      List<VarieteObject> data =
          jsonResponse.map((e) => VarieteObject.fromJson(e)).toList();
      // print('---------------------------------------------- Info data Variete: ${data}');
      await writeBoxVarieteObject(data);
      return true;
    } catch (e) {
      print('--Error varieteLoad -- $e');
      return false;
    }
  }

  static getTypeChargeExploitationData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.alltypechargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<TypeChargeExploitationObject> data = jsonResponse
          .map((e) => TypeChargeExploitationObject.fromJson(e))
          .toList();
      await writeBoxTypeChargeExploitationObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getFamilleExploitationData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.allfamillechargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<FamilleChargeExploitationObject> data = jsonResponse
          .map((e) => FamilleChargeExploitationObject.fromJson(e))
          .toList();
      await writeBoxFamilleChargeExploitationObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getChargeExploitationData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.allchargeexploitations);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<ChargeExploitationObject> data = jsonResponse
          .map((e) => ChargeExploitationObject.fromJson(e))
          .toList();
      // print('Info getChargeExploitationData: ${data} --  ${data.length}');
      await writeBoxChargeExploitationObject(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getExploitationData(int IdProducteur) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.allProducteurExploitations +
          IdProducteur.toString());
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationObject> data =
          jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();
      // print('Info data: ${IdProducteur} --  ${data.length}');
      await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getProducteurData(int opId) async {
    try {
      final urlVar =
          Uri.parse('${Constants.baseUrl}${Constants.allproducteursOp}$opId/');
      // print(' ------------------- OK--- url:' + url_var.toString());
      final resVar = await http.get(urlVar, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.access}',
      });

      // print(Constants.access);
      // print(res_var_.body);

      List jsonResponse_ = json.decode(resVar.body);
      List<ProducteurObject> data_ =
          jsonResponse_.map((e) => ProducteurObject.fromJson(e)).toList();
      // print('Info data: ${IdProducteur} --  ${data.length}');
      await writeBoxProducteurObject(data_);
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getArrayProducteursData(List<int> ListInt) async {
    try {
      print('ListInt.length --- :  ${ListInt.length.toString()}');
      for (int i = 0; i < ListInt.length; i++) {
        final urlVar = Uri.parse(
            '${Constants.baseUrl}${Constants.allproducteursOp}${ListInt[i]}/');
        final resVar = await http.get(urlVar, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Constants.access}',
        });

        List jsonResponse_ = json.decode(resVar.body);
        List<ProducteurObject> data =
            jsonResponse_.map((e) => ProducteurObject.fromJson(e)).toList();
        await writeBoxProducteurObject(data);
      }
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getArrayOpsExploitationData(List<int> ListInt) async {
    try {
      print('ListInt.length --- :  ${ListInt.length.toString()}');
      for (int i = 0; i < ListInt.length; i++) {
        var varUrl = Uri.parse(
            '${Constants.baseUrl}${Constants.arrayopexploitations}${ListInt[i]}/');
        print('Info url ${ListInt[i].toString()}: $varUrl');
        final varRes = await http.get(varUrl, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer ${Constants.access}",
        });

        List jsonResponse = json.decode(varRes.body);
        List<ExploitationObject> data_ =
            jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();
        await writeBoxExploitationObject(data_);
      }
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getArrayProducteursExploitationData(List<int> ListInt) async {
    try {
      print('ListInt.length --- :  ${ListInt.length.toString()}');
      exploitationsBox?.removeAll();
      print('Avant write exploitation: ${exploitationsBox!.count()}');
      print('------------------- SAISONS LODING----------------------');
      for (int i = 0; i < ListInt.length; i++) {
        // print('item --- : ' + Constants.producteurIdList[i].toString());

        var url = Uri.parse(Constants.baseUrl +
            Constants.arrayopexploitations +
            ListInt[i].toString());
        print('Info url ${ListInt[i].toString()}: $url');
        final res = await http.get(url, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer ${Constants.access}",
        });

        List jsonResponse = json.decode(res.body);
        List<ExploitationObject> data =
            jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();
        await writeBoxExploitationObject(data);
      }
      print('Apres write exploitation: ${exploitationsBox!.count()}');
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getArrayProducteurExploitationData() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.arrayproducteurexploitations);
      print('Info url: $url');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationObject> data =
          jsonResponse.map((e) => ExploitationObject.fromJson(e)).toList();

      print('ExploitationObject data.length: ${data.length}');
      for (ExploitationObject item in data) {
        print('ExploitationObject ${item.id}: ${item.compte}');
      }

      // await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getExploitationChargeExploitationData() async {
    try {
      var url = Uri.parse(
          Constants.baseUrl + Constants.allexploitationschargeexploitation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Constants.token}',
      });

      List jsonResponse = json.decode(res.body);
      List<ExploitationChargeExploitationObject> data = jsonResponse
          .map((e) => ExploitationChargeExploitationObject.fromJson(e))
          .toList();
      print('Info data ECE: $data');
      await writeBoxExploitationChargeExploitationObject(data);
      for (ExploitationChargeExploitationObject item in data) {
        print(
            '--- ECE ----   ${item.id.toString()} ------ ${item.unite.toString()} -- ${item.quantite.toString()} ');
      }
      return true;
    } catch (e) {
      print('Error data ECE: $e');
      return false;
    }
  }

  static getArrayExploitationChargeExploitationData(List<int> ListInt) async {
    try {
      print('ListInt.length --- :  ${ListInt.length.toString()}');
      for (int i = 0; i < ListInt.length; i++) {
        var url = Uri.parse(
            '${Constants.baseUrl}${Constants.allExploitationschargeexploitation}${ListInt[i]}/');
        print('Info url ${ListInt[i].toString()}: $url');
        final res = await http.get(url, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer ${Constants.access}",
        });

        List jsonResponse = json.decode(res.body);
        List<ExploitationChargeExploitationObject> data_ = jsonResponse
            .map((e) => ExploitationChargeExploitationObject.fromJson(e))
            .toList();

        print(
            'ExploitationChargeExploitationObject data.length: ${data_.length}');
        for (ExploitationChargeExploitationObject item in data_) {
          print(
              'ExploitationChargeExploitationObject ${item.id}: ${item.chargeexploitationname}');
        }
        await writeBoxExploitationChargeExploitationObject(data_);
      }

      // await writeBoxExploitationObject(data);
      return true;
    } catch (e) {
      print('Info e: $e');
      return false;
    }
  }

  static getTypeTransformationData() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.alltypetransformation);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });

      List jsonResponse = json.decode(res.body);
      List<TypeTransformationObject> data = jsonResponse
          .map((e) => TypeTransformationObject.fromJson(e))
          .toList();
      await writeBoxTypeTransformation(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> writeBoxSaison(List<SaisonObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      // if (saisonsBox!.isEmpty()) {
      saisonsBox?.removeAll();
      print('Avant write saison: ${saisonsBox!.count()}');
      print('------------------- SAISONS LODING----------------------');
      for (SaisonObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()}  ----- ${item.description.toString()}');
        SaisonObject saisonObject = SaisonObject(
            id: item.id, name: item.name, description: item.description);
        saisonsBox!.put(saisonObject);
      }
      //} else {
      //print('------------------- SAISONS LODED----------------------');
      //}
      print('Apres write saison: ${saisonsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxAnnee(List<AnneeObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    // print('avant write: ' + anneesBox!.count().toString());
    try {
      anneesBox?.removeAll();
      print('Avant write annee: ${anneesBox!.count()}');
      //if (anneesBox == null || anneesBox!.isEmpty() ) {
      print('------------------- ANNEES LODING----------------------');
      for (AnneeObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()}  ----- ${item.value.toString()}');
        AnneeObject anneeObject =
            AnneeObject(id: item.id, value: item.value, name: item.name);
        anneesBox!.put(anneeObject);
      }
      //} else {
      //print('------------------- ANNEES LODED----------------------');
      //}
      print('Apres write annee: ${anneesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxEmballage(List<EmballageObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    // print('avant write: ' + anneesBox!.count().toString());
    try {
      emballagesBox?.removeAll();
      print('Avant write emballage: ${emballagesBox!.count()}');
      //if (anneesBox == null || anneesBox!.isEmpty() ) {
      print('------------------- EMBALLAGES LODING----------------------');
      for (EmballageObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.name.toString()}  ----- ${item.typeunitegrandeurname.toString()}');
        EmballageObject emballageObject = EmballageObject(
            id: item.id,
            name: item.name,
            conditionnement: item.conditionnement,
            is_actif: item.is_actif,
            quantite: item.quantite,
            produitid: item.produitid,
            produitname: item.produitname,
            typeemballageid: item.typeemballageid,
            typeemballagename: item.typeemballagename,
            unitegrandeurid: item.unitegrandeurid,
            typeunitegrandeurname: item.typeunitegrandeurname,
            valeur: item.valeur,
            is_default: item.is_default);
        emballagesBox!.put(emballageObject);
      }
      //} else {
      //print('------------------- ANNEES LODED----------------------');
      //}
      print('Apres write annee: ${anneesBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxVarieteObject(List<VarieteObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      varietesBox?.removeAll();
      print('Avant write variete: ${varietesBox!.count()}');
      //if (varietesBox!.isEmpty()) {
      print(
          '-------------------------VARIETE LODING--------------------------------');

      for (VarieteObject item in data) {
        print(
            '${item.id.toString()} - ${item.name.toString()} - ${item.rendement_unite} - ${item.quantite_unite}  - ${item.surface_unite}  - ${item.produitid} - ${item.produitname}  - ${item.filiereid} - ${item.filierename}  ');
        VarieteObject object = VarieteObject(
          id: item.id,
          name: item.name,
          filiereid: int.parse(item.filiereid.toString()),
          filierename: item.filierename,
          produitid: int.parse(item.produitid.toString()),
          produitname: item.produitname,
          familleemplacementid: int.parse(item.familleemplacementid.toString()),
          familleemplacementname: item.familleemplacementname,
          surface_unite: item.surface_unite ?? '',
          quantite_unite: item.quantite_unite ?? '',
          rendement_unite: item.rendement_unite ?? 0,
          /*
            filiere_id: item.filiere_id == null ? 0 : item.filiere_id,
            filiere_name: item.filiere_name == null ? '' : item.filiere_name,
            produit_id: item.produit_id == null ? 0 : item.produit_id,
            produit_name: item.produit_name == null ? '' : item.produit_name,
            familleemplacement_id: item.familleemplacement_id == null
                ? 0
                : item.familleemplacement_id,
            familleemplacement_name: item.familleemplacement_name == null
                ? ''
                : item.familleemplacement_name,
                */
        );

        varietesBox!.put(object);
      }
      //} else {
      //print('------------------- VARIETE LODED----------------------');
      //}
      print('Apres write variete: ${varietesBox!.count()}');
      return true;
    } catch (e) {
      print('--Error varieteObject -- $e');
      return false;
    }
  }

  static Future<bool> writeBoxTypeChargeExploitationObject(
      List<TypeChargeExploitationObject> data) async {
    //await Future<String>.delayed(const Duration(seconds: 5));
    try {
      typeChargeExploitationsBox?.removeAll();
      print(
          'Avant write typeChargeExploitationsBox: ${typeChargeExploitationsBox!.count()}');
      //if (typeChargeExploitationsBox!.isEmpty()) {
      print('-------- TYPE CHARGES EXPLOITATION LODING -----');
      for (TypeChargeExploitationObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        TypeChargeExploitationObject object =
            TypeChargeExploitationObject(id: item.id, name: item.name);
        typeChargeExploitationsBox!.put(object);
      }
      //} else {
      // print('----------- TYPE CHARGES EXPLOITATION LODED -----------');
      //}
      print(
          'Apres write typeChargeExploitationsBox: ${typeChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

/*
  static Future<bool> writeBoxTypeOpObject(List<TypeOpObject> data) async {
    try {
      // if (typeOpsBox!.isEmpty()) {
      typeOpsBox?.removeAll();
      print('Avant write typeOpsBox: ${typeOpsBox!.count()}');
      print('------------------- TYPE OP LODING ----------------------');
      for (TypeOpObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        TypeOpObject object = TypeOpObject(id: item.id, name: item.name);
        typeOpsBox!.put(object);
      }
      //} else {
      //print('------------------- TYPE OPS LODED ----------------------');
      // }
      print('Apres write typeOpsBox: ${typeOpsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
*/
  static Future<bool> writeBoxFamilleChargeExploitationObject(
      List<FamilleChargeExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      familleChargeExploitationsBox?.removeAll();
      print(
          'Avant write familleChargeExploitationsBox: ${familleChargeExploitationsBox!.count()}');
      //if (familleChargeExploitationsBox!.isEmpty()) {
      print('----FAMILLE CHARGES EXPLOITATION LODING -----');
      for (FamilleChargeExploitationObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        FamilleChargeExploitationObject object =
            FamilleChargeExploitationObject(id: item.id, name: item.name);
        familleChargeExploitationsBox!.put(object);
      }
      //} else {
      // print('-----FAMILLE CHARGES EXPLOITATION LODED------');
      //}
      print(
          'Apres write familleChargeExploitationsBox: ${familleChargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxChargeExploitationObject(
      List<ChargeExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      chargeExploitationsBox?.removeAll();
      print(
          'Avant write chargeExploitationsBox: ${chargeExploitationsBox!.count()}');
      //if (chargeExploitationsBox!.isEmpty()) {
      print(
          '------------------- CHARGES EXPLOITATION LODING----------------------');
      for (ChargeExploitationObject item in data) {
        print('${item.id.toString()}  ------  ${item.name.toString()} ');
        ChargeExploitationObject object = ChargeExploitationObject(
            id: item.id,
            name: item.name,
            unite: item.unite,
            pu: double.parse(item.pu.toString()),
            quantite_unite_superficie:
                double.parse(item.quantite_unite_superficie.toString()),
            produitid: int.parse(item.produitid.toString()),
            produitname: item.produitname,
            famillechargeexploitationid:
                int.parse(item.famillechargeexploitationid.toString()),
            famillechargeexploitationname: item.famillechargeexploitationname,
            typechargeexploitationid:
                int.parse(item.typechargeexploitationid.toString()),
            typechargeexploitationname: item.typechargeexploitationname,
            is_achat: item.is_achat.toString() == 'true' ? true : false);
        chargeExploitationsBox!.put(object);
      }
      //} else {
      print(
          '------------------- CHARGES EXPLOITATION LODED----------------------');
      // }
      print(
          'Apres write chargeExploitationsBox: ${chargeExploitationsBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxExploitationObject(
      List<ExploitationObject> data) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      // if(exploitationsBox!.isEmpty()) {
      Constants.exploitationIdList = [];
      for (ExploitationObject item in data) {
        //print(item.toJson());
        //print(item.id);
        print(
            ' EXPLOITATION: ${item.id.toString()} --- ${item.compte.toString()} ');
        ExploitationObject object = ExploitationObject(
          id: 0,
          date: item.date,
          producteurid: item.producteurid,
          exploitation_id: item.exploitation_id,
          prenom: item.prenom,
          nom: item.nom,
          opid: item.opid,
          opname: item.opname,
          typeopid: item.typeopid,
          typeopname: item.typeopname,
          compte: item.compte,
          unite: item.unite,
          surface_prevision: double.parse(item.surface_prevision.toString()),
          production_prevision:
              double.parse(item.production_prevision.toString()),
          pu_prevision: double.parse(item.pu_prevision.toString()),
          varieteprevisionid: int.parse(item.varieteprevisionid.toString()),
          varieteprevisionname: item.varieteprevisionname,
          surface: double.parse(item.surface.toString()),
          production: double.parse(item.production.toString()),
          pu: double.parse(item.pu.toString()),
          filiereid: int.parse(item.filiereid.toString()),
          filierename: item.filierename,
          produitid: int.parse(item.produitid.toString()),
          produitname: item.produitname,
          varieteid: int.parse(item.varieteid.toString()),
          varietename: item.varietename,
          varietepu: item.varietepu,
          saisonid: int.parse(item.saisonid.toString()),
          saisonname: item.saisonname,
          emballageid: int.parse(item.emballageid.toString()),
          emballagename: item.emballagename,
          emballagequantite: double.parse(item.emballagequantite.toString()),
          emballagepu: double.parse(item.emballagepu.toString()),
          emballagetypeemballageid:
              int.parse(item.emballagetypeemballageid.toString()),
          emballagetypeemballagename: item.emballagetypeemballagename,
          emballageunitegrandeurid:
              int.parse(item.emballageunitegrandeurid.toString()),
          emballageunitegrandeurname: item.emballageunitegrandeurname,
          emballageunitevaleurreference:
              double.parse(item.emballageunitevaleurreference.toString()),
          anneeid: int.parse(item.anneeid.toString()),
          anneename: item.anneename,
        );

        exploitationsBox!.put(object);
        Constants.exploitationIdList.add(item.id);
      }

      getArrayExploitationChargeExploitationData(Constants.exploitationIdList);
      /*
      }else {
        print('------------------- EXPLOITATIONS LODED----------------------');
      }

         */
      return true;
    } catch (e) {
      print(' ---Error------- $e');
      return false;
    }
  }

  static Future<bool> writeBoxOpObject(List<OpObject> data) async {
    try {
      /*
      print(' --- DATA NAME : ${data.first.name}');
      print(' --- DATA EMAIL : ${data.first.email}');
      print(' --- DATA telephone : ${data.first.telephone}');
      print(' --- DATA adresse : ${data.first.adresse}');
      print(' --- DATA is_actif : ${data.first.is_actif}');
      print(' --- DATA type_op_id : ${int.parse(data.first.type_op_id.toString())}');
      print(' --- DATA type_op_name : ${data.first.type_op_name}');
      print(' --- DATA localite_id : ${data.first.localite_id.toString()}');
      print(' --- DATA localite_name : ${data.first.localite_name}');
      print(' --- DATA zone_id : ${data.first.zone_id}');
      print(' --- DATA zone_name : ${data.first.zone_name}');
      print(' --- DATA departement_id : ${data.first.departement_id.toString()}');
      print(' --- DATA departement_name : ${data.first.departement_name}');
      print(' --- DATA region_id : ${data.first.region_id}');
      print(' --- DATA region_name: ${data.first.region_name}');
      print(' --- DATA pays_id : ${data.first.pays_id}');
      print(' --- DATA pays_name: ${data.first.pays_name}');

       */

      for (OpObject item in data) {
        // print(' OP -----: ${item.id.toString()} --- ${item.name.toString()} ');

        OpObject object = OpObject(
            id: item.id,
            name: item.name,
            email: item.email,
            telephone: item.telephone,
            adresse: item.adresse,
            is_actif: false,
            /*
            type_op_id: int.parse(item.type_op_id.toString()),
            type_op_name: item.type_op_name,
            localite_id: int.parse(item.localite_id.toString()) ,
            localite_name: item.localite_name,
            sous_zone_id: int.parse(item.sous_zone_id.toString()) ,
            sous_zone_name: item.sous_zone_name,
            zone_id: int.parse(item.zone_id.toString()) ,
            zone_name: item.zone_name,
            departement_id: int.parse(item.departement_id.toString()) ,
            departement_name: item.departement_name,
            region_id: int.parse(item.region_id.toString()) ,
            region_name: item.region_name,
            pays_id: int.parse(item.pays_id.toString()) ,
            pays_name: item.pays_name
             */
            type_op_id: 0,
            type_op_name: '',
            localite_id: 0,
            localite_name: '',
            sous_zone_id: 0,
            sous_zone_name: '',
            zone_id: 0,
            zone_name: '',
            departement_id: 0,
            departement_name: '',
            region_id: 0,
            region_name: '',
            pays_id: 0,
            pays_name: '');

        opsBox!.put(object);
      }
      return true;
    } catch (e) {
      print(' ---Error------- $e');
      return false;
    }
  }

  static Future<bool> writeBoxExploitationChargeExploitationObject(
      List<ExploitationChargeExploitationObject> dataEce) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    print('data_ece count: ${dataEce.length}');
    try {
      //if (exploitationChargeExploitationBox!.isEmpty()) {
      for (ExploitationChargeExploitationObject item in dataEce) {
        print(
            '${item.id} --- ${item.chargeexploitationname}  --- ${item.unite} ');
        print(item.toJson());

        ExploitationChargeExploitationObject object =
            ExploitationChargeExploitationObject(
          id: 0,
          exploitationchargeexploitationid:
              int.parse(item.exploitationchargeexploitationid.toString()),
          unite: item.unite,
          date: DateTime.parse(item.date.toString()),
          pu: double.parse(item.pu.toString()),
          quantite: double.parse(item.quantite.toString()),
          valeur: double.parse(item.valeur.toString()),
          observation: item.observation,
          chargeexploitationid: int.parse(item.chargeexploitationid.toString()),
          chargeexploitationname: item.chargeexploitationname,
          typechargeexploitationid:
              int.parse(item.typechargeexploitationid.toString()),
          typechargeexploitationname: item.typechargeexploitationname,
          famillechargeexploitationid:
              int.parse(item.famillechargeexploitationid.toString()),
          famillechargeexploitationname: item.famillechargeexploitationname,
          exploitationid: int.parse(item.exploitationid.toString()),
        );

        exploitationChargeExploitationBox!.put(object);
      }
      //} else {
      //print('------------------- EXPLOITATIONS LODED----------------------');
      //}
      return true;
    } catch (e) {
      print(' ---Error------- $e');
      return false;
    }
  }

  static Future<bool> writeBoxUserOps(List<UserOpObject> data) async {
    try {
      exploitationChargeExploitationBox?.removeAll();
      exploitationsBox?.removeAll();
      producteurBox?.removeAll();
      userOpBox?.removeAll();
      print('Avant write userOpBox: ${userOpBox!.count()}');
      print('------------------- USER OPS LODING----------------------');
      Constants.opIdList = [];
      for (UserOpObject item in data) {
        // print('${item.id.toString()}  ------  ${item.opid.toString()}  ----- ${item.opname.toString()}');
        UserOpObject useropObject = UserOpObject(
            id: item.id,
            userid: item.userid,
            typeopid: item.typeopid,
            typeopname: item.typeopname,
            opid: item.opid,
            opname: item.opname);
        userOpBox!.put(useropObject);
        Constants.opIdList.add(item.opid);
        //getProducteurData(item.id);
      }
      print(Constants.opIdList);
      getArrayProducteursData(Constants.opIdList);
      // print('Apres write userOpBox: ${userOpBox!.count()}');
      // getArrayOpsExploitationData(Constants.opIdList);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxUserUniteTransformations(
      List<UserUniteTransformationObject> data) async {
    try {
      //exploitationChargeExploitationBox?.removeAll();
      //exploitationsBox?.removeAll();
      //producteurBox?.removeAll();
      userUniteTransformationBox?.removeAll();
      print(
          'Avant write userUniteTransformationBox: ${userUniteTransformationBox!.count()}');
      print(
          '------------------- USER UNITE TRANSFORMATION LODING----------------------');

      Constants.uniteTransformationIdList = [];
      for (UserUniteTransformationObject item in data) {
        print(
            'xxxxxxx ${item.id.toString()}  ------  ${item.societename.toString()}  ----- ${item.unitetransformationname.toString()}');

        UserUniteTransformationObject userUniteTransformationObject =
            UserUniteTransformationObject(
                id: item.id,
                userid: item.userid,
                typeunitetransformationid: item.typeunitetransformationid,
                typeunitetransformationname: item.typeunitetransformationname,
                unitetransformationid: item.unitetransformationid,
                unitetransformationname: item.unitetransformationname,
                societeid: item.societeid,
                societename: item.societename);
        userUniteTransformationBox!.put(userUniteTransformationObject);

        Constants.uniteTransformationIdList.add(item.unitetransformationid);
        //getProducteurData(item.id);
      }
      print(Constants.uniteTransformationIdList);
      print(
          'Apres write userUniteTransformationBox: ${userUniteTransformationBox!.count()}');

      //
      //
      // getArrayUniteTransformationsEtapeData(Constants.uniteTransformationIdList);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxUserPoints(List<UserPointObject> data) async {
    try {
      userPointBox?.removeAll();
      print('Avant write userPointBox: ${userPointBox!.count()}');
      print(
          '------------------- USER POINT COLLECTE LODING----------------------');

      Constants.pointnIdList = [];
      for (UserPointObject item in data) {
        print(
            'xxxxxxx ${item.id.toString()}   ----- ${item.pointname.toString()}');

        UserPointObject userPointObject = UserPointObject(
            id: item.id,
            userid: item.userid,
            pointid: item.pointid,
            pointname: item.pointname);
        userPointBox!.put(userPointObject);

        Constants.pointnIdList.add(item.pointid);
        //getProducteurData(item.id);
      }
      Constants.utilisateurObject['point_collecte_id'] = data.first.pointid;
      Constants.utilisateurObject['point_collecte_name'] = data.first.pointname;
      print(Constants.pointnIdList);
      print('Apres write userPointBox: ${userPointBox!.count()}');

      //getArrayMagasinsByPointsData(Constants.uniteTransformationIdList);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> writeBoxProducteurObject(
      List<ProducteurObject> datap) async {
    // await Future<String>.delayed(const Duration(seconds: 5));
    try {
      print('Avant write producteurBox: ${producteurBox!.count()}');
      print('------------------- PRODUCTEURS LODING----------------------');
      for (ProducteurObject item in datap) {
        //print(item);
        ProducteurObject object = ProducteurObject(
            id: item.id,
            prenom: item.prenom,
            nom: item.nom,
            cni: item.cni,
            email: item.email,
            telephone: item.telephone,
            adresse: item.adresse,
            opid: int.parse(item.opid.toString()),
            opname: item.opname,
            typeopid: int.parse(item.typeopid.toString()),
            typeopname: item.typeopname,
            is_actif: item.is_actif.toString() == 'true' ? true : false);
        producteurBox!.put(object);
      }

      return true;
    } catch (e) {
      print(' ---Error------- $e');
      return false;
    }
  }

  static Future<bool> writeBoxTypeTransformation(
      List<TypeTransformationObject> data) async {
    try {
      typeTransformationBox?.removeAll();
      print(
          'Avant write typeTransformationBox: ${typeTransformationBox!.count()}');
      print('------------------- ANNEES LODING----------------------');
      for (TypeTransformationObject item in data) {
        print(
            '${item.id.toString()}  ------  ${item.filierename.toString()}  ----- ${item.name.toString()}');
        TypeTransformationObject typeTransformationObject =
            TypeTransformationObject(
                id: item.id,
                name: item.name,
                produitopid: item.produitopid,
                produitname: item.produitname,
                filiereid: item.filiereid,
                filierename: item.filierename);
        typeTransformationBox!.put(typeTransformationObject);
      }
      //} else {
      //print('------------------- ANNEES LODED----------------------');
      //}
      print(
          'Apres write typeTransformationBox: ${typeTransformationBox!.count()}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> createX() async {
    var dir = await getApplicationDocumentsDirectory();
    print('CREATION DB ' + dir.path + '/' + Constants.nameDB);
    final store = Store(getObjectBoxModel(),
        directory: '${dir.path}/${Constants.nameDB}/');
    return ObjectBox._create(store);
  }

  static Future<ObjectBox> create(String nameDB) async {
    // Obtenez le répertoire de stockage local de l'application
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    // Créez un nom de fichier basé sur le nom de la liste de tâches
    String dbFileName = "${nameDB.toLowerCase()}.obx";
    // Définissez le chemin de la base de données en fonction du nom de fichier
    String dbPath = "${appDocumentDir.path}/$dbFileName";
    // Initialisez ObjectBox avec le chemin de la base de données
    //- return Store(getObjectBoxModel(), directory: dbPath);
    final store = Store(getObjectBoxModel(), directory: dbPath);

    return ObjectBox._create(store);
  }

  static Future<ObjectBox?> createZ(String nameDB) async {
    // Obtenez le répertoire de stockage local de l'application
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    // Créez un nom de fichier basé sur le nom de la liste de tâches
    String dbFileName = "${nameDB.toLowerCase()}.obx";
    // Définissez le chemin de la base de données en fonction du nom de fichier
    String dbPath = "${appDocumentDir.path}/$dbFileName";

    // Vérifie si le répertoire de la base de données existe déjà
    Directory dbDir = Directory(dbPath);
    if (await dbDir.exists()) {
      print("La base de données existe déjà.");
      // Peut-être renvoyer une instance déjà existante ici
      // Ou simplement retourner null pour indiquer que la base de données existe déjà
      return null;
    } else {
      print("La base de données n'existe pas encore. Création en cours...");
      // Initialisez ObjectBox avec le chemin de la base de données
      final store = Store(getObjectBoxModel(), directory: dbPath);
      return ObjectBox._create(store);
    }
  }

  static Future<Store> initializeObjectBox(String nameDB) async {
    // Obtenez le répertoire de stockage local de l'application
    Directory appDocumentDir = await getApplicationDocumentsDirectory();

    // Créez un nom de fichier basé sur le nom de la liste de tâches
    String dbFileName = "${nameDB.toLowerCase()}.obx";

    // Définissez le chemin de la base de données en fonction du nom de fichier
    String dbPath = "${appDocumentDir.path}/$dbFileName";

    // Initialisez ObjectBox avec le chemin de la base de données
    return Store(getObjectBoxModel(), directory: dbPath);
  }

  static Future<ObjectBox> close() async {
    var dir = await getApplicationDocumentsDirectory();
    //final store = Store(getObjectBoxModel(),directory: '${dir.path}/${Constants.nameDB}/');
    print('FERMETURE DB ' + dir.path + '/' + Constants.nameDB);
    return ObjectBox.close();
  }

  static Future<bool> storeExists(String nameDB) async {
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    String dbFileName = "${nameDB.toLowerCase()}.obx";
    String dbPath = "${appDocumentDir.path}/$dbFileName";
    Directory dbDir = Directory(dbPath);
    return dbDir.exists();
  }

  static Future<bool> databaseExists(String nameDB) async {
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    String dbFileName = "${nameDB.toLowerCase()}.obx";
    String dbPath = "${appDocumentDir.path}/$dbFileName";
    File dbFileData = File("$dbPath/data.mdb");
    return dbFileData.exists();
  }

  static Future<List<FileSystemEntity>> listFilesInDatabaseDirectory(
      String nameDB) async {
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    String dbFileName = "${nameDB.toLowerCase()}.obx";
    String dbPath = "${appDocumentDir.path}/$dbFileName";
    Directory dbDir = Directory(dbPath);
    return dbDir.listSync();
  }

  void deleteDbFiles() async {
    var dir = await getApplicationDocumentsDirectory();
    Directory('${dir.path}/${Constants.nameDB}/').delete();
  }

  static sumAllExploitationItems(int idExploitation) {
    final exploitationChargeExploitationBox =
        ObjectBox.exploitationChargeExploitationBox;
    final builder = exploitationChargeExploitationBox!.query(
        ExploitationChargeExploitationObject_.exploitationid
            .equals(idExploitation));
    final query = builder.build();
    final mesExploitationChargeExploitationBox = query.find();
    double sum = mesExploitationChargeExploitationBox.fold(
        0, (sum, element) => sum.toDouble() + element.valeur);
    return sum;
  }
}

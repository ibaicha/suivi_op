import 'dart:async';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_pro/dropdown_item.dart';

import '../../features/auth/data/model/user.dart';
import '../../features/auth/data/model/utilisateur.dart';
import '../../objectbox.g.dart';
import '../data/model/ObjectBox/objectBoxModels.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../data/service/ObjectBoxHelper.dart';

class Constants {
  static const String appName = "Ges" + "'" + "Op";
  static const String logoTag = 'near.huscarl.loginsample.logo';
  static const String titleTag = 'near.huscarl.loginsample.title';

  static String url = '';
  static String statutConnect = '';

  static late ConnectivityResult result;
  static late StreamSubscription subscription;
  static var isConnect = false;

  static String? retourLog = null;

  // static String baseUrl = 'http://192.168.1.33:8080';
  // static String baseUrl = 'http://192.168.1.2:8080';
  // static String baseUrl = 'http://192.168.1.26:3000';
  // static String baseUrl = 'http://172.20.10.2:8080';
  // static String baseUrl = 'https://api-git-vercel.vercel.app';
  static String baseUrl = 'http://172.16.1.127:3000';
  // static String baseUrl = 'http://172.16.1.137:3000';mouh
  // static String baseUrl = 'http://169.254.81.165:3000';
  // static String baseUrl = 'http://127.0.0.1:3000';
  // static String baseUrl = 'http://localhost:8080';
  // static String baseUrl = 'http://localhost:8000';
  // static String baseUrl = 'https://6258-41-82-235-162.eu.ngrok.io';
  // static String baseUrl = 'https://e25a-41-82-235-162.ngrok-free.app';
  // static String baseUrl = 'http://192.168.43.148:8080';

  //static String loginEndpoint = '/auth/user-token/';

  ///************************  API  *********************/
  static String loginEndpoint = '/auth/signin';

  static String Mxallposts = '/posts/';
  static String Mxallcomments = '/comments/';

  static String Mxalltypechargeexploitation = '/typeChargeExploitations/';
  static String Mxallfamillechargeexploitation = '/familleChargeExploitations/';
  static String Mxallchargeexploitations = '/chargeExploitations/';
  static String Mxallproduitchargeexploitations =
      '/produitChargeExploitations/';
  static String Mxallexploitations = '/exploitations/all';
  static String Mxallexploitationchargeexploitations =
      '/exploitationChargeExploitations/';
  static String MxallexploitationchargeexploitationsByExploitationId =
      '/exploitationChargeExploitations/exploitationId/';
  static String Mxallfilieres = '/filieres/';
  static String Mxallfamilleemplacements = '/familleEmplacements/';
  static String Mxallproduits = '/produits/';
  static String Mxallvarietes = '/varietes/';
  static String Mxallannees = '/annees/';
  static String Mxallsaisons = '/saisons/';
  static String Mxallcampagnes = '/campagnes/';
  static String Mxallpays = '/pays/';
  static String Mxallzones = '/zones/';
  static String Mxallsouszones = '/sous_zones/';
  static String Mxalllocalites = '/localites/';
  static String Mxallvillages = '/villages/';
  static String Mxallpoints = '/points/';
  static String Mxalltypeops = '/type-ops/';
  static String Mxallops = '/ops/all';
  static String Mxallproducteurs = '/producteurs/';
  static String Mxalltypeemballages = '/type_emballages/';
  static String Mxalltypeunitegrandeurs = '/type_unite_grandeurs/';
  static String Mxallunitegrandeurs = '/unite_grandeurs/';
  static String Mxallemballages = '/emballages/';
  static String Mxalluserops = '/userOps/';
  static String Mxalluserpoints = '/userPoints/';
  static String Mxallrecoltes = '/recoltes/';
  static String MxmanyrecoltesByExploitationId = '/recoltes/exploitationId/';
  static String MxmanycreditsByExploitationId = '/credits/exploitationId/';
  static String MxmanyremboursementsByExploitationId =
      '/remboursements/exploitationId/';

  static String Mxalltypemouvementstocks = '/typeMouvementStocks/';
  static String Mxallmodeentreesortiestocks = '/modeEntreeSortieStocks/';
  static String Mxallmouvementstocks = '/mouvementStocks/';
  static String Mxallunitetransformations = '/uniteTransformations/';
  static String Mxallentrepots = '/entrepots/';
  static String Mxallemplacements = '/emplacements/';

  ///************************* END API  *********************/

  static String allUsersEndpoint = '/api/authentication/users/get/';

  static String allExploitationsEndpoint =
      '/api/exploitations/getexploitations';
  static String ExploitationsByOpEndpoint =
      '/api/exploitation/op_exploitations/get_opid/';

  static String ExploitationsByIdEndpoint =
      '/api/exploitation/exploitations/get/';

  static String ExploitationChargeExploitationsByOpEndpoint =
      '/api/exploitation/exploitation_charge_exploitations/get_exploitationid/';

  static String allpointservices = '/api/point_services/allpointservices';
  static String allfamillechargeexploitation =
      '/api/exploitation/famille_charge_exploitations/get/';
  static String alltypechargeexploitation =
      '/api/exploitation/type_charge_exploitations/get/';
  static String alltypeops = '/api/op/type_ops/get/';
  static int idOp = 0;
  static String specificop = '/api/ops/$idOp/getidop';

  static int opByuser = 1;
  static List<MxExploitationObject> mesExploitations = [];

  /// **************** CONSTANTE *********************/
  static String allsaisons = '/api/constante/saisons/get/';
  static String allannees = '/api/constante/annees/get/';
  static String allcampagnes = '/api/constante/campagnes/get/';
  static String allemballages = '/api/constante/emballages/get/';

  /// **************** CONSTFILIEREANTE *********************/
  static String allfilieres = '/api/filiere/filieres/get/';
  static String allproduits = '/api/filiere/produits/get/';
  static String allvarietes = '/api/filiere/joinvarietes/get/';

  static String alltypetransformation = '/api/unite/type_transformations/get/';

  static String allchargeexploitations =
      '/api/exploitation/join_charge_exploitation/get/';
  static String allexploitations = '/api/exploitation/exploitations/get/';
  static String allexploitationschargeexploitation =
      '/api/exploitation/exploitation_charge_exploitations/get/';
  static int idUser = 0;
  static String specificuser = '/api/users/$idUser/specific';
  static String user_groups = '/api/account/user_groups/get_userid/';
  static String user_ops = '/api/account/user_ops/get_userid/';
  static String user_unite_transformations =
      '/api/account/user_unite_transformations/get_userid/';
  static String user_point_collectes =
      '/api/account/user_points_collectes/get_userid/';

  static String magasins_by_point = '/api/fiancement/pointmagasin/get_pointid/';

  static String allproducteursOp = '/api/op/op_producteurs/get_opid/';

  static int idProducteur = 0;
  static String oneproducteur =
      '/api/producteurs/getopproducteur/$idProducteur';

  static int idExploitation = 0;
  static String allExploitationschargeexploitation =
      '/api/exploitation/exploitation_charge_exploitations/get_exploitationid/';

  static List<int> ListInt = [1, 3];
  // static String arrayproducteurexploitations= '/api/exploitationproducteurs/getArrayProducteurExploitationsProducteur/${producteurIdList}';
  static String arrayproducteurexploitations =
      '/api/exploitationproducteurs/getArrayProducteurExploitationsProducteur/$ListInt';

  static String arrayopexploitations =
      '/api/exploitation/op_exploitations/get_opid/';

  static String allProducteurExploitations =
      '/api/exploitationproducteurs/getIDProducteurExploitationsProducteur/';

  static bool admin = false;
  static bool maintenance = false;

  static List<int> opIdList = [];
  static List<int> uniteTransformationIdList = [];
  static List<int> pointnIdList = [];
  static List<int> producteurIdList = [];
  static List<int> exploitationIdList = [];
  static List<GroupObject>? groups = [];

  static String singleSelectedVarieteId_ = '';
  static String singleSelectedVarieteName_ = '';

  static String singleSelectedSaisonId_ = '';
  static String singleSelectedSaisonName_ = '';

  static String singleSelectedAnneeId_ = '';
  static String singleSelectedAnneeName_ = '';

  static var listeEmballage = new Map();

  static String singleSelectedEmballageId_ = '';
  static String singleSelectedEmballageName_ = '';

  static String refresh = '';
  static String access = '';
  static String token = '';

  // static String nameDB = 'DbObjectBox';
  static String nameDB = '';
  static bool isRecentlyCreatedDB = false;

  static int nb_page = 0;
  static int num_page = 0;

  static var utilisateur = Utilisateur(
      id: 0,
      token: '',
      email: '',
      password: '',
      firstname: '',
      lastname: '',
      role: '');
  static int idProduit = 0;

  static var campagneObject = MxCampagneObject(
    id: 0,
    annee: MxAnneeObject(
      id: 0,
      name: "",
      valeur: 0,
    ).toJson(),
    saison: MxSaisonObject(
      id: 0,
      name: "",
      description: "",
    ).toJson(),
  );

  static UserObject utilisateurObject1 = UserObject(
    id: 0,
    token: '',
    refresh: '',
    access: '',
    email: '',
    password: '',
    firstname: '',
    lastname: '',
    op_id: 0,
    op_name: '',
    sous_zone_id: 0,
    sous_zone_name: '',
    zone_id: 0,
    zone_name: '',
    point_id: 0,
    point_name: '',
  );

  static Map<String, dynamic> utilisateurObject = {
    'id': 0,
    'token': '',
    'email': '',
    'username': '',
    'password': '',
    'firstname': '',
    'lastname': '',
    'phone': '',
    'address': '',
    'roleId': 0,
    'roleName': '',
    'opId': 0,
    'opName': '',
    'sousZoneId': 0,
    'sousZoneName': '',
    'zoneId': 0,
    'zoneName': '',
    'pointId': 0,
    'pointName': '',
  };

  static UserConnexion userConnexion = UserConnexion(
      id: 0,
      refresh: '',
      access: '',
      token: '',
      email: '',
      username: '',
      password: '',
      firstname: '',
      lastname: '',
      role: '',
      groups: []);

  static MxUserObject mxUserObject = MxUserObject(
      id: 0,
      token: '',
      email: '',
      username: '',
      password: '',
      firstname: '',
      lastname: '',
      phone: '',
      address: '',
      roleId: 0,
      roleName: '');

  static var mxExploitationObject = MxExploitationObject.fromJson({
    'id': 0,
    'compte': 0,
    'date': DateTime.now(),
    'unite': '',
    'surface': 0,
    'pu': 0,
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now()
  });

  static var mxExploitationObject1 = MxExploitationObject(
      id: 0,
      compte: 0,
      date: DateTime.now(),
      unite: '',
      surface: 0,
      //production: 0,
      //pu: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  static var exploitationObject = ExploitationObject(
    id: 0,
    date: DateTime.now(),
    producteurid: 0,
    prenom: '',
    nom: '',
    opid: 0,
    opname: '',
    typeopid: 0,
    typeopname: '',
    exploitation_id: 0,
    compte: 0,
    unite: '',
    surface_prevision: 0,
    production_prevision: 0,
    pu_prevision: 0,
    varieteprevisionid: 0,
    varieteprevisionname: '',
    varietepu: 0,
    surface: 0,
    production: 0,
    pu: 0,
    filiereid: 0,
    filierename: '',
    produitid: 0,
    produitname: '',
    varieteid: 0,
    varietename: '',
    saisonid: 0,
    saisonname: '',
    emballageid: 0,
    emballagename: '',
    emballagequantite: 0,
    emballagepu: 0,
    emballagetypeemballageid: 0,
    emballagetypeemballagename: '',
    emballageunitegrandeurid: 0,
    emballageunitegrandeurname: '',
    emballageunitevaleurreference: 0,
    anneeid: 0,
    anneename: '',
  );

  static String compte = "";

  //static List<UserOpObject> userOpsList = [];

  static List<DropdownItem> itemAnneesList = [];
  static String singleSelectedAnneeId = "";
  static List<String> listStringAnneeId = [];
  static List<String> listStringProducteurId = [];
  static final List<DropdownItem> _itemSaisonsList = [];
  static const String _singleSelectedSaisonId = "";
  static List<DropdownItem> itemVarietesList = [];

  static String singleSelectedVarieteId = "";
  static List<String> listStringVarieteId = [];
  static List<String> listStringSaisonId = [];
  static final List<DropdownItem> _itemProducteursList = [];
  static const String _singleSelectedProducteurId = "";
  static final List<String> _mutiSelectedProducteursIds = [];

  static bool ActiveConnection = false;
  static String T = "";

  static StreamSubscription? connection;
  static bool isoffline = false;
  static String typeConnexion = '';

  static dynamic getListMap(List<dynamic> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> list = [];
    for (var element in items) {
      list.add(element.toMap());
    }
    return list;
  }

  static double totalChargesUsuelles(int idExploitation) {
    double total = 0;

    final mxexploitationChargeExploitationObjectBox =
        ObjectBox.mxexploitationChargeExploitationObjectBox;

    final builder = mxexploitationChargeExploitationObjectBox!.query(
        MxExploitationChargeExploitationObject_.mxexploitation
            .equals(idExploitation));
    final query = builder.build();
    List<MxExploitationChargeExploitationObject?>
        mesExploitationChargeExploitationBox = query.find();

    for (final entity in mesExploitationChargeExploitationBox) {
      if (entity!.mxchargeexploitationObject.target!
              .mxfamilleChargeExploitationObject.target!.id ==
          1) {
        total += entity!.quantite * entity!.pu;
      }
    }

    print('Total : $total');

    // Nettoyage des ressources
    query.close();

    return total;
  }

  static double totalChargesExeptionnelles(int idExploitation) {
    double total = 0;

    final mxexploitationChargeExploitationObjectBox =
        ObjectBox.mxexploitationChargeExploitationObjectBox;

    final builder = mxexploitationChargeExploitationObjectBox!.query(
        MxExploitationChargeExploitationObject_.mxexploitation
            .equals(idExploitation));
    final query = builder.build();
    List<MxExploitationChargeExploitationObject?>
        mesExploitationChargeExploitationBox = query.find();

    for (final entity in mesExploitationChargeExploitationBox) {
      if (entity!.mxchargeexploitationObject.target!
              .mxfamilleChargeExploitationObject.target!.id ==
          2) {
        total += entity!.quantite * entity!.pu;
      }
    }

    print('Total : $total');

    // Nettoyage des ressources
    query.close();

    return total;
  }

  static double totalCharges(int idExploitation) {
    double total = 0;

    final mxexploitationChargeExploitationObjectBox =
        ObjectBox.mxexploitationChargeExploitationObjectBox;

    final builder = mxexploitationChargeExploitationObjectBox!.query(
        MxExploitationChargeExploitationObject_.mxexploitation
            .equals(idExploitation));
    final query = builder.build();
    List<MxExploitationChargeExploitationObject?>
        mesExploitationChargeExploitationBox = query.find();

    for (final entity in mesExploitationChargeExploitationBox) {
      total += entity!.quantite * entity!.pu;
    }

    print('Total Charges : $total');

    // Nettoyage des ressources
    query.close();

    return total;
  }

  static double totalCredits(int idExploitation) {
    double total = 0;

    final mxcreditsBox = ObjectBox.mxcreditsBox;

    final builder = mxcreditsBox!
        .query(MxCreditObject_.mxExploitationObject.equals(idExploitation));
    final query = builder.build();
    List<MxCreditObject?> mesCreditsExploitationBox = query.find();

    mesCreditsExploitationBox.forEach((element) {
      print(element!.toJson());
    });

    for (final entity in mesCreditsExploitationBox) {
      total += entity!.capital +
          entity!.interet +
          entity!.moratoire +
          entity!.autres_engagements;
    }

    print('Total Crédits : $total');

    // Nettoyage des ressources
    query.close();

    return total;
  }

  static double totalRemboursements(int idExploitation) {
    double total = 0;

    final mxremboursementObjectBox = ObjectBox.mxremboursementsBox;

    final builder = mxremboursementObjectBox!.query(
        MxRemboursementObject_.mxExploitationObject.equals(idExploitation));
    final query = builder.build();
    List<MxRemboursementObject?> mesRemboursementsBox = query.find();

    for (final entity in mesRemboursementsBox) {
      total += entity!.nombre_unite * entity!.pu;
    }

    print('Total Remboursements : $total');

    // Nettoyage des ressources
    query.close();

    return total;
  }

  static double totalRecoltes(int idExploitation) {
    double total = 0;

    final mxrecoltesObjectBox = ObjectBox.mxrecoltesBox;

    final builder = mxrecoltesObjectBox!
        .query(MxRecolteObject_.mxExploitationObject.equals(idExploitation));
    final query = builder.build();
    List<MxRecolteObject?> mesRecoltesBox = query.find();

    for (final entity in mesRecoltesBox) {
      total += entity!.nombre_unite * entity!.pu;
    }

    print('Total Recoltes : $total');

    // Nettoyage des ressources
    query.close();

    return total;
  }

  static String formatCurrencyUS(double amount,
      {String locale = 'en_US', String currency = 'USD'}) {
    final format =
        NumberFormat.currency(locale: locale, symbol: '', name: currency);
    return format.format(amount);
  }

  static String formatCurrencyFCFA(double amount,
      {String locale = 'fr_FR', String currency = 'XOF'}) {
    final format =
        NumberFormat.currency(locale: locale, symbol: 'FCFA', name: currency);
    return format.format(amount);
  }

  static String formatNumber(double nombre) {
    if (nombre == nombre.toInt()) {
      return nombre
          .toInt()
          .toString(); // Convertit en entier si c'est un nombre entier
    } else {
      return nombre
          .toString(); // Conserve les décimales si ce n'est pas un entier
    }
  }
}





/*
makeDb(String name) {
  name = name.replaceAll('@', '').replaceAll('.', '');
  // name = name.replaceAll(RegExp('.'), '')async ;
  return "db$name";
}

makePath() async {
  var dir = await getApplicationDocumentsDirectory();
  var path = '${dir.path}/${ApiConstants.nameDB}/';
  return path.toString();
}
*/

import 'dart:io';
import 'dart:convert';
import '/objectbox.g.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../core/res/constants.dart';
import '../model/user.dart';

class ApiService {
  Future<UserConnexion?> signInWithEmailAndPassword(
      String email, String password) async {
    late UserConnexion user = UserConnexion(
        id: 0,
        refresh: '',
        access: '',
        token: '',
        email: '',
        username: 'iba',
        password: '',
        firstname: '',
        lastname: '',
        role: '',
        groups: []);

    try {
      //-var dir = await getApplicationDocumentsDirectory();
      //-print("dir ===??? $dir");
      Constants.nameDB = '${email}';
      //-print(Constants.nameDB);
      Constants.nameDB = Constants.nameDB.replaceAll('@', '');
      Constants.nameDB = Constants.nameDB.replaceAll('.', '');

      //-bool storeExists = await ObjectBox.storeExists();
      bool databaseExists = await ObjectBox.databaseExists(Constants.nameDB);
      bool onLineIsOk = await InternetConnectionCheckerPlus().hasConnection;
      //-bool toCreateDBLocal = false;

      MxUserObject userLogin;
/* -
      if (storeExists == true) {
        print('ObjectBox exist');
        // VOIR USER LOGIN EXISTE
        toCreateDBLocal = false;
      }
      if (storeExists == false) {
        print('ObjectBox NOT exist');
        toCreateDBLocal = true;
      }
-*/

      if (databaseExists == false) {
        print('Create ObjectBox');
        print('Tester Connection internet');
        if (onLineIsOk == true) {
          print('Connection internet is OK');

          var url = Uri.parse(Constants.baseUrl + Constants.loginEndpoint);
          Constants.url = url.toString();
          final dio = Dio();

          final response = await dio.post('${url}',
              data: {
                'email': email,
                'password': password,
              },
              options: Options(
                headers: {'Content-type': 'application/json; charset=utf-8'},
              ));
          // print(' xxxx ' + response.statusCode.toString() + ' xxxx');

          if (response.statusCode == 201) {
            print(' xxxx user is Connected xxxx');
            Constants.statutConnect = '';
            Map<String, dynamic> data = response.data;
            //print(data);
            String role = data["user"]["role"]["name"];

            Constants.access = data["token"];
            Constants.refresh = data["token"]; 
            Constants.token = data["token"];

            /*
            user.id = data["user"]["id"];
            user.refresh = '';
            user.access = '';
            user.token = data["token"];
            user.email = data["user"]["email"];
            user.username = data["user"]["username"];
            user.password = password;
            user.firstname = data["user"]["profile"]["firstName"];
            user.lastname = data["user"]["profile"]["lastName"];
            user.role = data["user"]["role"]["name"];
            */

            Constants.mxUserObject.id = data["user"]["id"];
            Constants.mxUserObject.token = '';
            Constants.mxUserObject.email = data["user"]["email"];
            Constants.mxUserObject.username = data["user"]["username"];
            Constants.mxUserObject.password = password;
            Constants.mxUserObject.firstname =
                data["user"]["profile"]["firstName"];
            Constants.mxUserObject.lastname =
                data["user"]["profile"]["lastName"];
            Constants.mxUserObject.phone = data["user"]["profile"]["phone"];
            Constants.mxUserObject.address = data["user"]["profile"]["address"];
            Constants.mxUserObject.roleId = data["user"]["role"]["id"];
            Constants.mxUserObject.roleName = data["user"]["role"]["name"];

            List<dynamic> groups;

            if (role == 'Admin') {}
            if (role == 'Agence') {}
            if (role == 'Zone') {
              groups = data["user"]['userZones'];
            }
            if (role == 'Sous Zone') {
              groups = data["user"]['userSousZones'];

              for (int i = 0; i < groups.toList().length; i++) {
                GroupObject item = GroupObject(
                    id: groups.toList()[i]["sousZone"]["id"],
                    name: groups.toList()[i]["sousZone"]["name"]);
                Constants.groups!.add(item);
              }
            }
            if (role == 'Localite') {
              groups = data["user"]['userLocalites'];

              for (int i = 0; i < groups.toList().length; i++) {
                GroupObject item = GroupObject(
                    id: groups.toList()[i]["localite"]["id"],
                    name: groups.toList()[i]["localite"]["name"]);
                Constants.groups!.add(item);
              }
            }
            if (role == 'Point') {
              groups = data["user"]['userPoints'];
              for (int i = 0; i < groups.toList().length; i++) {
                GroupObject item = GroupObject(
                    id: groups.toList()[i]["point"]["id"],
                    name: groups.toList()[i]["point"]["name"]);
                Constants.groups!.add(item);
              }
            }
            if (role == 'Societe') {
              groups = data["user"]['userSocietes'];
              for (int i = 0; i < groups.toList().length; i++) {
                GroupObject item = GroupObject(
                    id: groups.toList()[i]["societe"]["id"],
                    name: groups.toList()[i]["societe"]["name"]);
                Constants.groups!.add(item);
              }
            }
            if (role == 'Op') {
              groups = data["user"]['userOps'];

              for (int i = 0; i < groups.toList().length; i++) {
                print(user.role + ' xxx ' + i.toString() + ' xxx');
                print(groups.toList()[i]);

                GroupObject item = GroupObject(
                    id: groups.toList()[i]["op"]["id"],
                    name: groups.toList()[i]["op"]["name"]);
                Constants.groups!.add(item);
              }
            }

            for (var element in Constants.groups!) {
              print(element.name);
            }
            await ObjectBox.create(Constants.nameDB);
            await ObjectBox.loadDatas();
            // Liste des fichiers dans le répertoire de la base de données
            List<FileSystemEntity> files =
                await ObjectBox.listFilesInDatabaseDirectory(Constants.nameDB);

            print(
                "Liste des fichiers dans le répertoire de la base de données :");
            for (var file in files) {
              print(file.path);
            }

            // await apiService.getRecordsObjectBox();
          } else {
            print(' xxxx user is Connected xxxx');
          }
        } else {
          print('Connection internet is NOT OK');
        }
      } else {
        await ObjectBox.create(Constants.nameDB);
      }

      userLogin = await getOneUser(email, password);
      print(userLogin.toJson());
      if (userLogin.id != 0) {
        print('User found with id: ${userLogin.id}');
        //- toCreateDBLocal = false;

        user.id = userLogin.id;
        user.refresh = '';
        user.access = userLogin.token;
        user.token = userLogin.token;
        user.email = userLogin.email;
        user.username = userLogin.username;
        user.password = userLogin.password;
        user.firstname = userLogin.firstname;
        user.lastname = userLogin.lastname;
        user.role = userLogin.roleName;
        user.role = userLogin.roleName;

        Constants.userConnexion.id = userLogin.id;
        Constants.userConnexion.refresh = '';
        Constants.userConnexion.access = userLogin.token;
        Constants.userConnexion.token = userLogin.token;
        Constants.userConnexion.email = userLogin.email;
        Constants.userConnexion.username = userLogin.username;
        Constants.userConnexion.password = password;
        Constants.userConnexion.firstname = userLogin.firstname;
        Constants.userConnexion.lastname = userLogin.lastname;
        Constants.userConnexion.role = userLogin.roleName;

        Constants.mxUserObject.id = userLogin.id;
        Constants.mxUserObject.token = userLogin.token;
        Constants.mxUserObject.email = userLogin.email;
        Constants.mxUserObject.username = userLogin.username;
        Constants.mxUserObject.password = password;
        Constants.mxUserObject.firstname = userLogin.firstname;
        Constants.mxUserObject.lastname = userLogin.lastname;
        Constants.mxUserObject.phone = userLogin.phone;
        Constants.mxUserObject.address = userLogin.address;
        Constants.mxUserObject.roleId = userLogin.roleId;
        Constants.mxUserObject.roleName = userLogin.roleName;

        String role = userLogin.roleName;

        final mxuserPermissionBox = ObjectBox.mxuserPermissionBox;
        final builder = mxuserPermissionBox!
            .query(MxUserPermissionObject_.mxuserObject.equals(userLogin.id));
        final query = builder.build();
        final mesUserPermissions = query.find();

        if (role == 'Admin') {}
        if (role == 'Agence') {}
        if (role == 'Zone') {}
        if (role == 'Sous Zone') {}
        if (role == 'Localite') {}
        if (role == 'Point') {}
        if (role == 'Societe') {}
        if (role == 'Op') {
          mesUserPermissions.forEach((element) {
            GroupObject item = GroupObject(id: element.id, name: element.name);
            Constants.groups!.add(item);
          });
        }

        return user;
      } else {
        print('User not found');
        //toCreateDBLocal = true;
      }
      // print(user.toMap());
      return user;
    } catch (e) {
      print('mon message erreur: ${e}');
      Constants.statutConnect = '${e}';
      return user;
    }
  }

  getUserGroups(int user_id) async {
    try {
      var url = Uri.parse(
          Constants.baseUrl + Constants.user_groups + user_id.toString() + '/');
      //print(url);
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${Constants.access}",
      });
      //print('Constants.access: ${Constants.access}');
      List jsonResponse = await json.decode(res.body);
      //print(jsonResponse[0]['groups']);
      List<dynamic> data = await jsonResponse[0]['groups']
          .map((e) => GroupObject.fromJson(e))
          .toList();
      // print('------- Info data groups: ${data}');
      Constants.groups = [];

      for (var element in data) {
        //data.forEach((element) {
        GroupObject item = GroupObject(id: element.id, name: element.name);
        // print('item' + item.toJson().toString());
        Constants.groups!.add(item);
      }
      /*
      Constants.groups?.forEach((element) {
       ('element' + element.toJson().toString());
      });
      */
      //return data;
    } catch (e) {
      print('--Error getUserGroups -- $e');
      //return null;
    }
  }

  getRecordsObjectBox() async {
    print('------------------- UTILISATEUR --------------------');
    print(Constants.mxUserObject.toJson());
    print('------------------- LISTES DES USERS --------------------');
    final mxuserBox = ObjectBox.mxuserBox;
    var mesUsers = mxuserBox?.getAll();

    mesUsers?.forEach((element) {
      print(element.toJson());
      //print('User ---id: ${element.id} --nom: ${element.email} -- firstname: ${element.firstname} --lastname: ${element.lastname}  --password: ${element.password}');

      final mxuserPermissionBox = ObjectBox.mxuserPermissionBox;
      //var mesUserPermissions = mxuserPermissionBox?.getAll();
      //var query = mxuserPermissionBox?.query().link(MxUserPermissionObject_.mxUserObject);

      //final query = boxBook.query().link(Book_.author).equals(authorId).build();

      final builder = mxuserPermissionBox!
          .query(MxUserPermissionObject_.mxuserObject.equals(element.id));
      final query = builder.build();
      final mesUserPermissions = query.find();

      mesUserPermissions.forEach((element) {
        print(element.toJson());
        //print('------ Permissions ---id: ${element.id} --email: ${element.name} -- user: ${element.mxuserObject.target!.firstname} - ${element.mxuserObject.target!.lastname}');
      });
    });

    print('------------------- LISTES DES PAYS --------------------');
    final mxpaysBox = ObjectBox.mxpaysBox;
    var mesPays = mxpaysBox?.getAll();
    mesPays?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name} ---------- ${element.sigle} ');
    });

    print('------------------- LISTES DES ZONES --------------------');
    final mxzonesBox = ObjectBox.mxzonesBox;
    var mesZones = mxzonesBox?.getAll();
    mesZones?.forEach((element) {
      print(element.toJson());
      // print( 'ObjectBox ----------- ${element.id} --------  ${element.name} ----------   ${element.mxPaysObject.target!.name} ');
    });

    print('------------------- LISTES DES SOUS ZONES --------------------');
    final mxsouszonesBox = ObjectBox.mxsouszonesBox;
    var mesSousZones = mxsouszonesBox?.getAll();
    mesSousZones?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} ----  ${element.name} -----   ${element.mxZoneObject.target!.name} ----------   ${element.mxZoneObject.target!.mxPaysObject.target!.name} ');
    });

    print('------------------- LISTES LOCALITES --------------------');
    final mxlocalitesBox = ObjectBox.mxlocalitesBox;
    var mesLocalites = mxlocalitesBox?.getAll();
    mesLocalites?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} ----  ${element.name} -----   ${element.mxSousZoneObject.target!.name}  ');
    });
    print('------------------- LISTES VILLLAGES --------------------');
    final mxvillagesBox = ObjectBox.mxvillagesBox;
    var mesVillages = mxvillagesBox?.getAll();
    mesVillages?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} ----  ${element.name} -----   ${element.mxLocaliteObject.target!.name}  ');
    });

    print('------------------- LISTES POINT COLLECTES --------------------');
    final mxpointsBox = ObjectBox.mxpointsBox;
    var mesPointCollecte = mxpointsBox?.getAll();
    mesPointCollecte?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} ----  ${element.name} -----   ${element.mxLocaliteObject.target!.name}  ');
    });

    print('------------------- LISTES DES ANNEES --------------------');
    final mxanneesBox = ObjectBox.mxanneesBox;
    var mesAnnees = mxanneesBox?.getAll();
    mesAnnees?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name} ---------- ${element.valeur} ');
    });

    print('------------------- LISTES DES SAISONS --------------------');
    final mxsaisonsBox = ObjectBox.mxsaisonsBox;
    var mesSaisons = mxsaisonsBox?.getAll();
    mesSaisons?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name} ---------- ${element.description}');
    });

    print('------------------- LISTES DES CAMPAGNES --------------------');
    final mxcampagnesBox = ObjectBox.mxcampagnesBox;
    var mesCampagnes = mxcampagnesBox?.getAll();
    mesCampagnes?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name} ---------- ${element.description}');
    });

    print('------------------- LISTES DES TYPE OP --------------------');
    final typeopsBox = ObjectBox.mxtypeopsBox;
    List<MxTypeOpObject>? mesTypeOps = typeopsBox?.getAll();
    print('mesTypeOps: ${mesTypeOps?.length}');
    mesTypeOps?.forEach((typeOp) {
      //print(element.toJson());
      print('ObjectBox --------- ${typeOp.id} --------  ${typeOp.name} ');
    });

    print('------------------- LISTES OP --------------------');
    final opBox = ObjectBox.mxopsBox;
    List<MxOpObject>? mesOps = opBox?.getAll();
    mesOps?.forEach((op) {
      //print(elementop.toJson());
      print('OP N°: ${op.id} --name: ${op.name} ');

      final mxexploitationBox = ObjectBox.mxexploitationBox;

      Query<MxExploitationObject> exploitationQuery = mxexploitationBox!
          .query(MxExploitationObject_.mxopObject.equals(op.id))
          .build();
      List<MxExploitationObject> mesExploitations = exploitationQuery.find();

      mesExploitations!.forEach((elementExploitation) {
        print(
            '----> EXPLOITATION N°: ${elementExploitation.id} - ${elementExploitation.compte} - ${elementExploitation.unite}  - ${elementExploitation.surface}  ');

        final mxcreditsBox = ObjectBox.mxcreditsBox;
        var mesCredits = mxcreditsBox?.getAll();
        Query<MxCreditObject> queryCredit = mxcreditsBox!
            .query(MxCreditObject_.mxExploitationObject
                .equals(elementExploitation.id))
            .build();
        mesCredits = queryCredit.find();
        mesCredits!.forEach((elementCredit) {
          print(
              '----> CREDIT N°: ${elementCredit.id} - ${elementCredit.capital}- ${elementCredit.interet}  - ${elementCredit.autres_engagements} ');
        });
/*
        final mxrecoltesBox = ObjectBox.mxrecoltesBox;
        var mesRecoltes = mxrecoltesBox?.getAll();
        Query<MxRecolteObject> queryRecolte = mxrecoltesBox!
            .query(MxRecolteObject_.mxExploitationObject
                .equals(elementExploitation.id))
            .build();
        mesRecoltes = queryRecolte.find();
        mesRecoltes!.forEach((elementRecolte) {
          print(
              '----> RECOLTE N°: ${elementRecolte.id} - ${elementRecolte.nombre_unite}- ${elementRecolte.nombre_emballage}  - ${elementRecolte.pu} ');
        });
        */
      });
      /*    
      final mxexploitationBox = ObjectBox.mxexploitationBox;
      var mesExploitations = mxexploitationBox?.getAll();

      Query<MxExploitationObject> query = mxexploitationBox!
          .query(MxExploitationObject_.mxopObject.equals(elementop.id))
          .build();

      mesExploitations = query.find();

      mesExploitations!.forEach((elementExploitation) {
        print(
            '----> EXPLOITATION N°: ${elementExploitation.id} - ${elementExploitation.compte} - ${elementExploitation.unite} - ${elementExploitation.pu} - ${elementExploitation.surface} - ${elementExploitation.production} ');
      });*/
    });

    final mxproducteursBox = ObjectBox.mxproducteursBox;
    List<MxProducteurObject>? mesProducteurs = mxproducteursBox?.getAll();

    print('------------------- LISTES DES PRODUCTEURS --------------------');
    mesProducteurs?.forEach((producteur) {
      //print(elementProducteur.toJson());
      print(
          'PRODUCTEURS N°: ${producteur.id} --email: ${producteur.email} -- prenom: ${producteur.prenom}-${producteur.nom}');

      final mxexploitationBox = ObjectBox.mxexploitationBox;

      Query<MxExploitationObject> exploitationQuery = mxexploitationBox!
          .query(MxExploitationObject_.mxproducteurObject.equals(producteur.id))
          .build();
      List<MxExploitationObject> mesExploitations = exploitationQuery.find();

/*
      final mxexploitationBox = ObjectBox.mxexploitationBox;
      var mesExploitations = mxexploitationBox?.getAll();
*/

      mesExploitations!.forEach((elementExploitation) {
        print(
            '----> EXPLOITATION N°: ${elementExploitation.id} - ${elementExploitation.compte} - ${elementExploitation.unite} - ${elementExploitation.surface}  ');

/*
          final exploitationChargeExploitationBox =
              ObjectBox.exploitationChargeExploitationBox;
          var mesExploitationChargeExploitationBox =
              exploitationChargeExploitationBox?.getAll();
          mesExploitationChargeExploitationBox?.forEach((elementEce) {
            if (elementExploitation.exploitation_id ==
                elementEce.exploitationid) {
              print(
                  '------> ECE N°: ${elementEce.id}  - ${elementEce.exploitationid}- ${elementEce.date} - ${elementEce.valeur} - ${elementEce.pu} - ${elementEce.quantite} - ${elementEce.chargeexploitationid} - ${elementEce.chargeexploitationname}');
            }
          });
*/
      });
    });
/*
    print('------------------- LISTES PRODUCTEUR --------------------');
    final producteurBox = ObjectBox.mxproducteursBox;
    var mesProducteurs = producteurBox?.getAll();
    mesProducteurs?.forEach((element) {
      print(
          'ObjectBox ---- ${element.id} ---  ${element.prenom} ${element.nom} ------  ${element.mxOpObject.target!.name} ');
    });
*/
    print(
        '------------------- LISTES DES FAMILLE EMPLACEMENTS --------------------');
    final mxfamilleEmplacementBox = ObjectBox.mxfamilleEmplacementsBox;
    var mesFamilleEmpacements = mxfamilleEmplacementBox?.getAll();
    mesFamilleEmpacements?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox --------- ${element.id} --------  ${element.name} ');
    });

    print('------------------- LISTES DES FILIERES --------------------');
    final mxfiliereObject = ObjectBox.mxfilieresBox;
    var mesFilieres = mxfiliereObject?.getAll();
    mesFilieres?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox --------- ${element.id} --------  ${element.name} ');
    });

    print('----------- LISTES DES PRODUITS -------------');
    final mxproduitsBox = ObjectBox.mxproduitsBox;
    var mesProduits = mxproduitsBox?.getAll();
    mesProduits?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox - ${element.id} - ${element.name}  - ${element.mxFiliereObject.target!.name} - ${element.mxFamilleEmplacementObject.target!.name} ');
    });

    print('------------------- LISTES DES VARIETE --------------------');
    final mxvarieteBox = ObjectBox.mxvarietesBox;
    var mesVarietes = mxvarieteBox?.getAll();
    mesVarietes?.forEach((element) {
      print(element.toJson());
      // print('ObjectBox ----------- ${element.id} -  ${element.name} -  ${element.mxProduitObject.target!.name}-  ${element.mxProduitObject.target!.mxFiliereObject.target!.name}-  ${element.mxProduitObject.target!.mxFamilleEmplacementObject.target!.name}');
    });

    print(
        '------------------- LISTES DES TYPE EMBALLAGES --------------------');
    final mxtypeemballagesBox = ObjectBox.mxtypeemballagesBox;
    var mesTypeEmballages = mxtypeemballagesBox?.getAll();
    mesTypeEmballages?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name}');
    });

    print(
        '------------------- LISTES DES TYPE UNITE GRANDEUR --------------------');
    final mxtypeunitegrandeurBox = ObjectBox.mxtypeunitegrandeursBox;
    var mesTypeUniteGrandeurs = mxtypeunitegrandeurBox?.getAll();
    mesTypeUniteGrandeurs?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name}');
    });

    print('------------------- LISTES DES UNITE GRANDEUR --------------------');
    final mxunitegrandeurBox = ObjectBox.mxunitegrandeursBox;
    var mesUniteGrandeurs = mxunitegrandeurBox?.getAll();
    mesUniteGrandeurs?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ------ ${element.id} ------  ${element.name} ---  ${element.mxTypeUniteGrandeurObject.target!.name}');
    });

    print('------------------- LISTES DES EMBALLAGES --------------------');
    final mxemballagesBox = ObjectBox.mxemballagesBox;
    var mesEmballages = mxemballagesBox?.getAll();
    mesEmballages?.forEach((element) {
      print(element.toJson());
      // print('ObjectBox -------- ${element.id} --------  ${element.name} ---------- ${element.typeunitegrandeurname}');
    });

    print('------------------- LISTES DES USER OPs --------------------');
    final mxuserOpBox = ObjectBox.mxuserOpBox;
    var mesUserOps = mxuserOpBox?.getAll();
    mesUserOps?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox --- ${element.id}  ---  ${element.typeopname}  ---  ${element.opid} ---  ${element.opname} ');
    });

/*
    print(
        '------------------- LISTES DES USER POINT COLLECTES --------------------');
    final userPointCollecteBox = ObjectBox.userPointCollecteBox;
    var mesUserPointCollectes = userPointCollecteBox?.getAll();
    mesUserPointCollectes?.forEach((element) {
      print(
          'ObjectBox --- ${element.id}  ---  ${element.userid}  ---  ${element.agenceid} ---  ${element.agencename} ');
    });

    print(
        '------------------- LISTES DES USER UNITE TRANSFORMATIONS --------------------');
    final userUniteTransformationBox = ObjectBox.userUniteTransformationBox;
    var mesUserUniteTransformations = userUniteTransformationBox?.getAll();
    mesUserUniteTransformations?.forEach((element) {
      print(
          'ObjectBox --- ${element.id}  ---  ${element.structurename}  ---  ${element.typeunitetransformationname} ---  ${element.unitetransformationname} ');
    });
*/
    print('--------- LISTES DES TYPE EXPLOITATIONS ------');
    final mxtypeChargeExploitationBox = ObjectBox.mxtypeChargeExploitationsBox;
    var mesTypeChargeExploitations = mxtypeChargeExploitationBox?.getAll();
    mesTypeChargeExploitations?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name} ');
    });

    print('----- LISTES DES FAMILLES EXPLOITATIONS -----');
    final mxfamilleExploitationBox = ObjectBox.mxfamilleChargeExploitationsBox;
    var mesFamilleExploitations = mxfamilleExploitationBox?.getAll();
    mesFamilleExploitations?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox ----------- ${element.id} --------  ${element.name}');
    });

    print('----------- LISTES DES CHARGES EXPLOITATIONS -------------');
    final mxchargeExploitationBox = ObjectBox.mxchargeExploitationsBox;
    var mesChargeExploitations = mxchargeExploitationBox?.getAll();
    mesChargeExploitations?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox - ${element.id} - ${element.name} - ${element.unite} - ${element.pu}  - ${element.quantite_unite_superficie} - ${element.mxtypeChargeExploitationObject.target!.name} - ${element.mxfamilleChargeExploitationObject.target!.name} ');
    });
/*/
    print('--------- LISTES DES TYPE TRANSFORMATION ------');
    final typeTransformationBox = ObjectBox.typeTransformationBox;
    var mesTypeTransformationBoxs = typeTransformationBox?.getAll();
    mesTypeTransformationBoxs?.forEach((element) {
      print(
          'ObjectBox -- ${element.id} --  ${element.filierename} --  ${element.name}');
    });
*/
    print('------------------- LISTES DES EXPLOITATIONS --------------------');
    final mxexploitationBox = ObjectBox.mxexploitationBox;
    var mesExploitations = mxexploitationBox?.getAll();
    mesExploitations?.forEach((element) {
      print(element.toJson());
      //print('ObjectBox - ${element.id}  - ${element.compte} - ${element.unite} - ${element.pu} - - ${element.surface} - ${element.production} ');
      final mxcreditsBox = ObjectBox.mxcreditsBox;
      var mesCredits = mxcreditsBox?.getAll();
      Query<MxCreditObject> queryCredit = mxcreditsBox!
          .query(MxCreditObject_.mxExploitationObject.equals(element.id))
          .build();
      mesCredits = queryCredit.find();
      mesCredits!.forEach((elementCredit) {
        print(
            '----> CREDIT N°: ${elementCredit.id} - ${elementCredit.capital}- ${elementCredit.interet}  - ${elementCredit.moratoire} - ${elementCredit.autres_engagements} ');
      });
/*
      final mxrecoltesBox = ObjectBox.mxrecoltesBox;
      var mesRecoltes = mxrecoltesBox?.getAll();
      Query<MxRecolteObject> queryRecolte = mxrecoltesBox!
          .query(MxRecolteObject_.mxExploitationObject.equals(element.id))
          .build();
      mesRecoltes = queryRecolte.find();
      mesRecoltes!.forEach((elementRecolte) {
        print(
            '----> RECOLTE N°: ${elementRecolte.id} - ${elementRecolte.nombre_unite}- ${elementRecolte.nombre_emballage}  - ${elementRecolte.pu} ');
      });

      */
    });

    /*

    print(
        '------------------- LISTES DES FAMILLES EXPLOITATIONS --------------------');
    final familleExploitationBox = ObjectBox.familleChargeExploitationsBox;
    var mesFamilleExploitations = familleExploitationBox?.getAll();
    mesFamilleExploitations?.forEach((element) {
      print('ObjectBox ----------- ${element.id} --------  ${element.name}');
    });


    print('------------------- LISTES DES EXPLOITATION CHARGES EXPLOITATIONS --------------------');
    final exploitationChargeExploitationBox  = ObjectBox.exploitationChargeExploitationBox;
    var mesExploitationChargeExploitationBox = exploitationChargeExploitationBox?.getAll();
    mesExploitationChargeExploitationBox?.forEach((element) {
      print( 'ECE - ${element.exploitation_id} ---  ${element.id} - ${element.date} - ${element.valeur} - ${element.pu} - ${element.quantite} - ${element.charge_exploitation_id} - ${element.charge_exploitation_name}' );
    });

     */
  }

  Future<MxUserObject> getOneUser(String email, String password) async {
    final mxuserBox = ObjectBox.mxuserBox;
    List<MxUserObject> mesUsers = [];

    Query<MxUserObject> query = mxuserBox!
        .query(MxUserObject_.email
            .equals(email)
            .and(MxUserObject_.password.equals(password)))
        .build();

    // Query<MxUserObject> query = mxuserBox!.query().build();

    mesUsers = query.find();
    query.close();

    if (mesUsers.length > 0) {
      return mesUsers[0];
    } else {
      return MxUserObject(
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
    }
  }
}

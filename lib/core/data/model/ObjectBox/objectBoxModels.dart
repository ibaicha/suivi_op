import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:suivi_op/objectbox.g.dart';
part 'objectBoxModels.g.dart';

/* ------------------------ MxPostObject --------------------------- */
List<MxPostObject> MxPostObjectFromJson(String str) => List<MxPostObject>.from(
    json.decode(str).map((x) => MxPostObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxPostObject {
  @Id(assignable: true)
  int id;
  String title;
  String body;

  final mxcommentsObjects = ToMany<MxCommentObject>();

  MxPostObject({required this.id, required this.title, required this.body});

  /// factory.
  factory MxPostObject.fromJson(Map<String, dynamic> json) =>
      _$MxPostObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxPostObjectToJson(this);
}

/* ------------------------ MxCommentObject --------------------------- */
List<MxCommentObject> MxCommentObjectFromJson(String str) =>
    List<MxCommentObject>.from(
        json.decode(str).map((x) => MxCommentObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxCommentObject {
  @Id(assignable: true)
  int id;
  String content;

  final Map<String, dynamic> post;

  final mxpostObject = ToOne<MxPostObject>();

  MxCommentObject(
      {required this.id, required this.content, Map<String, dynamic>? post})
      : post = post ?? {};

  /// factory.
  factory MxCommentObject.fromJson(Map<String, dynamic> json) =>
      _$MxCommentObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxCommentObjectToJson(this);
}

/* ------------------------ MxAnneeObject --------------------------- */
List<MxAnneeObject> MxAnneeObjectFromJson(String str) =>
    List<MxAnneeObject>.from(
        json.decode(str).map((x) => MxAnneeObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxAnneeObject {
  @Id(assignable: true)
  int id;
  String name;
  int valeur;
  final mxExploitationObjects = ToMany<MxExploitationObject>();
  final mxmouvementstocksObjects = ToMany<MxMouvementStockObject>();
  MxAnneeObject({required this.id, required this.name, required this.valeur});

  /// factory.
  factory MxAnneeObject.fromJson(Map<String, dynamic> json) =>
      _$MxAnneeObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxAnneeObjectToJson(this);
}

/* ------------------------ MxSaisonObject --------------------------- */
List<MxSaisonObject> MxSaisonObjectFromJson(String str) =>
    List<MxSaisonObject>.from(
        json.decode(str).map((x) => MxSaisonObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxSaisonObject {
  @Id(assignable: true)
  int id;
  String name;
  String description;

  final mxExploitationObjects = ToMany<MxExploitationObject>();
  final mxmouvementstocksObjects = ToMany<MxMouvementStockObject>();
  MxSaisonObject(
      {required this.id, required this.name, required this.description});

  /// factory.
  factory MxSaisonObject.fromJson(Map<String, dynamic> json) =>
      _$MxSaisonObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxSaisonObjectToJson(this);
}

/* ------------------------ MxCampagneObject --------------------------- */
List<MxCampagneObject> MxCampagneObjectFromJson(String str) =>
    List<MxCampagneObject>.from(
        json.decode(str).map((x) => MxCampagneObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxCampagneObject {
  @Id(assignable: true)
  int id;

  final Map<String, dynamic> annee;
  final Map<String, dynamic> saison;

  final mxanneeObject = ToOne<MxAnneeObject>();
  final mxsaisonObject = ToOne<MxSaisonObject>();

  MxCampagneObject({
    required this.id,
    Map<String, dynamic>? annee,
    Map<String, dynamic>? saison,
  })  : annee = annee ?? {},
        saison = saison ?? {};

  // factory.
  factory MxCampagneObject.fromJson(Map<String, dynamic> json) =>
      _$MxCampagneObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() => _$MxCampagneObjectToJson(this);
}

/* ------------------------ MxRoleObject --------------------------- */
List<MxRoleObject> MxRoleObjectFromJson(String str) => List<MxRoleObject>.from(
    json.decode(str).map((x) => MxRoleObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxRoleObject {
  @Id(assignable: true)
  int id;
  String name;
  final mxuserObjects = ToMany<MxUserObject>();

  MxRoleObject({required this.id, required this.name});

  /// factory.
  factory MxRoleObject.fromJson(Map<String, dynamic> json) =>
      _$MxRoleObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxRoleObjectToJson(this);
}

/* ------------------------ MxUserObject --------------------------- */
List<MxUserObject> MxUserObjectFromJson(String str) => List<MxUserObject>.from(
    json.decode(str).map((x) => MxUserObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxUserObject {
  @Id(assignable: true)
  int id;
  String token;
  String email;
  String username;
  String password;
  String firstname;
  String lastname;
  String phone;
  String address;
  int roleId;
  String roleName;
  final mxuserPermissionObjects = ToMany<MxUserPermissionObject>();
  final mxUserOpsObjects = ToMany<MxUserOpObject>();
  final mxroleObject = ToOne<MxRoleObject>();

  MxUserObject(
      {required this.id,
      required this.token,
      required this.email,
      required this.username,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.address,
      required this.roleId,
      required this.roleName});

  /// factory.
  factory MxUserObject.fromJson(Map<String, dynamic> json) =>
      _$MxUserObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxUserObjectToJson(this);
}

/* ------------------------ MxUserPermissionObject --------------------------- */
List<MxUserPermissionObject> MxUserPermissionObjectFromJson(String str) =>
    List<MxUserPermissionObject>.from(
        json.decode(str).map((x) => MxUserPermissionObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxUserPermissionObject {
  @Id(assignable: true)
  int id;
  String name;
  final mxuserObject = ToOne<MxUserObject>();

  MxUserPermissionObject({required this.id, required this.name});

  /// factory.
  factory MxUserPermissionObject.fromJson(Map<String, dynamic> json) =>
      _$MxUserPermissionObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxUserPermissionObjectToJson(this);
}

/* ------------------------ MxTypeMouvementStockObject --------------------------- */
List<MxTypeMouvementStockObject> MxTypeMouvementStockObjectFromJson(
        String str) =>
    List<MxTypeMouvementStockObject>.from(
        json.decode(str).map((x) => MxTypeMouvementStockObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeMouvementStockObject {
  @Id(assignable: true)
  int id;
  String name;

  final mxmodeentreesortiestockObjects =
      ToMany<MxModeEntreeSortieStockObject>();

  MxTypeMouvementStockObject({required this.id, required this.name});

  // factory.
  factory MxTypeMouvementStockObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeMouvementStockObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeMouvementStockObjectToJson(this);
}

/* ------------------------ MxTypeMouvementIntrantObject --------------------------- */
List<MxTypeMouvementIntrantObject> MxTypeMouvementIntrantObjectFromJson(
        String str) =>
    List<MxTypeMouvementIntrantObject>.from(
        json.decode(str).map((x) => MxTypeMouvementIntrantObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeMouvementIntrantObject {
  @Id(assignable: true)
  int id;
  String name;

  final mxmodeEntreeSortieIntrantObjects =
      ToMany<MxModeEntreeSortieIntrantObject>();

  MxTypeMouvementIntrantObject({required this.id, required this.name});

  // factory.
  factory MxTypeMouvementIntrantObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeMouvementIntrantObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeMouvementIntrantObjectToJson(this);
}

/* ------------------------ MxModeEntreeSortieStockObject --------------------------- */
List<MxModeEntreeSortieStockObject> MxModeEntreeSortieStockObjectFromJson(
        String str) =>
    List<MxModeEntreeSortieStockObject>.from(
        json.decode(str).map((x) => MxModeEntreeSortieStockObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxModeEntreeSortieStockObject {
  @Id(assignable: true)
  int id;
  String code;
  String name;

  final Map<String, dynamic> typeMouvementStock;

  final mxtypemouvementstockObject = ToOne<MxTypeMouvementStockObject>();

  final mxmouvementstocksObjects = ToMany<MxMouvementStockObject>();

  MxModeEntreeSortieStockObject({
    required this.id,
    required this.code,
    required this.name,
    Map<String, dynamic>? typeMouvementStock,
  }) : typeMouvementStock = typeMouvementStock ?? {};

  /// factory.
  factory MxModeEntreeSortieStockObject.fromJson(Map<String, dynamic> json) =>
      _$MxModeEntreeSortieStockObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxModeEntreeSortieStockObjectToJson(this);
}

/* ------------------------ MxModeEntreeSortieIntrantObject --------------------------- */
List<MxModeEntreeSortieIntrantObject> MxModeEntreeSortieIntrantObjectFromJson(
        String str) =>
    List<MxModeEntreeSortieIntrantObject>.from(json
        .decode(str)
        .map((x) => MxModeEntreeSortieIntrantObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxModeEntreeSortieIntrantObject {
  @Id(assignable: true)
  int id;
  String code;
  String name;
  final Map<String, dynamic> typeMouvementIntrant;
  final mxtypemouvementintrantObject = ToOne<MxTypeMouvementIntrantObject>();

  final mxmouvementintrantsObjects = ToMany<MxMouvementIntrantObject>();

  MxModeEntreeSortieIntrantObject({
    required this.id,
    required this.code,
    required this.name,
    Map<String, dynamic>? typeMouvementIntrant,
  }) : typeMouvementIntrant = typeMouvementIntrant ?? {};

  /// factory.
  factory MxModeEntreeSortieIntrantObject.fromJson(Map<String, dynamic> json) =>
      _$MxModeEntreeSortieIntrantObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() =>
      _$MxModeEntreeSortieIntrantObjectToJson(this);
}

/* ------------------------ MxUniteTranformationObject --------------------------- */
List<MxUniteTransformationObject> MxUniteTransformationObjectFromJson(
        String str) =>
    List<MxUniteTransformationObject>.from(
        json.decode(str).map((x) => MxUniteTransformationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxUniteTransformationObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;
  String adresse;
  String telephone;
  final mxmouvementstockObjects = ToMany<MxMouvementStockObject>();

  MxUniteTransformationObject({
    required this.id,
    required this.name,
    required this.sigle,
    required this.adresse,
    required this.telephone,
  });

  // factory.
  factory MxUniteTransformationObject.fromJson(Map<String, dynamic> json) =>
      _$MxUniteTransformationObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxUniteTransformationObjectToJson(this);
}

/* ------------------------ MxMouvementStockObject --------------------------- */
List<MxMouvementStockObject> MxMouvementStockObjectFromJson(String str) =>
    List<MxMouvementStockObject>.from(
        json.decode(str).map((x) => MxMouvementStockObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxMouvementStockObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  double pu;
  double quantiteEntreeEmballage;
  double quantiteSortieEmballage;
  double nombreUnite;
  double valeur;
  String lot;
  bool isSended;
  DateTime? dateSended;

  final Map<String, dynamic> annee;
  final Map<String, dynamic> saison;
  final Map<String, dynamic> variete;
  final Map<String, dynamic> emballage;
  final Map<String, dynamic> op;
  final Map<String, dynamic> uniteTransformation;
  final Map<String, dynamic> modeEntreeSortieStock;
  final Map<String, dynamic> emplacement;

  final mxanneeObject = ToOne<MxAnneeObject>();
  final mxsaisonObject = ToOne<MxSaisonObject>();
  final mxemballageObject = ToOne<MxEmballageObject>();
  final mxopObject = ToOne<MxOpObject>();
  final mxunitetransformationObject = ToOne<MxUniteTransformationObject>();
  final mxvarieteObject = ToOne<MxVarieteObject>();
  final mxmodeentreesortiestockObject = ToOne<MxModeEntreeSortieStockObject>();
  final mxemplacementObject = ToOne<MxEmplacementObject>();

  MxMouvementStockObject(
      {required this.id,
      required this.date,
      required this.pu,
      required this.quantiteEntreeEmballage,
      required this.quantiteSortieEmballage,
      required this.nombreUnite,
      required this.valeur,
      required this.lot,
      required this.isSended,
      required this.dateSended,
      Map<String, dynamic>? annee,
      Map<String, dynamic>? saison,
      Map<String, dynamic>? emballage,
      Map<String, dynamic>? op,
      Map<String, dynamic>? uniteTransformation,
      Map<String, dynamic>? variete,
      Map<String, dynamic>? modeEntreeSortieStock,
      Map<String, dynamic>? emplacement})
      : annee = annee ?? {},
        saison = saison ?? {},
        emballage = emballage ?? {},
        op = op ?? {},
        uniteTransformation = uniteTransformation ?? {},
        variete = variete ?? {},
        modeEntreeSortieStock = modeEntreeSortieStock ?? {},
        emplacement = emplacement ?? {};

  // factory.
  factory MxMouvementStockObject.fromJson(Map<String, dynamic> json) =>
      _$MxMouvementStockObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxMouvementStockObjectToJson(this);
}

/* ------------------------ MxMouvementIntrantObject --------------------------- */
List<MxMouvementIntrantObject> MxMouvementIntrantObjectFromJson(String str) =>
    List<MxMouvementIntrantObject>.from(
        json.decode(str).map((x) => MxMouvementIntrantObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxMouvementIntrantObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  double pu;
  double quantiteEntreeEmballage;
  double quantiteSortieEmballage;
  double nombreUnite;
  double valeur;
  String lot;

  final Map<String, dynamic> annee;
  final Map<String, dynamic> saison;
  final Map<String, dynamic> variete;
  final Map<String, dynamic> emballage;
  final Map<String, dynamic> op;
  final Map<String, dynamic> fournisseur;
  final Map<String, dynamic> uniteTransformation;
  final Map<String, dynamic> modeEntreeSortieIntrant;
  final Map<String, dynamic> emplacement;
  final Map<String, dynamic> emplacementSource;
  final Map<String, dynamic> emplacementDestination;

  final mxanneeObject = ToOne<MxAnneeObject>();
  final mxsaisonObject = ToOne<MxSaisonObject>();
  final mxemballageObject = ToOne<MxEmballageObject>();
  final mxopObject = ToOne<MxOpObject>();
  final mxfournisseurObject = ToOne<MxFournisseurObject>();
  final mxunitetransformationObject = ToOne<MxUniteTransformationObject>();
  final mxvarieteObject = ToOne<MxVarieteObject>();
  final mxmodeentreesortiestockObject = ToOne<MxModeEntreeSortieStockObject>();
  final mxemplacementObject = ToOne<MxEmplacementObject>();
  final mxemplacementSourceObject = ToOne<MxEmplacementObject>();
  final mxemplacementDestinationObject = ToOne<MxEmplacementObject>();

  MxMouvementIntrantObject(
      {required this.id,
      required this.date,
      required this.pu,
      required this.quantiteEntreeEmballage,
      required this.quantiteSortieEmballage,
      required this.nombreUnite,
      required this.valeur,
      required this.lot,
      Map<String, dynamic>? annee,
      Map<String, dynamic>? saison,
      Map<String, dynamic>? emballage,
      Map<String, dynamic>? op,
      Map<String, dynamic>? fournisseur,
      Map<String, dynamic>? uniteTransformation,
      Map<String, dynamic>? variete,
      Map<String, dynamic>? modeEntreeSortieIntrant,
      Map<String, dynamic>? emplacement,
      Map<String, dynamic>? emplacementSource,
      Map<String, dynamic>? emplacementDestination})
      : annee = annee ?? {},
        saison = saison ?? {},
        emballage = emballage ?? {},
        op = op ?? {},
        fournisseur = fournisseur ?? {},
        uniteTransformation = uniteTransformation ?? {},
        variete = variete ?? {},
        modeEntreeSortieIntrant = modeEntreeSortieIntrant ?? {},
        emplacement = emplacement ?? {},
        emplacementSource = emplacementSource ?? {},
        emplacementDestination = emplacementDestination ?? {};

  // factory.
  factory MxMouvementIntrantObject.fromJson(Map<String, dynamic> json) =>
      _$MxMouvementIntrantObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxMouvementIntrantObjectToJson(this);
}

/* ------------------------ MxEntrepotObject --------------------------- */
List<MxEntrepotObject> MxEntrepotObjectFromJson(String str) =>
    List<MxEntrepotObject>.from(
        json.decode(str).map((x) => MxEntrepotObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxEntrepotObject {
  @Id(assignable: true)
  int id;
  String name;
  String adresse;
  final Map<String, dynamic> point;

  final mxpointObject = ToOne<MxPointObject>();
  final mxemplacementObjects = ToMany<MxEmplacementObject>();

  MxEntrepotObject({
    required this.id,
    required this.name,
    required this.adresse,
    Map<String, dynamic>? point,
  }) : point = point ?? {};

  /// factory.
  factory MxEntrepotObject.fromJson(Map<String, dynamic> json) =>
      _$MxEntrepotObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxEntrepotObjectToJson(this);
}

/* ------------------------ MxEmplacementObject --------------------------- */
List<MxEmplacementObject> MxEmplacementObjectFromJson(String str) =>
    List<MxEmplacementObject>.from(
        json.decode(str).map((x) => MxEmplacementObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxEmplacementObject {
  @Id(assignable: true)
  int id;
  String name;
  int? code;
  double capacite;

  final Map<String, dynamic> entrepot;
  final Map<String, dynamic> familleEmplacement;

  final mxentrepotObject = ToOne<MxEntrepotObject>();
  final mxfamilleemplacementObject = ToOne<MxFamilleEmplacementObject>();

  final mxmouvementstockObjects = ToMany<MxMouvementStockObject>();

  MxEmplacementObject(
      {required this.id,
      required this.name,
      required this.code,
      required this.capacite,
      Map<String, dynamic>? entrepot,
      familleEmplacement})
      : entrepot = entrepot ?? {},
        familleEmplacement = familleEmplacement ?? {};

  /// factory.
  factory MxEmplacementObject.fromJson(Map<String, dynamic> json) =>
      _$MxEmplacementObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxEmplacementObjectToJson(this);
}

/* ------------------------ MxTypeChargeExploitationObject --------------------------- */
List<MxTypeChargeExploitationObject> MxTypeChargeExploitationObjectFromJson(
        String str) =>
    List<MxTypeChargeExploitationObject>.from(json
        .decode(str)
        .map((x) => MxTypeChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  final mxchargeExploitationObjects = ToMany<MxChargeExploitationObject>();

  MxTypeChargeExploitationObject({required this.id, required this.name});
  // factory.
  factory MxTypeChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeChargeExploitationObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeChargeExploitationObjectToJson(this);
}

/* ------------------------ MxFamilleChargeExploitationObject --------------------------- */
List<MxFamilleChargeExploitationObject>
    MxFamilleChargeExploitationObjectFromJson(String str) =>
        List<MxFamilleChargeExploitationObject>.from(json
            .decode(str)
            .map((x) => MxFamilleChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxFamilleChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  final mxchargeExploitationObjects = ToMany<MxChargeExploitationObject>();

  MxFamilleChargeExploitationObject({required this.id, required this.name});
  // factory.
  factory MxFamilleChargeExploitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$MxFamilleChargeExploitationObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() =>
      _$MxFamilleChargeExploitationObjectToJson(this);
}

/* ------------------------ MxChargeExploitationObject --------------------------- */
List<MxChargeExploitationObject> MxChargeExploitationObjectFromJson(
        String str) =>
    List<MxChargeExploitationObject>.from(
        json.decode(str).map((x) => MxChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  String unite;
  double pu;
  double quantite_unite_superficie;
  bool isAchat;
  bool isProduit;
  bool isIntrant;

  final Map<String, dynamic> uniteGrandeur;
  final Map<String, dynamic> typeChargeExploitation;
  final Map<String, dynamic> familleChargeExploitation;

  final mxunitegrandeurObject = ToOne<MxUniteGrandeurObject>();
  final mxtypeChargeExploitationObject =
      ToOne<MxTypeChargeExploitationObject>();
  final mxfamilleChargeExploitationObject =
      ToOne<MxFamilleChargeExploitationObject>();

  final mxexploitationChargeExploitationObjects =
      ToMany<MxExploitationChargeExploitationObject>();

  final mxProduitChargeExploitationObjects =
      ToMany<MxProduitChargeExploitationObject>();

  MxChargeExploitationObject({
    required this.id,
    required this.name,
    required this.unite,
    required this.pu,
    required this.quantite_unite_superficie,
    required this.isAchat,
    required this.isProduit,
    required this.isIntrant,
    Map<String, dynamic>? uniteGrandeur,
    Map<String, dynamic>? typeChargeExploitation,
    Map<String, dynamic>? familleChargeExploitation,
  })  : uniteGrandeur = uniteGrandeur ?? {},
        typeChargeExploitation = typeChargeExploitation ?? {},
        familleChargeExploitation = familleChargeExploitation ?? {};

  // factory.
  factory MxChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$MxChargeExploitationObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() => _$MxChargeExploitationObjectToJson(this);
}

/* ------------------------ MxExploitatioObject --------------------------- */
List<MxExploitationObject> MxExploitationObjectFromJson(String str) =>
    List<MxExploitationObject>.from(
        json.decode(str).map((x) => MxExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxExploitationObject {
  @Id(assignable: true)
  int id;
  int compte;
  DateTime date;
  String unite;
  double surface;
  DateTime createdAt;
  DateTime updatedAt;

  final Map<String, dynamic> agence;
  final Map<String, dynamic> variete;
  final Map<String, dynamic> annee;
  final Map<String, dynamic> saison;
  final Map<String, dynamic> producteur;
  final Map<String, dynamic> op;

  final mxagenceObject = ToOne<MxAgenceObject>();
  final mxvarieteObject = ToOne<MxVarieteObject>();
  final mxanneeObject = ToOne<MxAnneeObject>();
  final mxsaisonObject = ToOne<MxSaisonObject>();
  final mxproducteurObject = ToOne<MxProducteurObject>();
  final mxopObject = ToOne<MxOpObject>();

  final mxexploitationChargeExploitationObjects =
      ToMany<MxExploitationChargeExploitationObject>();

  final mxrecoltesObjects = ToMany<MxRecolteObject>();
  final mxcreditsObjects = ToMany<MxCreditObject>();

  MxExploitationObject({
    required this.id,
    required this.compte,
    required this.date,
    required this.unite,
    required this.surface,
    required this.createdAt,
    required this.updatedAt,
    Map<String, dynamic>? agence,
    Map<String, dynamic>? variete,
    Map<String, dynamic>? annee,
    Map<String, dynamic>? saison,
    Map<String, dynamic>? producteur,
    Map<String, dynamic>? op,
  })  : variete = variete ?? {},
        agence = agence ?? {},
        annee = annee ?? {},
        saison = saison ?? {},
        producteur = producteur ?? {},
        op = op ?? {};

  // factory.
  factory MxExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$MxExploitationObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() => _$MxExploitationObjectToJson(this);
}

/* ------------------------ MxExploitationChargeExploitationObject --------------------------- */
List<MxExploitationChargeExploitationObject>
    MxExploitationChargeExploitationObjectFromJson(String str) =>
        List<MxExploitationChargeExploitationObject>.from(json
            .decode(str)
            .map((x) => MxExploitationChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxExploitationChargeExploitationObject {
  @Id(assignable: true)
  int id;
  double pu;
  double quantite;
  double valeur;
  String unite;
  DateTime date;
  String observation;
  DateTime? createdAt;
  DateTime? updatedAt;

  final Map<String, dynamic> exploitation;
  final Map<String, dynamic> chargeExploitation;

  final mxexploitation = ToOne<MxExploitationObject>();
  final mxchargeexploitationObject = ToOne<MxChargeExploitationObject>();

  MxExploitationChargeExploitationObject({
    required this.id,
    required this.pu,
    required this.quantite,
    required this.valeur,
    required this.unite,
    required this.date,
    required this.observation,
    Map<String, dynamic>? exploitation,
    Map<String, dynamic>? chargeExploitation,
  })  : exploitation = exploitation ?? {},
        chargeExploitation = chargeExploitation ?? {};

  // factory.
  factory MxExploitationChargeExploitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$MxExploitationChargeExploitationObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() =>
      _$MxExploitationChargeExploitationObjectToJson(this);
}

/* ------------------------ MxRecolteObject --------------------------- */
List<MxRecolteObject> MxRecolteObjectFromJson(String str) =>
    List<MxRecolteObject>.from(
        json.decode(str).map((x) => MxRecolteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxRecolteObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  double pu;
  double nombre_unite;
  double nombre_emballage;
  double valeur;
  final Map<String, dynamic> variete;
  final Map<String, dynamic> exploitation;
  final Map<String, dynamic> emballage;

  final mxvarieteObject = ToOne<MxVarieteObject>();
  final mxExploitationObject = ToOne<MxExploitationObject>();
  final mxemballageObject = ToOne<MxEmballageObject>();

  MxRecolteObject({
    required this.id,
    required this.date,
    required this.pu,
    required this.nombre_unite,
    required this.nombre_emballage,
    required this.valeur,
    Map<String, dynamic>? variete,
    Map<String, dynamic>? exploitation,
    Map<String, dynamic>? emballage,
  })  : exploitation = exploitation ?? {},
        emballage = emballage ?? {},
        variete = variete ?? {};

  // factory.
  factory MxRecolteObject.fromJson(Map<String, dynamic> json) =>
      _$MxRecolteObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() => _$MxRecolteObjectToJson(this);
}

/* ------------------------ MxTypeSocieteObject --------------------------- */
List<MxTypeSocieteObject> MxTypeSocieteObjectFromJson(String str) =>
    List<MxTypeSocieteObject>.from(
        json.decode(str).map((x) => MxTypeSocieteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeSocieteObject {
  @Id(assignable: true)
  int id;
  String name;

  MxTypeSocieteObject({required this.id, required this.name});

  // factory.
  factory MxTypeSocieteObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeSocieteObjectFromJson(json);
  // Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeSocieteObjectToJson(this);
}

/* ------------------------ MxSocieteObject --------------------------- */
List<MxSocieteObject> MxSocieteObjectFromJson(String str) =>
    List<MxSocieteObject>.from(
        json.decode(str).map((x) => MxSocieteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxSocieteObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;
  String email;
  String adresse;
  String telephone;

  final Map<String, dynamic> typeSociete;
  final mxtypeSocieteObject = ToOne<MxTypeSocieteObject>();

  MxSocieteObject(
      {required this.id,
      required this.name,
      required this.sigle,
      required this.email,
      required this.adresse,
      required this.telephone,
      Map<String, dynamic>? typeSociete})
      : typeSociete = typeSociete ?? {};

  // factory.
  factory MxSocieteObject.fromJson(Map<String, dynamic> json) =>
      _$MxSocieteObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxSocieteObjectToJson(this);
}

/* ------------------------ MxAgenceObject --------------------------- */
List<MxAgenceObject> MxAgenceObjectFromJson(String str) =>
    List<MxAgenceObject>.from(
        json.decode(str).map((x) => MxAgenceObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxAgenceObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;

  final Map<String, dynamic> typeExploitationFinancier;

  final mxtypeRemboursementObject = ToOne<MxTypeRemboursementObject>();
  final mxcreditObjects = ToMany<MxCreditObject>();
  final mxexploitationObjects = ToMany<MxExploitationObject>();

  MxAgenceObject(
      {required this.id,
      required this.name,
      required this.sigle,
      Map<String, dynamic>? exploitation})
      : typeExploitationFinancier = exploitation ?? {};
  final mxcreditsObjects = ToMany<MxCreditObject>();
  // factory.
  factory MxAgenceObject.fromJson(Map<String, dynamic> json) =>
      _$MxAgenceObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxAgenceObjectToJson(this);
}

/* ------------------------ MxCreditObject --------------------------- */
List<MxCreditObject> MxCreditObjectFromJson(String str) =>
    List<MxCreditObject>.from(
        json.decode(str).map((x) => MxCreditObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxCreditObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  double capital;
  double interet;
  double moratoire;
  double autres_engagements;

  final Map<String, dynamic> exploitation;
  final Map<String, dynamic> agence;

  final mxExploitationObject = ToOne<MxExploitationObject>();
  final mxagenceObject = ToOne<MxAgenceObject>();

  MxCreditObject({
    required this.id,
    required this.date,
    required this.capital,
    required this.interet,
    required this.moratoire,
    required this.autres_engagements,
    Map<String, dynamic>? exploitation,
    Map<String, dynamic>? agence,
  })  : exploitation = exploitation ?? {},
        agence = agence ?? {};

  // factory.
  factory MxCreditObject.fromJson(Map<String, dynamic> json) =>
      _$MxCreditObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxCreditObjectToJson(this);
}

/* ------------------------ MxTypeRemboursementObject --------------------------- */
List<MxTypeRemboursementObject> MxTypeRemboursementObjectFromJson(String str) =>
    List<MxTypeRemboursementObject>.from(
        json.decode(str).map((x) => MxTypeRemboursementObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeRemboursementObject {
  @Id(assignable: true)
  int id;
  String name;
  MxTypeRemboursementObject({required this.id, required this.name});

  final mxremboursementObjects = ToMany<MxRemboursementObject>();

  // factory.
  factory MxTypeRemboursementObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeRemboursementObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeRemboursementObjectToJson(this);
}

/* ------------------------ MxRemboursementObject --------------------------- */
List<MxRemboursementObject> MxRemboursementObjectFromJson(String str) =>
    List<MxRemboursementObject>.from(
        json.decode(str).map((x) => MxRemboursementObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxRemboursementObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  double pu;
  double nombre_unite;
  double nombre_emballage;
  double valeur;

  final Map<String, dynamic> typeRemboursement;
  final Map<String, dynamic> variete;
  final Map<String, dynamic> exploitation;
  final Map<String, dynamic> emballage;
  final Map<String, dynamic> point;

  final mxTypeRemboursementObject = ToOne<MxTypeRemboursementObject>();
  final mxVarieteObject = ToOne<MxVarieteObject>();
  final mxExploitationObject = ToOne<MxExploitationObject>();
  final mxEmballageObject = ToOne<MxEmballageObject>();
  final mxPointObject = ToOne<MxPointObject>();

  MxRemboursementObject(
      {required this.id,
      required this.date,
      required this.pu,
      required this.nombre_unite,
      required this.nombre_emballage,
      required this.valeur,
      Map<String, dynamic>? variete,
      Map<String, dynamic>? exploitation,
      Map<String, dynamic>? emballage,
      Map<String, dynamic>? typeRemboursement,
      Map<String, dynamic>? point})
      : typeRemboursement = typeRemboursement ?? {},
        exploitation = exploitation ?? {},
        emballage = emballage ?? {},
        variete = variete ?? {},
        point = point ?? {};

  // factory.
  factory MxRemboursementObject.fromJson(Map<String, dynamic> json) =>
      _$MxRemboursementObjectFromJson(json);

  // Connect the generated
  Map<String, dynamic> toJson() => _$MxRemboursementObjectToJson(this);
}

/* ------------------------ MxFamilleEmplacementObject --------------------------- */
List<MxFamilleEmplacementObject> MxFamilleEmplacementObjectFromJson(
        String str) =>
    List<MxFamilleEmplacementObject>.from(
        json.decode(str).map((x) => MxFamilleEmplacementObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxFamilleEmplacementObject {
  @Id(assignable: true)
  int id;
  String name;
  final mxProduitObjects = ToMany<MxProduitObject>();
  MxFamilleEmplacementObject({required this.id, required this.name});

  /// factory.
  factory MxFamilleEmplacementObject.fromJson(Map<String, dynamic> json) =>
      _$MxFamilleEmplacementObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxFamilleEmplacementObjectToJson(this);
}

/* ------------------------ MxFiliereObject --------------------------- */
List<MxFiliereObject> MxFiliereObjectFromJson(String str) =>
    List<MxFiliereObject>.from(
        json.decode(str).map((x) => MxFiliereObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxFiliereObject {
  @Id(assignable: true)
  int id;
  String name;
  final mxProduitObjects = ToMany<MxProduitObject>();
  MxFiliereObject({required this.id, required this.name});

  /// factory.
  factory MxFiliereObject.fromJson(Map<String, dynamic> json) =>
      _$MxFiliereObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxFiliereObjectToJson(this);
}

/* ------------------------ MxProduitObject --------------------------- */
List<MxProduitObject> MxProduitObjectFromJson(String str) =>
    List<MxProduitObject>.from(
        json.decode(str).map((x) => MxProduitObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxProduitObject {
  @Id(assignable: true)
  int id;
  String name;
  bool isDerive;
  bool isEnsachage;
  bool isActive;
  final Map<String, dynamic> filiere;
  final Map<String, dynamic> familleEmplacement;

  final mxChargeExploitationObjects = ToMany<MxChargeExploitationObject>();
  final mxVarieteObjects = ToMany<MxVarieteObject>();
  final mxEmballageObjects = ToMany<MxEmballageObject>();
  final mxProduitChargeExploitationObjects =
      ToMany<MxProduitChargeExploitationObject>();
  final mxFiliereObject = ToOne<MxFiliereObject>();
  final mxFamilleEmplacementObject = ToOne<MxFamilleEmplacementObject>();

  MxProduitObject(
      {required this.id,
      required this.name,
      required this.isDerive,
      required this.isEnsachage,
      required this.isActive,
      Map<String, dynamic>? filiere,
      Map<String, dynamic>? familleEmplacement})
      : filiere = filiere ?? {},
        familleEmplacement = familleEmplacement ?? {};

  /// factory.
  factory MxProduitObject.fromJson(Map<String, dynamic> json) =>
      _$MxProduitObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxProduitObjectToJson(this);
}

/* ------------------------ MxVarieteObject --------------------------- */
List<MxVarieteObject> MxVarieteObjectFromJson(String str) =>
    List<MxVarieteObject>.from(
        json.decode(str).map((x) => MxVarieteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxVarieteObject {
  @Id(assignable: true)
  int id;
  String name;
  String? surface_unite;
  String? quantite_unite;
  double? pu_unite;
  double? rendement_unite;
  bool isActive;
  Map<String, dynamic> produit;

  final mxProduitObject = ToOne<MxProduitObject>();
  final mxExploitationObjects = ToMany<MxExploitationObject>();
  final mxmouvementstocksObjects = ToMany<MxMouvementStockObject>();
  //final mxvarieteObjects = ToMany<MxVarieteObject>();

  MxVarieteObject({
    required this.id,
    required this.name,
    required this.surface_unite,
    required this.quantite_unite,
    required this.pu_unite,
    required this.rendement_unite,
    required this.isActive,
    Map<String, dynamic>? produit,
  }) : produit = produit ?? {};

  /// factory.
  factory MxVarieteObject.fromJson(Map<String, dynamic> json) =>
      _$MxVarieteObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxVarieteObjectToJson(this);
}

/* ------------------------ MxProduitChargeExploitationObject --------------------------- */
List<MxProduitChargeExploitationObject>
    MxProduitChargeExploitationObjectFromJson(String str) =>
        List<MxProduitChargeExploitationObject>.from(json
            .decode(str)
            .map((x) => MxProduitChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxProduitChargeExploitationObject {
  @Id(assignable: true)
  int id;
  Map<String, dynamic> produit;
  Map<String, dynamic> chargeExploitation;
  final mxChargeExploitationObject = ToOne<MxChargeExploitationObject>();
  final mxProduitObject = ToOne<MxProduitObject>();

  MxProduitChargeExploitationObject({
    required this.id,
    Map<String, dynamic>? produit,
    Map<String, dynamic>? chargeExploitation,
  })  : produit = produit ?? {},
        chargeExploitation = chargeExploitation ?? {};

  /// factory.
  factory MxProduitChargeExploitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$MxProduitChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() =>
      _$MxProduitChargeExploitationObjectToJson(this);
}

/* ------------------------ MxTypeOpObject --------------------------- */
List<MxTypeOpObject> MxTypeOpObjectFromJson(String str) =>
    List<MxTypeOpObject>.from(
        json.decode(str).map((x) => MxTypeOpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeOpObject {
  @Id(assignable: true)
  int id;
  String name;

  final mxOpObjects = ToMany<MxOpObject>();
  MxTypeOpObject({required this.id, required this.name});

  /// factory.
  factory MxTypeOpObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeOpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeOpObjectToJson(this);
}

/* ------------------------ MxOpObject --------------------------- */
List<MxOpObject> MxOpObjectFromJson(String str) =>
    List<MxOpObject>.from(json.decode(str).map((x) => MxOpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxOpObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;
  String email;
  String telephone;
  String adresse;
  String prenom_contact;
  String nom_contact;
  String email_contact;
  String telephone_contact;

  final Map<String, dynamic> typeOp;
  final Map<String, dynamic> village;
  final Map<String, dynamic> localite;
  final Map<String, dynamic> point;

  final mxTypeOpObject = ToOne<MxTypeOpObject>();
  final mxLocaliteObject = ToOne<MxLocaliteObject>();
  final mxPointObject = ToOne<MxPointObject>();
  final mxVillageObject = ToOne<MxVillageObject>();

  final mxProducteursObjects = ToMany<MxProducteurObject>();
  final mxUserOpsObjects = ToMany<MxUserOpObject>();
  final mxExploitationObjects = ToMany<MxExploitationObject>();
  final mxmouvementstocksObjects = ToMany<MxMouvementStockObject>();

  MxOpObject({
    required this.id,
    required this.name,
    required this.sigle,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.prenom_contact,
    required this.nom_contact,
    required this.email_contact,
    required this.telephone_contact,
    Map<String, dynamic>? typeOp,
    Map<String, dynamic>? village,
    Map<String, dynamic>? localite,
    Map<String, dynamic>? point,
  })  : typeOp = typeOp ?? {},
        village = village ?? {},
        localite = localite ?? {},
        point = point ?? {};

  /// factory.
  factory MxOpObject.fromJson(Map<String, dynamic> json) =>
      _$MxOpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxOpObjectToJson(this);
}

/* ------------------------ MxProducteurObject --------------------------- */
List<MxProducteurObject> MxProducteurObjectFromJson(String str) =>
    List<MxProducteurObject>.from(
        json.decode(str).map((x) => MxProducteurObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxProducteurObject {
  @Id(assignable: true)
  int id;
  int compte;
  String prenom;
  String nom;
  String cni;
  String email;
  String telephone;
  String adresse;
  bool isActive;

  final Map<String, dynamic> op;

  final mxOpObject = ToOne<MxOpObject>();
  final mxExploitationObjects = ToMany<MxExploitationObject>();

  MxProducteurObject(
      {required this.id,
      required this.compte,
      required this.prenom,
      required this.email,
      required this.telephone,
      required this.adresse,
      required this.nom,
      required this.cni,
      required this.isActive,
      Map<String, dynamic>? op})
      : op = op ?? {};

  /// factory.
  factory MxProducteurObject.fromJson(Map<String, dynamic> json) =>
      _$MxProducteurObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxProducteurObjectToJson(this);
}

/* ------------------------ MxPaysObject --------------------------- */
List<MxPaysObject> MxPaysObjectFromJson(String str) => List<MxPaysObject>.from(
    json.decode(str).map((x) => MxPaysObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxPaysObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;

  final mxZonesObjects = ToMany<MxZoneObject>();

  MxPaysObject({required this.id, required this.name, required this.sigle});

  /// factory.
  factory MxPaysObject.fromJson(Map<String, dynamic> json) =>
      _$MxPaysObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxPaysObjectToJson(this);
}

/* ------------------------ MxZoneObject --------------------------- */
List<MxZoneObject> MxZoneObjectFromJson(String str) => List<MxZoneObject>.from(
    json.decode(str).map((x) => MxZoneObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxZoneObject {
  @Id(assignable: true)
  int id;
  String name;
  final Map<String, dynamic> pays;

  final mxPaysObject = ToOne<MxPaysObject>();
  final mxSousZonesObjects = ToMany<MxSousZoneObject>();

  MxZoneObject(
      {required this.id, required this.name, Map<String, dynamic>? pays})
      : pays = pays ?? {};

  /// factory.
  factory MxZoneObject.fromJson(Map<String, dynamic> json) =>
      _$MxZoneObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxZoneObjectToJson(this);
}

/* ------------------------ MxSousZoneObject --------------------------- */
List<MxSousZoneObject> MxSousZoneObjectFromJson(String str) =>
    List<MxSousZoneObject>.from(
        json.decode(str).map((x) => MxSousZoneObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxSousZoneObject {
  @Id(assignable: true)
  int id;
  String name;
  final Map<String, dynamic> zone;

  final mxLocalitesObjects = ToMany<MxLocaliteObject>();

  final mxZoneObject = ToOne<MxZoneObject>();
  MxSousZoneObject(
      {required this.id, required this.name, Map<String, dynamic>? zone})
      : zone = zone ?? {};

  /// factory.
  factory MxSousZoneObject.fromJson(Map<String, dynamic> json) =>
      _$MxSousZoneObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxSousZoneObjectToJson(this);
}

/*------------------------ MxLocaliteObject --------------------------- */
List<MxLocaliteObject> MxLocaliteObjectFromJson(String str) =>
    List<MxLocaliteObject>.from(
        json.decode(str).map((x) => MxLocaliteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxLocaliteObject {
  @Id(assignable: true)
  int id;
  String name;
  final Map<String, dynamic> sousZone;

  final mxSousZoneObject = ToOne<MxSousZoneObject>();
  final mxPointObjects = ToMany<MxPointObject>();
  final mxVillagesObjects = ToMany<MxVillageObject>();
  final mxOpsObjects = ToMany<MxOpObject>();

  MxLocaliteObject(
      {required this.id, required this.name, Map<String, dynamic>? sousZone})
      : sousZone = sousZone ?? {};

  /// factory.
  factory MxLocaliteObject.fromJson(Map<String, dynamic> json) =>
      _$MxLocaliteObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxLocaliteObjectToJson(this);
}

/* ------------------------ MxVillageObject --------------------------- */
List<MxVillageObject> MxVillageObjectFromJson(String str) =>
    List<MxVillageObject>.from(
        json.decode(str).map((x) => MxVillageObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxVillageObject {
  @Id(assignable: true)
  int id;
  String name;
  final Map<String, dynamic> localite;

  final mxLocaliteObject = ToOne<MxLocaliteObject>();
  final mxOpsObjects = ToMany<MxOpObject>();
  MxVillageObject(
      {required this.id, required this.name, Map<String, dynamic>? localite})
      : localite = localite ?? {};

  /// factory.
  factory MxVillageObject.fromJson(Map<String, dynamic> json) =>
      _$MxVillageObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxVillageObjectToJson(this);
}

/* ------------------------ MxPointObject --------------------------- */
List<MxPointObject> MxPointObjectFromJson(String str) =>
    List<MxPointObject>.from(
        json.decode(str).map((x) => MxPointObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxPointObject {
  @Id(assignable: true)
  int id;
  String name;
  bool isProduit;
  bool isIntrant;
  bool isVirtuel;

  final Map<String, dynamic> localite;
  final mxLocaliteObject = ToOne<MxLocaliteObject>();

  final mxOpsObjects = ToMany<MxOpObject>();
  final mxUserPointsObjects = ToMany<MxUserPointObject>();
  final mxEntrepotsObjects = ToMany<MxEntrepotObject>();
  final mxRemboursementsObjects = ToMany<MxRemboursementObject>();
  final mxPointAgencesObjects = ToMany<MxPointAgenceObject>();

  MxPointObject(
      {required this.id,
      required this.name,
      required this.isProduit,
      required this.isIntrant,
      required this.isVirtuel,
      Map<String, dynamic>? localite})
      : localite = localite ?? {};

  /// factory.
  factory MxPointObject.fromJson(Map<String, dynamic> json) =>
      _$MxPointObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxPointObjectToJson(this);
}

/* ------------------------ MxPointAgenceObject --------------------------- */
List<MxPointAgenceObject> MxPointAgenceObjectFromJson(String str) =>
    List<MxPointAgenceObject>.from(
        json.decode(str).map((x) => MxPointAgenceObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxPointAgenceObject {
  @Id(assignable: true)
  int id;
  final Map<String, dynamic> point;
  final mxPointObjects = ToMany<MxPointObject>();

  final Map<String, dynamic> agence;
  final mxAgenceObjects = ToMany<MxAgenceObject>();

  MxPointAgenceObject(
      {required this.id,
      Map<String, dynamic>? point,
      Map<String, dynamic>? agence})
      : point = point ?? {},
        agence = agence ?? {};

  /// factory.
  factory MxPointAgenceObject.fromJson(Map<String, dynamic> json) =>
      _$MxPointAgenceObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxPointAgenceObjectToJson(this);
}

/* ------------------------ MxTypeEmballageObject --------------------------- */
List<MxTypeEmballageObject> MxTypeEmballageObjectFromJson(String str) =>
    List<MxTypeEmballageObject>.from(
        json.decode(str).map((x) => MxTypeEmballageObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeEmballageObject {
  @Id(assignable: true)
  int id;
  String name;

  final mxEmballageObjects = ToMany<MxEmballageObject>();

  MxTypeEmballageObject({required this.id, required this.name});

  /// factory.
  factory MxTypeEmballageObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeEmballageObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeEmballageObjectToJson(this);
}

/* ------------------------ MxFournisseurObject --------------------------- */
List<MxFournisseurObject> MxFournisseurObjectFromJson(String str) =>
    List<MxFournisseurObject>.from(
        json.decode(str).map((x) => MxFournisseurObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxFournisseurObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;
  String email;
  String telephone;
  String adresse;
  String prenom_contact;
  String nom_contact;
  String email_contact;
  String telephone_contact;
  Map<String, dynamic> societe;

  final mxSocieteObject = ToOne<MxSocieteObject>();

  MxFournisseurObject({
    required this.id,
    required this.name,
    required this.sigle,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.prenom_contact,
    required this.nom_contact,
    required this.email_contact,
    required this.telephone_contact,
    Map<String, dynamic>? societe,
  }) : societe = societe ?? {};

  /// factory.
  factory MxFournisseurObject.fromJson(Map<String, dynamic> json) =>
      _$MxFournisseurObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxFournisseurObjectToJson(this);
}

/* ------------------------ MxTypeUniteGrandeurObject --------------------------- */
List<MxTypeUniteGrandeurObject> MxTypeUniteGrandeurObjectFromJson(String str) =>
    List<MxTypeUniteGrandeurObject>.from(
        json.decode(str).map((x) => MxTypeUniteGrandeurObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxTypeUniteGrandeurObject {
  @Id(assignable: true)
  int id;
  String name;

  final mxUniteGrandeurObjects = ToMany<MxUniteGrandeurObject>();

  MxTypeUniteGrandeurObject({required this.id, required this.name});

  /// factory.
  factory MxTypeUniteGrandeurObject.fromJson(Map<String, dynamic> json) =>
      _$MxTypeUniteGrandeurObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxTypeUniteGrandeurObjectToJson(this);
}

/* ------------------------ MxUniteGrandeurObject --------------------------- */
List<MxUniteGrandeurObject> MxUniteGrandeurObjectFromJson(String str) =>
    List<MxUniteGrandeurObject>.from(
        json.decode(str).map((x) => MxUniteGrandeurObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxUniteGrandeurObject {
  @Id(assignable: true)
  int id;
  String name;
  final Map<String, dynamic> typeUniteGrandeur;

  final mxTypeUniteGrandeurObject = ToOne<MxTypeUniteGrandeurObject>();
  final mxEmballageObjects = ToMany<MxEmballageObject>();

  MxUniteGrandeurObject(
      {required this.id,
      required this.name,
      Map<String, dynamic>? typeUniteGrandeur})
      : typeUniteGrandeur = typeUniteGrandeur ?? {};

  /// factory.
  factory MxUniteGrandeurObject.fromJson(Map<String, dynamic> json) =>
      _$MxUniteGrandeurObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxUniteGrandeurObjectToJson(this);
}

/* ------------------------ MxEmballageObject --------------------------- */
List<MxEmballageObject> MxEmballageObjectFromJson(String str) =>
    List<MxEmballageObject>.from(
        json.decode(str).map((x) => MxEmballageObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxEmballageObject {
  @Id(assignable: true)
  int id;
  String name;
  String conditionnement;
  double quantite;
  double pu;
  double valeur;
  bool isActive;
  bool isDefault;

  final Map<String, dynamic> produit;
  final Map<String, dynamic> typeEmballage;
  final Map<String, dynamic> uniteGrandeur;

  final mxProduitObject = ToOne<MxProduitObject>();
  final mxUniteGrandeurObject = ToOne<MxUniteGrandeurObject>();
  final mxTypeEmballageObject = ToOne<MxTypeEmballageObject>();

  final mxExploitationObjects = ToMany<MxExploitationObject>();
  final mxEmballageObjects = ToMany<MxEmballageObject>();

  MxEmballageObject(
      {required this.id,
      required this.name,
      required this.conditionnement,
      required this.quantite,
      required this.pu,
      required this.valeur,
      required this.isActive,
      required this.isDefault,
      Map<String, dynamic>? produit,
      Map<String, dynamic>? typeEmballage,
      Map<String, dynamic>? uniteGrandeur})
      : produit = produit ?? {},
        typeEmballage = typeEmballage ?? {},
        uniteGrandeur = uniteGrandeur ?? {};

  /// factory.
  factory MxEmballageObject.fromJson(Map<String, dynamic> json) =>
      _$MxEmballageObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxEmballageObjectToJson(this);
}

/* ------------------------ MxUserOpObject --------------------------- */
List<MxUserOpObject> MxUserOpObjectFromJson(String str) =>
    List<MxUserOpObject>.from(
        json.decode(str).map((x) => MxUserOpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxUserOpObject {
  @Id(assignable: true)
  int id;
  int userId;
  Map<String, dynamic>? op;

  final mxUserObject = ToOne<MxUserOpObject>();
  final mxOpObject = ToOne<MxOpObject>();

  MxUserOpObject(
      {required this.id, required this.userId, Map<String, dynamic>? op})
      : op = op ?? {};

  /// factory.
  factory MxUserOpObject.fromJson(Map<String, dynamic> json) =>
      _$MxUserOpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxUserOpObjectToJson(this);
}

/* ------------------------ MxUserPointObject --------------------------- */
List<MxUserPointObject> MxUserPointObjectFromJson(String str) =>
    List<MxUserPointObject>.from(
        json.decode(str).map((x) => MxUserPointObject.fromJson(x)));

@JsonSerializable()
@Entity()
class MxUserPointObject {
  @Id(assignable: true)
  int id;
  int userId;
  Map<String, dynamic>? point;

  final mxUserObject = ToOne<MxUserPointObject>();
  final mxPointObject = ToOne<MxPointObject>();

  MxUserPointObject(
      {required this.id, required this.userId, Map<String, dynamic>? point})
      : point = point ?? {};

  /// factory.
  factory MxUserPointObject.fromJson(Map<String, dynamic> json) =>
      _$MxUserPointObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$MxUserPointObjectToJson(this);
}

/* ------------------------ Person --------------------------- */
@JsonSerializable()
class Person {
  final int id;
  final String name;
  final int age;

  @JsonKey(name: 'data')
  final Map<String, dynamic> data;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.data,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@Entity()
class PersonEntity {
  @Id(assignable: true)
  final int id;
  final String name;
  final int age;

  final Map<String, dynamic> data;

  PersonEntity({
    required this.id,
    required this.name,
    required this.age,
    Map<String, dynamic>? data,
  }) : data = data ?? {};
}

@JsonSerializable()
class DataTypeChargeExploitationObject {
  int id;
  String name;
  DataTypeChargeExploitationObject({required this.id, required this.name});
  // factory.
  factory DataTypeChargeExploitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$DataTypeChargeExploitationObjectFromJson(json);
  Map<String, dynamic> toJson() =>
      _$DataTypeChargeExploitationObjectToJson(this);
}

/* ------------------------ Group --------------------------- */
List<Group> GroupFromJson(String str) =>
    List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

@JsonSerializable()
//@Entity()
class Group {
  int id;
  final String name;

  Group({required this.id, required this.name});

  /// factory.
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  /// Connect the generated
}

/* ------------------------ User --------------------------- */
List<User> UserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

@JsonSerializable()
//@Entity()
class User {
  int id;
  String refresh;
  String access;
  String token;
  String email;
  String password;
  String firstname;
  String lastname;
  List<dynamic> groups;

  User(
      {required this.id,
      required this.refresh,
      required this.access,
      required this.token,
      required this.email,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.groups});

  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/* ------------------------ GroupObject --------------------------- */
List<GroupObject> GroupObjectFromJson(String str) => List<GroupObject>.from(
    json.decode(str).map((x) => GroupObject.fromJson(x)));

@JsonSerializable()
@Entity()
class GroupObject {
  @Id(assignable: true)
  int id;
  String name;
  GroupObject({required this.id, required this.name});

  /// factory.
  factory GroupObject.fromJson(Map<String, dynamic> json) =>
      _$GroupObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$GroupObjectToJson(this);
}

/* ------------------------ UserObject --------------------------- */
List<UserObject> UserObjectFromJson(String str) =>
    List<UserObject>.from(json.decode(str).map((x) => UserObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UserObject {
  @Id(assignable: true)
  int id;
  String token;
  String refresh;
  String access;
  String email;
  String password;
  String firstname;
  String lastname;
  int? op_id;
  String? op_name;
  int? sous_zone_id;
  String? sous_zone_name;
  int? zone_id;
  String? zone_name;
  int? point_id;
  String? point_name;

  /*
  int? profil_id;
  String? profil_name;
  int? producteur_id;
  String? producteur_prenom;
  String? producteur_nom;
  String? producteur_cni;
  int? op_id;
  String? op_name;
  int? sous_zone_id;
  String? sous_zone_name;
  int? zone_id;
  String? zone_name;
  */

  UserObject(
      {required this.id,
      required this.token,
      required this.refresh,
      required this.access,
      required this.email,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.op_id,
      required this.op_name,
      required this.sous_zone_id,
      required this.sous_zone_name,
      required this.zone_id,
      required this.zone_name,
      required this.point_id,
      required this.point_name
      /*
      required this.profil_id,
      required this.producteur_id,
      required this.producteur_prenom,
      required this.producteur_nom,
      required this.producteur_cni,
      required this.profil_name,
      required this.op_id,
      required this.op_name,
      required this.sous_zone_id,
      required this.sous_zone_name,
      required this.zone_id,
      required this.zone_name
      */
      });

  /// factory.
  factory UserObject.fromJson(Map<String, dynamic> json) =>
      _$UserObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UserObjectToJson(this);
}

/* ------------------------ SaisonObject --------------------------- */
List<SaisonObject> SaisonObjectFromJson(String str) => List<SaisonObject>.from(
    json.decode(str).map((x) => SaisonObject.fromJson(x)));

@JsonSerializable()
@Entity()
class SaisonObject {
  @Id(assignable: true)
  int id;
  String name;
  String description;
  SaisonObject(
      {required this.id, required this.name, required this.description});

  /// factory.
  factory SaisonObject.fromJson(Map<String, dynamic> json) =>
      _$SaisonObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$SaisonObjectToJson(this);
}

/* ------------------------ AnneeObject --------------------------- */
List<AnneeObject> AnneeObjectFromJson(String str) => List<AnneeObject>.from(
    json.decode(str).map((x) => SaisonObject.fromJson(x)));

@JsonSerializable()
@Entity()
class AnneeObject {
  @Id(assignable: true)
  int id;
  int value;
  String name;
  AnneeObject({required this.id, required this.value, required this.name});

  /// factory.
  factory AnneeObject.fromJson(Map<String, dynamic> json) =>
      _$AnneeObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$AnneeObjectToJson(this);
}

/* ------------------------ FiliereObject --------------------------- */
List<FiliereObject> FiliereObjectFromJson(String str) =>
    List<FiliereObject>.from(
        json.decode(str).map((x) => FiliereObject.fromJson(x)));

@JsonSerializable()
@Entity()
class FiliereObject {
  @Id(assignable: true)
  int id;
  String name;
  FiliereObject({required this.id, required this.name});

  /// factory.
  factory FiliereObject.fromJson(Map<String, dynamic> json) =>
      _$FiliereObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$FiliereObjectToJson(this);
}

/* ------------------------ varieteObject --------------------------- */
List<VarieteObject> VarieteObjectFromJson(String str) =>
    List<VarieteObject>.from(
        json.decode(str).map((x) => VarieteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class VarieteObject {
  @Id(assignable: true)
  int id;
  String name;
  String? surface_unite;
  String? quantite_unite;
  double? rendement_unite;
  int produitid;
  String produitname;
  int filiereid;
  String filierename;
  int familleemplacementid;
  String familleemplacementname;

  VarieteObject({
    required this.id,
    required this.name,
    required this.surface_unite,
    required this.quantite_unite,
    required this.rendement_unite,
    required this.produitid,
    required this.produitname,
    required this.filiereid,
    required this.filierename,
    required this.familleemplacementid,
    required this.familleemplacementname,
  });

  /// factory.
  factory VarieteObject.fromJson(Map<String, dynamic> json) =>
      _$VarieteObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$VarieteObjectToJson(this);
}

/* ------------------------ TypeChargeObject --------------------------- */
@Entity()
class TypeChargeObject {
  @Id(assignable: true)
  int id;
  String name;
  TypeChargeObject({required this.id, required this.name});
}

/* ------------------------ TypeChargeExploitationObject --------------------------- */
List<TypeChargeExploitationObject> TypeChargeExploitationObjectFromJson(
        String str) =>
    List<TypeChargeExploitationObject>.from(
        json.decode(str).map((x) => TypeChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class TypeChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  TypeChargeExploitationObject({required this.id, required this.name});

  /// factory.
  factory TypeChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$TypeChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$TypeChargeExploitationObjectToJson(this);
}

/* ------------------------ FamilleChargeExploitationObject --------------------------- */

List<FamilleChargeExploitationObject> FamilleChargeExploitationObjectFromJson(
        String str) =>
    List<FamilleChargeExploitationObject>.from(json
        .decode(str)
        .map((x) => FamilleChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class FamilleChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  FamilleChargeExploitationObject({required this.id, required this.name});

  /// factory.
  factory FamilleChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$FamilleChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() =>
      _$FamilleChargeExploitationObjectToJson(this);
}

/* ------------------------ TypeOpObject --------------------------- */
List<TypeOpObject> TypeOpObjectFromJson(String str) => List<TypeOpObject>.from(
    json.decode(str).map((x) => TypeOpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class TypeOpObject {
  @Id(assignable: true)
  int id;
  String name;
  TypeOpObject({required this.id, required this.name});

  /// factory.
  factory TypeOpObject.fromJson(Map<String, dynamic> json) =>
      _$TypeOpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$TypeOpObjectToJson(this);
}

/* ------------------------ EmballageObject --------------------------- */
List<EmballageObject> EmballageObjectFromJson(String str) =>
    List<EmballageObject>.from(
        json.decode(str).map((x) => EmballageObject.fromJson(x)));

@JsonSerializable()
@Entity()
class EmballageObject {
  @Id(assignable: true)
  int id;
  String name;
  String conditionnement;
  bool is_actif;
  double quantite;
  int produitid;
  String produitname;
  int typeemballageid;
  String typeemballagename;
  int unitegrandeurid;
  String typeunitegrandeurname;
  double valeur;
  bool is_default;

  EmballageObject({
    required this.id,
    required this.name,
    required this.conditionnement,
    required this.is_actif,
    required this.quantite,
    required this.produitid,
    required this.produitname,
    required this.typeemballageid,
    required this.typeemballagename,
    required this.unitegrandeurid,
    required this.typeunitegrandeurname,
    required this.valeur,
    required this.is_default,
  });

  /// factory.
  factory EmballageObject.fromJson(Map<String, dynamic> json) =>
      _$EmballageObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$EmballageObjectToJson(this);
}

/* ------------------------ ChargeExploitationObject --------------------------- */
List<ChargeExploitationObject> ChargeExploitationObjectFromJson(String str) =>
    List<ChargeExploitationObject>.from(
        json.decode(str).map((x) => ChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  String unite;
  double pu;
  double quantite_unite_superficie;
  int produitid;
  String produitname;
  int famillechargeexploitationid;
  String famillechargeexploitationname;
  int typechargeexploitationid;
  String typechargeexploitationname;
  bool is_achat;

  ChargeExploitationObject({
    required this.id,
    required this.name,
    required this.unite,
    required this.pu,
    required this.quantite_unite_superficie,
    required this.produitid,
    required this.produitname,
    required this.typechargeexploitationid,
    required this.typechargeexploitationname,
    required this.famillechargeexploitationid,
    required this.famillechargeexploitationname,
    required this.is_achat,
  });

  /// factory.
  factory ChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$ChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ChargeExploitationObjectToJson(this);
}

/* ------------------------ ExploitationObject --------------------------- */
List<ExploitationObject> ExploitationObjectFromJson(String str) =>
    List<ExploitationObject>.from(
        json.decode(str).map((x) => ExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ExploitationObject {
  @Id(assignable: true)
  int id;

  int exploitation_id;
  int compte;
  DateTime date;
  String unite;
  double production_prevision;
  double surface_prevision;
  double pu_prevision;
  int varieteprevisionid;
  String varieteprevisionname;
  double production;
  double surface;
  double pu;
  int varieteid;
  String varietename;
  int produitid;
  String produitname;
  int filiereid;
  String filierename;
  int anneeid;
  String anneename;
  int saisonid;
  String saisonname;

  double varietepu;

  int emballageid;
  String emballagename;
  double emballagequantite;
  double emballagepu;
  int emballagetypeemballageid;
  String emballagetypeemballagename;
  int emballageunitegrandeurid;
  String emballageunitegrandeurname;
  double emballageunitevaleurreference;

  int producteurid;
  String prenom;
  String nom;
  int opid;
  String opname;
  int typeopid;
  String typeopname;

  ExploitationObject({
    required this.id,
    required this.date,
    required this.producteurid,
    required this.prenom,
    required this.nom,
    required this.opid,
    required this.opname,
    required this.typeopid,
    required this.typeopname,
    required this.exploitation_id,
    required this.compte,
    required this.unite,
    required this.production_prevision,
    required this.surface_prevision,
    required this.pu_prevision,
    required this.varieteprevisionid,
    required this.varieteprevisionname,
    required this.production,
    required this.surface,
    required this.pu,
    required this.varieteid,
    required this.varietename,
    required this.produitid,
    required this.produitname,
    required this.filiereid,
    required this.filierename,
    required this.anneeid,
    required this.anneename,
    required this.saisonid,
    required this.saisonname,
    required this.varietepu,
    required this.emballageid,
    required this.emballagename,
    required this.emballagequantite,
    required this.emballagepu,
    required this.emballagetypeemballageid,
    required this.emballagetypeemballagename,
    required this.emballageunitegrandeurid,
    required this.emballageunitegrandeurname,
    required this.emballageunitevaleurreference,
  });

  static final empty = ExploitationObject(
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
    surface: 0,
    production: 0,
    pu: 0,
    filiereid: 0,
    filierename: '',
    produitid: 0,
    produitname: '',
    varieteid: 0,
    varietename: '',
    varietepu: 0,
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

  /// factory.
  factory ExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$ExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ExploitationObjectToJson(this);
}

/* ------------------------ ChargeExploitationObject --------------------------- */
List<ExploitationChargeExploitationObject>
    ExploitationChargeExploitationObjectFromJson(String str) =>
        List<ExploitationChargeExploitationObject>.from(json
            .decode(str)
            .map((x) => ExploitationChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ExploitationChargeExploitationObject {
  @Id(assignable: true)
  int id;
  int exploitationchargeexploitationid;
  DateTime date;
  String unite;
  double pu;
  double quantite;
  double valeur;
  String? observation;
  int chargeexploitationid;
  String chargeexploitationname;
  int typechargeexploitationid;
  String typechargeexploitationname;
  int famillechargeexploitationid;
  String famillechargeexploitationname;
  int exploitationid;

  ExploitationChargeExploitationObject({
    required this.id,
    required this.exploitationchargeexploitationid,
    required this.date,
    required this.unite,
    required this.pu,
    required this.quantite,
    required this.valeur,
    required this.observation,
    required this.chargeexploitationid,
    required this.chargeexploitationname,
    required this.typechargeexploitationid,
    required this.typechargeexploitationname,
    required this.famillechargeexploitationid,
    required this.famillechargeexploitationname,
    required this.exploitationid,
  });

  /// factory.
  factory ExploitationChargeExploitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$ExploitationChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() =>
      _$ExploitationChargeExploitationObjectToJson(this);
}

/* ------------------------ ProducteurObject --------------------------- */
List<ProducteurObject> ProducteurObjectFromJson(String str) =>
    List<ProducteurObject>.from(
        json.decode(str).map((x) => ProducteurObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ProducteurObject {
  @Id(assignable: true)
  int id;
  String? prenom;
  String? nom;
  String? cni;
  String? email;
  String? telephone;
  String? adresse;
  int? opid;
  String? opname;
  int? typeopid;
  String? typeopname;
  bool is_actif;

  ProducteurObject(
      {required this.id,
      required this.prenom,
      required this.email,
      required this.telephone,
      required this.adresse,
      required this.nom,
      required this.cni,
      required this.opid,
      required this.opname,
      required this.typeopid,
      required this.typeopname,
      required this.is_actif});

  /// factory.
  factory ProducteurObject.fromJson(Map<String, dynamic> json) =>
      _$ProducteurObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ProducteurObjectToJson(this);
}

/* ------------------------ OpObject --------------------------- */
List<OpObject> OpObjectFromJson(String str) =>
    List<OpObject>.from(json.decode(str).map((x) => OpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class OpObject {
  @Id(assignable: true)
  int id;
  String name;
  String? email;
  String? telephone;
  String? adresse;
  bool is_actif;
  int type_op_id;
  String type_op_name;
  int? localite_id;
  String? localite_name;
  int? sous_zone_id;
  String? sous_zone_name;
  int? zone_id;
  String? zone_name;
  int? departement_id;
  String? departement_name;
  int? region_id;
  String? region_name;
  int? pays_id;
  String? pays_name;

  OpObject({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.is_actif,
    required this.type_op_id,
    required this.type_op_name,
    required this.localite_id,
    required this.localite_name,
    required this.sous_zone_id,
    required this.sous_zone_name,
    required this.zone_id,
    required this.zone_name,
    required this.departement_id,
    required this.departement_name,
    required this.region_id,
    required this.region_name,
    required this.pays_id,
    required this.pays_name,
  });

  /// factory.
  factory OpObject.fromJson(Map<String, dynamic> json) =>
      _$OpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$OpObjectToJson(this);
}

/* ------------------------ UserOpOpObject --------------------------- */
List<UserOpObject> UserOpObjectFromJson(String str) => List<UserOpObject>.from(
    json.decode(str).map((x) => UserOpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UserOpObject {
  @Id(assignable: true)
  int id;
  int userid;
  int typeopid;
  String typeopname;
  int opid;
  String opname;
  UserOpObject(
      {required this.id,
      required this.userid,
      required this.typeopid,
      required this.typeopname,
      required this.opid,
      required this.opname});

  /// factory.
  factory UserOpObject.fromJson(Map<String, dynamic> json) =>
      _$UserOpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UserOpObjectToJson(this);
}

/* ------------------------ UserPointObject --------------------------- */
List<UserPointObject> UserPointObjectFromJson(String str) =>
    List<UserPointObject>.from(
        json.decode(str).map((x) => UserPointObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UserPointObject {
  @Id(assignable: true)
  int id;
  int userid;
  int pointid;
  String pointname;

  UserPointObject({
    required this.id,
    required this.userid,
    required this.pointid,
    required this.pointname,
  });

  /// factory.
  factory UserPointObject.fromJson(Map<String, dynamic> json) =>
      _$UserPointObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UserPointObjectToJson(this);
}

/* ------------------------ UserUniteTransformationOpObject --------------------------- */
List<UserUniteTransformationObject> UserUniteTransformationObjectFromJson(
        String str) =>
    List<UserUniteTransformationObject>.from(
        json.decode(str).map((x) => UserUniteTransformationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UserUniteTransformationObject {
  @Id(assignable: true)
  int id;
  int userid;
  int typeunitetransformationid;
  String typeunitetransformationname;
  int unitetransformationid;
  String unitetransformationname;
  int societeid;
  String societename;
  UserUniteTransformationObject(
      {required this.id,
      required this.userid,
      required this.typeunitetransformationid,
      required this.typeunitetransformationname,
      required this.unitetransformationid,
      required this.unitetransformationname,
      required this.societeid,
      required this.societename});

  /// factory.
  factory UserUniteTransformationObject.fromJson(Map<String, dynamic> json) =>
      _$UserUniteTransformationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UserUniteTransformationObjectToJson(this);
}

/* ------------------------ StructureOpObject --------------------------- */
List<StructureObject> StructureObjectFromJson(String str) =>
    List<StructureObject>.from(
        json.decode(str).map((x) => StructureObject.fromJson(x)));

@JsonSerializable()
@Entity()
class StructureObject {
  @Id(assignable: true)
  int id;
  String name;
  String sigle;
  String telephone;
  String adresse;
  int souszoneid;
  String souszonename;
  int zoneid;
  String zonename;
  int paysid;
  String paysname;
  StructureObject(
      {required this.id,
      required this.name,
      required this.sigle,
      required this.telephone,
      required this.adresse,
      required this.souszoneid,
      required this.souszonename,
      required this.zoneid,
      required this.zonename,
      required this.paysid,
      required this.paysname});

  /// factory.
  factory StructureObject.fromJson(Map<String, dynamic> json) =>
      _$StructureObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$StructureObjectToJson(this);
}

/* ------------------------ UniteTransformationOpObject --------------------------- */
List<UniteTransformationObject> UniteTransformationObjectFromJson(String str) =>
    List<UniteTransformationObject>.from(
        json.decode(str).map((x) => UniteTransformationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UniteTransformationObject {
  @Id(assignable: true)
  int id;
  int societeid;
  String societename;
  int typetransformationid;
  String typetransformationname;
  UniteTransformationObject(
      {required this.id,
      required this.societeid,
      required this.societename,
      required this.typetransformationid,
      required this.typetransformationname});

  /// factory.
  factory UniteTransformationObject.fromJson(Map<String, dynamic> json) =>
      _$UniteTransformationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UniteTransformationObjectToJson(this);
}

/* ------------------------ UniteTransformationEtapeOpObject --------------------------- */
List<UniteTransformationEtapeObject> UniteTransformationEtapeObjectFromJson(
        String str) =>
    List<UniteTransformationEtapeObject>.from(json
        .decode(str)
        .map((x) => UniteTransformationEtapeObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UniteTransformationEtapeObject {
  @Id(assignable: true)
  int id;
  int unitetransformationid;
  String unitetransformationname;
  int etapeid;
  String etapename;
  int etapenumero;
  bool is_actif;

  UniteTransformationEtapeObject(
      {required this.id,
      required this.unitetransformationid,
      required this.unitetransformationname,
      required this.etapeid,
      required this.etapename,
      required this.etapenumero,
      required this.is_actif});

  /// factory.
  factory UniteTransformationEtapeObject.fromJson(Map<String, dynamic> json) =>
      _$UniteTransformationEtapeObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UniteTransformationEtapeObjectToJson(this);
}

/* ------------------------ UsinageOpObject --------------------------- */
List<UsinageObject> UsinageObjectFromJson(String str) =>
    List<UsinageObject>.from(
        json.decode(str).map((x) => UsinageObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UsinageObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  DateTime heure_debut;
  DateTime heure_fin;
  double nombre_personne;
  double taux;
  int unitetransformationid;
  String unitetransformationname;
  int varieteid;
  String varietename;
  String observation;
  UsinageObject(
      {required this.id,
      required this.date,
      required this.heure_debut,
      required this.heure_fin,
      required this.nombre_personne,
      required this.taux,
      required this.unitetransformationid,
      required this.unitetransformationname,
      required this.varieteid,
      required this.varietename,
      required this.observation});

  /// factory.
  factory UsinageObject.fromJson(Map<String, dynamic> json) =>
      _$UsinageObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UsinageObjectToJson(this);
}

/* ------------------------ UsinageProduitEntreeOpObject --------------------------- */
List<UsinageProduitEntreeObject> UsinageProduitEntreeObjectFromJson(
        String str) =>
    List<UsinageProduitEntreeObject>.from(
        json.decode(str).map((x) => UsinageProduitEntreeObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UsinageProduitEntreeObject {
  @Id(assignable: true)
  int id;
  double quantite;
  int usinageid;
  int produitentreeid;
  String produitentreename;

  UsinageProduitEntreeObject(
      {required this.id,
      required this.quantite,
      required this.usinageid,
      required this.produitentreeid,
      required this.produitentreename});

  /// factory.
  factory UsinageProduitEntreeObject.fromJson(Map<String, dynamic> json) =>
      _$UsinageProduitEntreeObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UsinageProduitEntreeObjectToJson(this);
}

/* ------------------------ UsinageProduitSortieOpObject --------------------------- */
List<UsinageProduitSortieObject> UsinageProduitSortieObjectFromJson(
        String str) =>
    List<UsinageProduitSortieObject>.from(
        json.decode(str).map((x) => UsinageProduitSortieObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UsinageProduitSortieObject {
  @Id(assignable: true)
  int id;
  double quantite;
  int usinageid;
  int produitsortieid;
  String produitsortiename;

  UsinageProduitSortieObject(
      {required this.id,
      required this.quantite,
      required this.usinageid,
      required this.produitsortieid,
      required this.produitsortiename});

  /// factory.
  factory UsinageProduitSortieObject.fromJson(Map<String, dynamic> json) =>
      _$UsinageProduitSortieObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UsinageProduitSortieObjectToJson(this);
}

/* ------------------------ EtapeOpObject --------------------------- */
List<EtapeObject> EtapeObjectFromJson(String str) => List<EtapeObject>.from(
    json.decode(str).map((x) => EtapeObject.fromJson(x)));

@JsonSerializable()
@Entity()
class EtapeObject {
  @Id(assignable: true)
  int id;
  String name;
  int typetransformationid;
  String typetransformationname;
  int produitopid;
  String produitname;

  EtapeObject(
      {required this.id,
      required this.name,
      required this.typetransformationid,
      required this.typetransformationname,
      required this.produitopid,
      required this.produitname});

  /// factory.
  factory EtapeObject.fromJson(Map<String, dynamic> json) =>
      _$EtapeObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$EtapeObjectToJson(this);
}

/* ------------------------ TypeTransformationOpObject --------------------------- */
List<TypeTransformationObject> TypeTransformationObjectFromJson(String str) =>
    List<TypeTransformationObject>.from(
        json.decode(str).map((x) => TypeTransformationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class TypeTransformationObject {
  @Id(assignable: true)
  int id;
  String name;
  int produitopid;
  String produitname;
  int filiereid;
  String filierename;

  TypeTransformationObject(
      {required this.id,
      required this.name,
      required this.produitopid,
      required this.produitname,
      required this.filiereid,
      required this.filierename});

  /// factory.
  factory TypeTransformationObject.fromJson(Map<String, dynamic> json) =>
      _$TypeTransformationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$TypeTransformationObjectToJson(this);
}

/* ------------------------ ProduitEntreeOpObject --------------------------- */
List<ProduitEntreeObject> ProduitEntreeObjectFromJson(String str) =>
    List<ProduitEntreeObject>.from(
        json.decode(str).map((x) => ProduitEntreeObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ProduitEntreeObject {
  @Id(assignable: true)
  int id;
  int produitopid;
  String produitname;
  int etapeid;
  String etapename;

  ProduitEntreeObject(
      {required this.id,
      required this.produitopid,
      required this.produitname,
      required this.etapeid,
      required this.etapename});

  /// factory.
  factory ProduitEntreeObject.fromJson(Map<String, dynamic> json) =>
      _$ProduitEntreeObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ProduitEntreeObjectToJson(this);
}

/* ------------------------ ProduitSortieOpObject --------------------------- */
List<ProduitSortieObject> ProduitSortieObjectFromJson(String str) =>
    List<ProduitSortieObject>.from(
        json.decode(str).map((x) => ProduitSortieObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ProduitSortieObject {
  @Id(assignable: true)
  int id;
  int produitopid;
  String produitname;
  int etapeid;
  String etapename;

  ProduitSortieObject(
      {required this.id,
      required this.produitopid,
      required this.produitname,
      required this.etapeid,
      required this.etapename});

  /// factory.
  factory ProduitSortieObject.fromJson(Map<String, dynamic> json) =>
      _$ProduitSortieObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ProduitSortieObjectToJson(this);
}

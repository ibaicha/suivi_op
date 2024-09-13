// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectBoxModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MxPostObject _$MxPostObjectFromJson(Map<String, dynamic> json) => MxPostObject(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$MxPostObjectToJson(MxPostObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

MxCommentObject _$MxCommentObjectFromJson(Map<String, dynamic> json) =>
    MxCommentObject(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      post: json['post'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxCommentObjectToJson(MxCommentObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'post': instance.post,
    };

MxAnneeObject _$MxAnneeObjectFromJson(Map<String, dynamic> json) =>
    MxAnneeObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      valeur: (json['valeur'] as num).toInt(),
    );

Map<String, dynamic> _$MxAnneeObjectToJson(MxAnneeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'valeur': instance.valeur,
    };

MxSaisonObject _$MxSaisonObjectFromJson(Map<String, dynamic> json) =>
    MxSaisonObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MxSaisonObjectToJson(MxSaisonObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

MxCampagneObject _$MxCampagneObjectFromJson(Map<String, dynamic> json) =>
    MxCampagneObject(
      id: (json['id'] as num).toInt(),
      annee: json['annee'] as Map<String, dynamic>?,
      saison: json['saison'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxCampagneObjectToJson(MxCampagneObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'annee': instance.annee,
      'saison': instance.saison,
    };

MxRoleObject _$MxRoleObjectFromJson(Map<String, dynamic> json) => MxRoleObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxRoleObjectToJson(MxRoleObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxUserObject _$MxUserObjectFromJson(Map<String, dynamic> json) => MxUserObject(
      id: (json['id'] as num).toInt(),
      token: json['token'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      roleId: (json['roleId'] as num).toInt(),
      roleName: json['roleName'] as String,
    );

Map<String, dynamic> _$MxUserObjectToJson(MxUserObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'address': instance.address,
      'roleId': instance.roleId,
      'roleName': instance.roleName,
    };

MxUserPermissionObject _$MxUserPermissionObjectFromJson(
        Map<String, dynamic> json) =>
    MxUserPermissionObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxUserPermissionObjectToJson(
        MxUserPermissionObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxTypeMouvementStockObject _$MxTypeMouvementStockObjectFromJson(
        Map<String, dynamic> json) =>
    MxTypeMouvementStockObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeMouvementStockObjectToJson(
        MxTypeMouvementStockObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxTypeMouvementIntrantObject _$MxTypeMouvementIntrantObjectFromJson(
        Map<String, dynamic> json) =>
    MxTypeMouvementIntrantObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeMouvementIntrantObjectToJson(
        MxTypeMouvementIntrantObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxModeEntreeSortieStockObject _$MxModeEntreeSortieStockObjectFromJson(
        Map<String, dynamic> json) =>
    MxModeEntreeSortieStockObject(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      typeMouvementStock: json['typeMouvementStock'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxModeEntreeSortieStockObjectToJson(
        MxModeEntreeSortieStockObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'typeMouvementStock': instance.typeMouvementStock,
    };

MxModeEntreeSortieIntrantObject _$MxModeEntreeSortieIntrantObjectFromJson(
        Map<String, dynamic> json) =>
    MxModeEntreeSortieIntrantObject(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      typeMouvementIntrant:
          json['typeMouvementIntrant'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxModeEntreeSortieIntrantObjectToJson(
        MxModeEntreeSortieIntrantObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'typeMouvementIntrant': instance.typeMouvementIntrant,
    };

MxUniteTransformationObject _$MxUniteTransformationObjectFromJson(
        Map<String, dynamic> json) =>
    MxUniteTransformationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
      adresse: json['adresse'] as String,
      telephone: json['telephone'] as String,
    );

Map<String, dynamic> _$MxUniteTransformationObjectToJson(
        MxUniteTransformationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
      'adresse': instance.adresse,
      'telephone': instance.telephone,
    };

MxMouvementStockObject _$MxMouvementStockObjectFromJson(
        Map<String, dynamic> json) =>
    MxMouvementStockObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      pu: (json['pu'] as num).toDouble(),
      quantiteEntreeEmballage:
          (json['quantiteEntreeEmballage'] as num).toDouble(),
      quantiteSortieEmballage:
          (json['quantiteSortieEmballage'] as num).toDouble(),
      nombreUnite: (json['nombreUnite'] as num).toDouble(),
      valeur: (json['valeur'] as num).toDouble(),
      lot: json['lot'] as String,
      isSended: json['isSended'] as bool,
      dateSended: json['dateSended'] == null
          ? null
          : DateTime.parse(json['dateSended'] as String),
      annee: json['annee'] as Map<String, dynamic>?,
      saison: json['saison'] as Map<String, dynamic>?,
      emballage: json['emballage'] as Map<String, dynamic>?,
      op: json['op'] as Map<String, dynamic>?,
      uniteTransformation: json['uniteTransformation'] as Map<String, dynamic>?,
      variete: json['variete'] as Map<String, dynamic>?,
      modeEntreeSortieStock:
          json['modeEntreeSortieStock'] as Map<String, dynamic>?,
      emplacement: json['emplacement'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxMouvementStockObjectToJson(
        MxMouvementStockObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'pu': instance.pu,
      'quantiteEntreeEmballage': instance.quantiteEntreeEmballage,
      'quantiteSortieEmballage': instance.quantiteSortieEmballage,
      'nombreUnite': instance.nombreUnite,
      'valeur': instance.valeur,
      'lot': instance.lot,
      'isSended': instance.isSended,
      'dateSended': instance.dateSended?.toIso8601String(),
      'annee': instance.annee,
      'saison': instance.saison,
      'variete': instance.variete,
      'emballage': instance.emballage,
      'op': instance.op,
      'uniteTransformation': instance.uniteTransformation,
      'modeEntreeSortieStock': instance.modeEntreeSortieStock,
      'emplacement': instance.emplacement,
    };

MxMouvementIntrantObject _$MxMouvementIntrantObjectFromJson(
        Map<String, dynamic> json) =>
    MxMouvementIntrantObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      pu: (json['pu'] as num).toDouble(),
      quantiteEntreeEmballage:
          (json['quantiteEntreeEmballage'] as num).toDouble(),
      quantiteSortieEmballage:
          (json['quantiteSortieEmballage'] as num).toDouble(),
      nombreUnite: (json['nombreUnite'] as num).toDouble(),
      valeur: (json['valeur'] as num).toDouble(),
      lot: json['lot'] as String,
      annee: json['annee'] as Map<String, dynamic>?,
      saison: json['saison'] as Map<String, dynamic>?,
      emballage: json['emballage'] as Map<String, dynamic>?,
      op: json['op'] as Map<String, dynamic>?,
      fournisseur: json['fournisseur'] as Map<String, dynamic>?,
      uniteTransformation: json['uniteTransformation'] as Map<String, dynamic>?,
      variete: json['variete'] as Map<String, dynamic>?,
      modeEntreeSortieIntrant:
          json['modeEntreeSortieIntrant'] as Map<String, dynamic>?,
      emplacement: json['emplacement'] as Map<String, dynamic>?,
      emplacementSource: json['emplacementSource'] as Map<String, dynamic>?,
      emplacementDestination:
          json['emplacementDestination'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxMouvementIntrantObjectToJson(
        MxMouvementIntrantObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'pu': instance.pu,
      'quantiteEntreeEmballage': instance.quantiteEntreeEmballage,
      'quantiteSortieEmballage': instance.quantiteSortieEmballage,
      'nombreUnite': instance.nombreUnite,
      'valeur': instance.valeur,
      'lot': instance.lot,
      'annee': instance.annee,
      'saison': instance.saison,
      'variete': instance.variete,
      'emballage': instance.emballage,
      'op': instance.op,
      'fournisseur': instance.fournisseur,
      'uniteTransformation': instance.uniteTransformation,
      'modeEntreeSortieIntrant': instance.modeEntreeSortieIntrant,
      'emplacement': instance.emplacement,
      'emplacementSource': instance.emplacementSource,
      'emplacementDestination': instance.emplacementDestination,
    };

MxEntrepotObject _$MxEntrepotObjectFromJson(Map<String, dynamic> json) =>
    MxEntrepotObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      adresse: json['adresse'] as String,
      point: json['point'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxEntrepotObjectToJson(MxEntrepotObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adresse': instance.adresse,
      'point': instance.point,
    };

MxEmplacementObject _$MxEmplacementObjectFromJson(Map<String, dynamic> json) =>
    MxEmplacementObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: (json['code'] as num?)?.toInt(),
      capacite: (json['capacite'] as num).toDouble(),
      entrepot: json['entrepot'] as Map<String, dynamic>?,
      familleEmplacement: json['familleEmplacement'],
    );

Map<String, dynamic> _$MxEmplacementObjectToJson(
        MxEmplacementObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'capacite': instance.capacite,
      'entrepot': instance.entrepot,
      'familleEmplacement': instance.familleEmplacement,
    };

MxTypeChargeExploitationObject _$MxTypeChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    MxTypeChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeChargeExploitationObjectToJson(
        MxTypeChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxFamilleChargeExploitationObject _$MxFamilleChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    MxFamilleChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxFamilleChargeExploitationObjectToJson(
        MxFamilleChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxChargeExploitationObject _$MxChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    MxChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      unite: json['unite'] as String,
      pu: (json['pu'] as num).toDouble(),
      quantite_unite_superficie:
          (json['quantite_unite_superficie'] as num).toDouble(),
      isAchat: json['isAchat'] as bool,
      isProduit: json['isProduit'] as bool,
      isIntrant: json['isIntrant'] as bool,
      uniteGrandeur: json['uniteGrandeur'] as Map<String, dynamic>?,
      typeChargeExploitation:
          json['typeChargeExploitation'] as Map<String, dynamic>?,
      familleChargeExploitation:
          json['familleChargeExploitation'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxChargeExploitationObjectToJson(
        MxChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unite': instance.unite,
      'pu': instance.pu,
      'quantite_unite_superficie': instance.quantite_unite_superficie,
      'isAchat': instance.isAchat,
      'isProduit': instance.isProduit,
      'isIntrant': instance.isIntrant,
      'uniteGrandeur': instance.uniteGrandeur,
      'typeChargeExploitation': instance.typeChargeExploitation,
      'familleChargeExploitation': instance.familleChargeExploitation,
    };

MxExploitationObject _$MxExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    MxExploitationObject(
      id: (json['id'] as num).toInt(),
      compte: (json['compte'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      unite: json['unite'] as String,
      surface: (json['surface'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      agence: json['agence'] as Map<String, dynamic>?,
      variete: json['variete'] as Map<String, dynamic>?,
      annee: json['annee'] as Map<String, dynamic>?,
      saison: json['saison'] as Map<String, dynamic>?,
      producteur: json['producteur'] as Map<String, dynamic>?,
      op: json['op'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxExploitationObjectToJson(
        MxExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'compte': instance.compte,
      'date': instance.date.toIso8601String(),
      'unite': instance.unite,
      'surface': instance.surface,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'agence': instance.agence,
      'variete': instance.variete,
      'annee': instance.annee,
      'saison': instance.saison,
      'producteur': instance.producteur,
      'op': instance.op,
    };

MxExploitationChargeExploitationObject
    _$MxExploitationChargeExploitationObjectFromJson(
            Map<String, dynamic> json) =>
        MxExploitationChargeExploitationObject(
          id: (json['id'] as num).toInt(),
          pu: (json['pu'] as num).toDouble(),
          quantite: (json['quantite'] as num).toDouble(),
          valeur: (json['valeur'] as num).toDouble(),
          unite: json['unite'] as String,
          date: DateTime.parse(json['date'] as String),
          observation: json['observation'] as String,
          exploitation: json['exploitation'] as Map<String, dynamic>?,
          chargeExploitation:
              json['chargeExploitation'] as Map<String, dynamic>?,
        )
          ..createdAt = json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String)
          ..updatedAt = json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String);

Map<String, dynamic> _$MxExploitationChargeExploitationObjectToJson(
        MxExploitationChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pu': instance.pu,
      'quantite': instance.quantite,
      'valeur': instance.valeur,
      'unite': instance.unite,
      'date': instance.date.toIso8601String(),
      'observation': instance.observation,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'exploitation': instance.exploitation,
      'chargeExploitation': instance.chargeExploitation,
    };

MxRecolteObject _$MxRecolteObjectFromJson(Map<String, dynamic> json) =>
    MxRecolteObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      pu: (json['pu'] as num).toDouble(),
      nombre_unite: (json['nombre_unite'] as num).toDouble(),
      nombre_emballage: (json['nombre_emballage'] as num).toDouble(),
      valeur: (json['valeur'] as num).toDouble(),
      variete: json['variete'] as Map<String, dynamic>?,
      exploitation: json['exploitation'] as Map<String, dynamic>?,
      emballage: json['emballage'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxRecolteObjectToJson(MxRecolteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'pu': instance.pu,
      'nombre_unite': instance.nombre_unite,
      'nombre_emballage': instance.nombre_emballage,
      'valeur': instance.valeur,
      'variete': instance.variete,
      'exploitation': instance.exploitation,
      'emballage': instance.emballage,
    };

MxTypeSocieteObject _$MxTypeSocieteObjectFromJson(Map<String, dynamic> json) =>
    MxTypeSocieteObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeSocieteObjectToJson(
        MxTypeSocieteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxSocieteObject _$MxSocieteObjectFromJson(Map<String, dynamic> json) =>
    MxSocieteObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
      email: json['email'] as String,
      adresse: json['adresse'] as String,
      telephone: json['telephone'] as String,
      typeSociete: json['typeSociete'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxSocieteObjectToJson(MxSocieteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
      'email': instance.email,
      'adresse': instance.adresse,
      'telephone': instance.telephone,
      'typeSociete': instance.typeSociete,
    };

MxAgenceObject _$MxAgenceObjectFromJson(Map<String, dynamic> json) =>
    MxAgenceObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
    );

Map<String, dynamic> _$MxAgenceObjectToJson(MxAgenceObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
    };

MxCreditObject _$MxCreditObjectFromJson(Map<String, dynamic> json) =>
    MxCreditObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      capital: (json['capital'] as num).toDouble(),
      interet: (json['interet'] as num).toDouble(),
      moratoire: (json['moratoire'] as num).toDouble(),
      autres_engagements: (json['autres_engagements'] as num).toDouble(),
      exploitation: json['exploitation'] as Map<String, dynamic>?,
      agence: json['agence'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxCreditObjectToJson(MxCreditObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'capital': instance.capital,
      'interet': instance.interet,
      'moratoire': instance.moratoire,
      'autres_engagements': instance.autres_engagements,
      'exploitation': instance.exploitation,
      'agence': instance.agence,
    };

MxTypeRemboursementObject _$MxTypeRemboursementObjectFromJson(
        Map<String, dynamic> json) =>
    MxTypeRemboursementObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeRemboursementObjectToJson(
        MxTypeRemboursementObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxRemboursementObject _$MxRemboursementObjectFromJson(
        Map<String, dynamic> json) =>
    MxRemboursementObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      pu: (json['pu'] as num).toDouble(),
      nombre_unite: (json['nombre_unite'] as num).toDouble(),
      nombre_emballage: (json['nombre_emballage'] as num).toDouble(),
      valeur: (json['valeur'] as num).toDouble(),
      variete: json['variete'] as Map<String, dynamic>?,
      exploitation: json['exploitation'] as Map<String, dynamic>?,
      emballage: json['emballage'] as Map<String, dynamic>?,
      typeRemboursement: json['typeRemboursement'] as Map<String, dynamic>?,
      point: json['point'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxRemboursementObjectToJson(
        MxRemboursementObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'pu': instance.pu,
      'nombre_unite': instance.nombre_unite,
      'nombre_emballage': instance.nombre_emballage,
      'valeur': instance.valeur,
      'typeRemboursement': instance.typeRemboursement,
      'variete': instance.variete,
      'exploitation': instance.exploitation,
      'emballage': instance.emballage,
      'point': instance.point,
    };

MxFamilleEmplacementObject _$MxFamilleEmplacementObjectFromJson(
        Map<String, dynamic> json) =>
    MxFamilleEmplacementObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxFamilleEmplacementObjectToJson(
        MxFamilleEmplacementObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxFiliereObject _$MxFiliereObjectFromJson(Map<String, dynamic> json) =>
    MxFiliereObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxFiliereObjectToJson(MxFiliereObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxProduitObject _$MxProduitObjectFromJson(Map<String, dynamic> json) =>
    MxProduitObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isDerive: json['isDerive'] as bool,
      isEnsachage: json['isEnsachage'] as bool,
      isActive: json['isActive'] as bool,
      filiere: json['filiere'] as Map<String, dynamic>?,
      familleEmplacement: json['familleEmplacement'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxProduitObjectToJson(MxProduitObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDerive': instance.isDerive,
      'isEnsachage': instance.isEnsachage,
      'isActive': instance.isActive,
      'filiere': instance.filiere,
      'familleEmplacement': instance.familleEmplacement,
    };

MxVarieteObject _$MxVarieteObjectFromJson(Map<String, dynamic> json) =>
    MxVarieteObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surface_unite: json['surface_unite'] as String?,
      quantite_unite: json['quantite_unite'] as String?,
      pu_unite: (json['pu_unite'] as num?)?.toDouble(),
      rendement_unite: (json['rendement_unite'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool,
      produit: json['produit'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxVarieteObjectToJson(MxVarieteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surface_unite': instance.surface_unite,
      'quantite_unite': instance.quantite_unite,
      'pu_unite': instance.pu_unite,
      'rendement_unite': instance.rendement_unite,
      'isActive': instance.isActive,
      'produit': instance.produit,
    };

MxProduitChargeExploitationObject _$MxProduitChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    MxProduitChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      produit: json['produit'] as Map<String, dynamic>?,
      chargeExploitation: json['chargeExploitation'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxProduitChargeExploitationObjectToJson(
        MxProduitChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'produit': instance.produit,
      'chargeExploitation': instance.chargeExploitation,
    };

MxTypeOpObject _$MxTypeOpObjectFromJson(Map<String, dynamic> json) =>
    MxTypeOpObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeOpObjectToJson(MxTypeOpObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxOpObject _$MxOpObjectFromJson(Map<String, dynamic> json) => MxOpObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
      email: json['email'] as String,
      telephone: json['telephone'] as String,
      adresse: json['adresse'] as String,
      prenom_contact: json['prenom_contact'] as String,
      nom_contact: json['nom_contact'] as String,
      email_contact: json['email_contact'] as String,
      telephone_contact: json['telephone_contact'] as String,
      typeOp: json['typeOp'] as Map<String, dynamic>?,
      village: json['village'] as Map<String, dynamic>?,
      localite: json['localite'] as Map<String, dynamic>?,
      point: json['point'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxOpObjectToJson(MxOpObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
      'email': instance.email,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'prenom_contact': instance.prenom_contact,
      'nom_contact': instance.nom_contact,
      'email_contact': instance.email_contact,
      'telephone_contact': instance.telephone_contact,
      'typeOp': instance.typeOp,
      'village': instance.village,
      'localite': instance.localite,
      'point': instance.point,
    };

MxProducteurObject _$MxProducteurObjectFromJson(Map<String, dynamic> json) =>
    MxProducteurObject(
      id: (json['id'] as num).toInt(),
      compte: (json['compte'] as num).toInt(),
      prenom: json['prenom'] as String,
      email: json['email'] as String,
      telephone: json['telephone'] as String,
      adresse: json['adresse'] as String,
      nom: json['nom'] as String,
      cni: json['cni'] as String,
      isActive: json['isActive'] as bool,
      op: json['op'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxProducteurObjectToJson(MxProducteurObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'compte': instance.compte,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'cni': instance.cni,
      'email': instance.email,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'isActive': instance.isActive,
      'op': instance.op,
    };

MxPaysObject _$MxPaysObjectFromJson(Map<String, dynamic> json) => MxPaysObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
    );

Map<String, dynamic> _$MxPaysObjectToJson(MxPaysObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
    };

MxZoneObject _$MxZoneObjectFromJson(Map<String, dynamic> json) => MxZoneObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      pays: json['pays'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxZoneObjectToJson(MxZoneObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pays': instance.pays,
    };

MxSousZoneObject _$MxSousZoneObjectFromJson(Map<String, dynamic> json) =>
    MxSousZoneObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      zone: json['zone'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxSousZoneObjectToJson(MxSousZoneObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'zone': instance.zone,
    };

MxLocaliteObject _$MxLocaliteObjectFromJson(Map<String, dynamic> json) =>
    MxLocaliteObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sousZone: json['sousZone'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxLocaliteObjectToJson(MxLocaliteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sousZone': instance.sousZone,
    };

MxVillageObject _$MxVillageObjectFromJson(Map<String, dynamic> json) =>
    MxVillageObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      localite: json['localite'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxVillageObjectToJson(MxVillageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'localite': instance.localite,
    };

MxPointObject _$MxPointObjectFromJson(Map<String, dynamic> json) =>
    MxPointObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isProduit: json['isProduit'] as bool,
      isIntrant: json['isIntrant'] as bool,
      isVirtuel: json['isVirtuel'] as bool,
      localite: json['localite'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxPointObjectToJson(MxPointObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isProduit': instance.isProduit,
      'isIntrant': instance.isIntrant,
      'isVirtuel': instance.isVirtuel,
      'localite': instance.localite,
    };

MxPointAgenceObject _$MxPointAgenceObjectFromJson(Map<String, dynamic> json) =>
    MxPointAgenceObject(
      id: (json['id'] as num).toInt(),
      point: json['point'] as Map<String, dynamic>?,
      agence: json['agence'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxPointAgenceObjectToJson(
        MxPointAgenceObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'agence': instance.agence,
    };

MxTypeEmballageObject _$MxTypeEmballageObjectFromJson(
        Map<String, dynamic> json) =>
    MxTypeEmballageObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeEmballageObjectToJson(
        MxTypeEmballageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxFournisseurObject _$MxFournisseurObjectFromJson(Map<String, dynamic> json) =>
    MxFournisseurObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
      email: json['email'] as String,
      telephone: json['telephone'] as String,
      adresse: json['adresse'] as String,
      prenom_contact: json['prenom_contact'] as String,
      nom_contact: json['nom_contact'] as String,
      email_contact: json['email_contact'] as String,
      telephone_contact: json['telephone_contact'] as String,
      societe: json['societe'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxFournisseurObjectToJson(
        MxFournisseurObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
      'email': instance.email,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'prenom_contact': instance.prenom_contact,
      'nom_contact': instance.nom_contact,
      'email_contact': instance.email_contact,
      'telephone_contact': instance.telephone_contact,
      'societe': instance.societe,
    };

MxTypeUniteGrandeurObject _$MxTypeUniteGrandeurObjectFromJson(
        Map<String, dynamic> json) =>
    MxTypeUniteGrandeurObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MxTypeUniteGrandeurObjectToJson(
        MxTypeUniteGrandeurObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MxUniteGrandeurObject _$MxUniteGrandeurObjectFromJson(
        Map<String, dynamic> json) =>
    MxUniteGrandeurObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      typeUniteGrandeur: json['typeUniteGrandeur'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxUniteGrandeurObjectToJson(
        MxUniteGrandeurObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeUniteGrandeur': instance.typeUniteGrandeur,
    };

MxEmballageObject _$MxEmballageObjectFromJson(Map<String, dynamic> json) =>
    MxEmballageObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      conditionnement: json['conditionnement'] as String,
      quantite: (json['quantite'] as num).toDouble(),
      pu: (json['pu'] as num).toDouble(),
      valeur: (json['valeur'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      isDefault: json['isDefault'] as bool,
      produit: json['produit'] as Map<String, dynamic>?,
      typeEmballage: json['typeEmballage'] as Map<String, dynamic>?,
      uniteGrandeur: json['uniteGrandeur'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxEmballageObjectToJson(MxEmballageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'conditionnement': instance.conditionnement,
      'quantite': instance.quantite,
      'pu': instance.pu,
      'valeur': instance.valeur,
      'isActive': instance.isActive,
      'isDefault': instance.isDefault,
      'produit': instance.produit,
      'typeEmballage': instance.typeEmballage,
      'uniteGrandeur': instance.uniteGrandeur,
    };

MxUserOpObject _$MxUserOpObjectFromJson(Map<String, dynamic> json) =>
    MxUserOpObject(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      op: json['op'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxUserOpObjectToJson(MxUserOpObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'op': instance.op,
    };

MxUserPointObject _$MxUserPointObjectFromJson(Map<String, dynamic> json) =>
    MxUserPointObject(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      point: json['point'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MxUserPointObjectToJson(MxUserPointObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'point': instance.point,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'data': instance.data,
    };

DataTypeChargeExploitationObject _$DataTypeChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    DataTypeChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DataTypeChargeExploitationObjectToJson(
        DataTypeChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      refresh: json['refresh'] as String,
      access: json['access'] as String,
      token: json['token'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      groups: json['groups'] as List<dynamic>,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'refresh': instance.refresh,
      'access': instance.access,
      'token': instance.token,
      'email': instance.email,
      'password': instance.password,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'groups': instance.groups,
    };

GroupObject _$GroupObjectFromJson(Map<String, dynamic> json) => GroupObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GroupObjectToJson(GroupObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UserObject _$UserObjectFromJson(Map<String, dynamic> json) => UserObject(
      id: (json['id'] as num).toInt(),
      token: json['token'] as String,
      refresh: json['refresh'] as String,
      access: json['access'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      op_id: (json['op_id'] as num?)?.toInt(),
      op_name: json['op_name'] as String?,
      sous_zone_id: (json['sous_zone_id'] as num?)?.toInt(),
      sous_zone_name: json['sous_zone_name'] as String?,
      zone_id: (json['zone_id'] as num?)?.toInt(),
      zone_name: json['zone_name'] as String?,
      point_id: (json['point_id'] as num?)?.toInt(),
      point_name: json['point_name'] as String?,
    );

Map<String, dynamic> _$UserObjectToJson(UserObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'refresh': instance.refresh,
      'access': instance.access,
      'email': instance.email,
      'password': instance.password,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'op_id': instance.op_id,
      'op_name': instance.op_name,
      'sous_zone_id': instance.sous_zone_id,
      'sous_zone_name': instance.sous_zone_name,
      'zone_id': instance.zone_id,
      'zone_name': instance.zone_name,
      'point_id': instance.point_id,
      'point_name': instance.point_name,
    };

SaisonObject _$SaisonObjectFromJson(Map<String, dynamic> json) => SaisonObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SaisonObjectToJson(SaisonObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

AnneeObject _$AnneeObjectFromJson(Map<String, dynamic> json) => AnneeObject(
      id: (json['id'] as num).toInt(),
      value: (json['value'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$AnneeObjectToJson(AnneeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'name': instance.name,
    };

FiliereObject _$FiliereObjectFromJson(Map<String, dynamic> json) =>
    FiliereObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$FiliereObjectToJson(FiliereObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

VarieteObject _$VarieteObjectFromJson(Map<String, dynamic> json) =>
    VarieteObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surface_unite: json['surface_unite'] as String?,
      quantite_unite: json['quantite_unite'] as String?,
      rendement_unite: (json['rendement_unite'] as num?)?.toDouble(),
      produitid: (json['produitid'] as num).toInt(),
      produitname: json['produitname'] as String,
      filiereid: (json['filiereid'] as num).toInt(),
      filierename: json['filierename'] as String,
      familleemplacementid: (json['familleemplacementid'] as num).toInt(),
      familleemplacementname: json['familleemplacementname'] as String,
    );

Map<String, dynamic> _$VarieteObjectToJson(VarieteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surface_unite': instance.surface_unite,
      'quantite_unite': instance.quantite_unite,
      'rendement_unite': instance.rendement_unite,
      'produitid': instance.produitid,
      'produitname': instance.produitname,
      'filiereid': instance.filiereid,
      'filierename': instance.filierename,
      'familleemplacementid': instance.familleemplacementid,
      'familleemplacementname': instance.familleemplacementname,
    };

TypeChargeExploitationObject _$TypeChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    TypeChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeChargeExploitationObjectToJson(
        TypeChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

FamilleChargeExploitationObject _$FamilleChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    FamilleChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$FamilleChargeExploitationObjectToJson(
        FamilleChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TypeOpObject _$TypeOpObjectFromJson(Map<String, dynamic> json) => TypeOpObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeOpObjectToJson(TypeOpObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

EmballageObject _$EmballageObjectFromJson(Map<String, dynamic> json) =>
    EmballageObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      conditionnement: json['conditionnement'] as String,
      is_actif: json['is_actif'] as bool,
      quantite: (json['quantite'] as num).toDouble(),
      produitid: (json['produitid'] as num).toInt(),
      produitname: json['produitname'] as String,
      typeemballageid: (json['typeemballageid'] as num).toInt(),
      typeemballagename: json['typeemballagename'] as String,
      unitegrandeurid: (json['unitegrandeurid'] as num).toInt(),
      typeunitegrandeurname: json['typeunitegrandeurname'] as String,
      valeur: (json['valeur'] as num).toDouble(),
      is_default: json['is_default'] as bool,
    );

Map<String, dynamic> _$EmballageObjectToJson(EmballageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'conditionnement': instance.conditionnement,
      'is_actif': instance.is_actif,
      'quantite': instance.quantite,
      'produitid': instance.produitid,
      'produitname': instance.produitname,
      'typeemballageid': instance.typeemballageid,
      'typeemballagename': instance.typeemballagename,
      'unitegrandeurid': instance.unitegrandeurid,
      'typeunitegrandeurname': instance.typeunitegrandeurname,
      'valeur': instance.valeur,
      'is_default': instance.is_default,
    };

ChargeExploitationObject _$ChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    ChargeExploitationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      unite: json['unite'] as String,
      pu: (json['pu'] as num).toDouble(),
      quantite_unite_superficie:
          (json['quantite_unite_superficie'] as num).toDouble(),
      produitid: (json['produitid'] as num).toInt(),
      produitname: json['produitname'] as String,
      typechargeexploitationid:
          (json['typechargeexploitationid'] as num).toInt(),
      typechargeexploitationname: json['typechargeexploitationname'] as String,
      famillechargeexploitationid:
          (json['famillechargeexploitationid'] as num).toInt(),
      famillechargeexploitationname:
          json['famillechargeexploitationname'] as String,
      is_achat: json['is_achat'] as bool,
    );

Map<String, dynamic> _$ChargeExploitationObjectToJson(
        ChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unite': instance.unite,
      'pu': instance.pu,
      'quantite_unite_superficie': instance.quantite_unite_superficie,
      'produitid': instance.produitid,
      'produitname': instance.produitname,
      'famillechargeexploitationid': instance.famillechargeexploitationid,
      'famillechargeexploitationname': instance.famillechargeexploitationname,
      'typechargeexploitationid': instance.typechargeexploitationid,
      'typechargeexploitationname': instance.typechargeexploitationname,
      'is_achat': instance.is_achat,
    };

ExploitationObject _$ExploitationObjectFromJson(Map<String, dynamic> json) =>
    ExploitationObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      producteurid: (json['producteurid'] as num).toInt(),
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      opid: (json['opid'] as num).toInt(),
      opname: json['opname'] as String,
      typeopid: (json['typeopid'] as num).toInt(),
      typeopname: json['typeopname'] as String,
      exploitation_id: (json['exploitation_id'] as num).toInt(),
      compte: (json['compte'] as num).toInt(),
      unite: json['unite'] as String,
      production_prevision: (json['production_prevision'] as num).toDouble(),
      surface_prevision: (json['surface_prevision'] as num).toDouble(),
      pu_prevision: (json['pu_prevision'] as num).toDouble(),
      varieteprevisionid: (json['varieteprevisionid'] as num).toInt(),
      varieteprevisionname: json['varieteprevisionname'] as String,
      production: (json['production'] as num).toDouble(),
      surface: (json['surface'] as num).toDouble(),
      pu: (json['pu'] as num).toDouble(),
      varieteid: (json['varieteid'] as num).toInt(),
      varietename: json['varietename'] as String,
      produitid: (json['produitid'] as num).toInt(),
      produitname: json['produitname'] as String,
      filiereid: (json['filiereid'] as num).toInt(),
      filierename: json['filierename'] as String,
      anneeid: (json['anneeid'] as num).toInt(),
      anneename: json['anneename'] as String,
      saisonid: (json['saisonid'] as num).toInt(),
      saisonname: json['saisonname'] as String,
      varietepu: (json['varietepu'] as num).toDouble(),
      emballageid: (json['emballageid'] as num).toInt(),
      emballagename: json['emballagename'] as String,
      emballagequantite: (json['emballagequantite'] as num).toDouble(),
      emballagepu: (json['emballagepu'] as num).toDouble(),
      emballagetypeemballageid:
          (json['emballagetypeemballageid'] as num).toInt(),
      emballagetypeemballagename: json['emballagetypeemballagename'] as String,
      emballageunitegrandeurid:
          (json['emballageunitegrandeurid'] as num).toInt(),
      emballageunitegrandeurname: json['emballageunitegrandeurname'] as String,
      emballageunitevaleurreference:
          (json['emballageunitevaleurreference'] as num).toDouble(),
    );

Map<String, dynamic> _$ExploitationObjectToJson(ExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exploitation_id': instance.exploitation_id,
      'compte': instance.compte,
      'date': instance.date.toIso8601String(),
      'unite': instance.unite,
      'production_prevision': instance.production_prevision,
      'surface_prevision': instance.surface_prevision,
      'pu_prevision': instance.pu_prevision,
      'varieteprevisionid': instance.varieteprevisionid,
      'varieteprevisionname': instance.varieteprevisionname,
      'production': instance.production,
      'surface': instance.surface,
      'pu': instance.pu,
      'varieteid': instance.varieteid,
      'varietename': instance.varietename,
      'produitid': instance.produitid,
      'produitname': instance.produitname,
      'filiereid': instance.filiereid,
      'filierename': instance.filierename,
      'anneeid': instance.anneeid,
      'anneename': instance.anneename,
      'saisonid': instance.saisonid,
      'saisonname': instance.saisonname,
      'varietepu': instance.varietepu,
      'emballageid': instance.emballageid,
      'emballagename': instance.emballagename,
      'emballagequantite': instance.emballagequantite,
      'emballagepu': instance.emballagepu,
      'emballagetypeemballageid': instance.emballagetypeemballageid,
      'emballagetypeemballagename': instance.emballagetypeemballagename,
      'emballageunitegrandeurid': instance.emballageunitegrandeurid,
      'emballageunitegrandeurname': instance.emballageunitegrandeurname,
      'emballageunitevaleurreference': instance.emballageunitevaleurreference,
      'producteurid': instance.producteurid,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'opid': instance.opid,
      'opname': instance.opname,
      'typeopid': instance.typeopid,
      'typeopname': instance.typeopname,
    };

ExploitationChargeExploitationObject
    _$ExploitationChargeExploitationObjectFromJson(Map<String, dynamic> json) =>
        ExploitationChargeExploitationObject(
          id: (json['id'] as num).toInt(),
          exploitationchargeexploitationid:
              (json['exploitationchargeexploitationid'] as num).toInt(),
          date: DateTime.parse(json['date'] as String),
          unite: json['unite'] as String,
          pu: (json['pu'] as num).toDouble(),
          quantite: (json['quantite'] as num).toDouble(),
          valeur: (json['valeur'] as num).toDouble(),
          observation: json['observation'] as String?,
          chargeexploitationid: (json['chargeexploitationid'] as num).toInt(),
          chargeexploitationname: json['chargeexploitationname'] as String,
          typechargeexploitationid:
              (json['typechargeexploitationid'] as num).toInt(),
          typechargeexploitationname:
              json['typechargeexploitationname'] as String,
          famillechargeexploitationid:
              (json['famillechargeexploitationid'] as num).toInt(),
          famillechargeexploitationname:
              json['famillechargeexploitationname'] as String,
          exploitationid: (json['exploitationid'] as num).toInt(),
        );

Map<String, dynamic> _$ExploitationChargeExploitationObjectToJson(
        ExploitationChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exploitationchargeexploitationid':
          instance.exploitationchargeexploitationid,
      'date': instance.date.toIso8601String(),
      'unite': instance.unite,
      'pu': instance.pu,
      'quantite': instance.quantite,
      'valeur': instance.valeur,
      'observation': instance.observation,
      'chargeexploitationid': instance.chargeexploitationid,
      'chargeexploitationname': instance.chargeexploitationname,
      'typechargeexploitationid': instance.typechargeexploitationid,
      'typechargeexploitationname': instance.typechargeexploitationname,
      'famillechargeexploitationid': instance.famillechargeexploitationid,
      'famillechargeexploitationname': instance.famillechargeexploitationname,
      'exploitationid': instance.exploitationid,
    };

ProducteurObject _$ProducteurObjectFromJson(Map<String, dynamic> json) =>
    ProducteurObject(
      id: (json['id'] as num).toInt(),
      prenom: json['prenom'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      adresse: json['adresse'] as String?,
      nom: json['nom'] as String?,
      cni: json['cni'] as String?,
      opid: (json['opid'] as num?)?.toInt(),
      opname: json['opname'] as String?,
      typeopid: (json['typeopid'] as num?)?.toInt(),
      typeopname: json['typeopname'] as String?,
      is_actif: json['is_actif'] as bool,
    );

Map<String, dynamic> _$ProducteurObjectToJson(ProducteurObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'cni': instance.cni,
      'email': instance.email,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'opid': instance.opid,
      'opname': instance.opname,
      'typeopid': instance.typeopid,
      'typeopname': instance.typeopname,
      'is_actif': instance.is_actif,
    };

OpObject _$OpObjectFromJson(Map<String, dynamic> json) => OpObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      adresse: json['adresse'] as String?,
      is_actif: json['is_actif'] as bool,
      type_op_id: (json['type_op_id'] as num).toInt(),
      type_op_name: json['type_op_name'] as String,
      localite_id: (json['localite_id'] as num?)?.toInt(),
      localite_name: json['localite_name'] as String?,
      sous_zone_id: (json['sous_zone_id'] as num?)?.toInt(),
      sous_zone_name: json['sous_zone_name'] as String?,
      zone_id: (json['zone_id'] as num?)?.toInt(),
      zone_name: json['zone_name'] as String?,
      departement_id: (json['departement_id'] as num?)?.toInt(),
      departement_name: json['departement_name'] as String?,
      region_id: (json['region_id'] as num?)?.toInt(),
      region_name: json['region_name'] as String?,
      pays_id: (json['pays_id'] as num?)?.toInt(),
      pays_name: json['pays_name'] as String?,
    );

Map<String, dynamic> _$OpObjectToJson(OpObject instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'is_actif': instance.is_actif,
      'type_op_id': instance.type_op_id,
      'type_op_name': instance.type_op_name,
      'localite_id': instance.localite_id,
      'localite_name': instance.localite_name,
      'sous_zone_id': instance.sous_zone_id,
      'sous_zone_name': instance.sous_zone_name,
      'zone_id': instance.zone_id,
      'zone_name': instance.zone_name,
      'departement_id': instance.departement_id,
      'departement_name': instance.departement_name,
      'region_id': instance.region_id,
      'region_name': instance.region_name,
      'pays_id': instance.pays_id,
      'pays_name': instance.pays_name,
    };

UserOpObject _$UserOpObjectFromJson(Map<String, dynamic> json) => UserOpObject(
      id: (json['id'] as num).toInt(),
      userid: (json['userid'] as num).toInt(),
      typeopid: (json['typeopid'] as num).toInt(),
      typeopname: json['typeopname'] as String,
      opid: (json['opid'] as num).toInt(),
      opname: json['opname'] as String,
    );

Map<String, dynamic> _$UserOpObjectToJson(UserOpObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'typeopid': instance.typeopid,
      'typeopname': instance.typeopname,
      'opid': instance.opid,
      'opname': instance.opname,
    };

UserPointObject _$UserPointObjectFromJson(Map<String, dynamic> json) =>
    UserPointObject(
      id: (json['id'] as num).toInt(),
      userid: (json['userid'] as num).toInt(),
      pointid: (json['pointid'] as num).toInt(),
      pointname: json['pointname'] as String,
    );

Map<String, dynamic> _$UserPointObjectToJson(UserPointObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'pointid': instance.pointid,
      'pointname': instance.pointname,
    };

UserUniteTransformationObject _$UserUniteTransformationObjectFromJson(
        Map<String, dynamic> json) =>
    UserUniteTransformationObject(
      id: (json['id'] as num).toInt(),
      userid: (json['userid'] as num).toInt(),
      typeunitetransformationid:
          (json['typeunitetransformationid'] as num).toInt(),
      typeunitetransformationname:
          json['typeunitetransformationname'] as String,
      unitetransformationid: (json['unitetransformationid'] as num).toInt(),
      unitetransformationname: json['unitetransformationname'] as String,
      societeid: (json['societeid'] as num).toInt(),
      societename: json['societename'] as String,
    );

Map<String, dynamic> _$UserUniteTransformationObjectToJson(
        UserUniteTransformationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'typeunitetransformationid': instance.typeunitetransformationid,
      'typeunitetransformationname': instance.typeunitetransformationname,
      'unitetransformationid': instance.unitetransformationid,
      'unitetransformationname': instance.unitetransformationname,
      'societeid': instance.societeid,
      'societename': instance.societename,
    };

StructureObject _$StructureObjectFromJson(Map<String, dynamic> json) =>
    StructureObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      sigle: json['sigle'] as String,
      telephone: json['telephone'] as String,
      adresse: json['adresse'] as String,
      souszoneid: (json['souszoneid'] as num).toInt(),
      souszonename: json['souszonename'] as String,
      zoneid: (json['zoneid'] as num).toInt(),
      zonename: json['zonename'] as String,
      paysid: (json['paysid'] as num).toInt(),
      paysname: json['paysname'] as String,
    );

Map<String, dynamic> _$StructureObjectToJson(StructureObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sigle': instance.sigle,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'souszoneid': instance.souszoneid,
      'souszonename': instance.souszonename,
      'zoneid': instance.zoneid,
      'zonename': instance.zonename,
      'paysid': instance.paysid,
      'paysname': instance.paysname,
    };

UniteTransformationObject _$UniteTransformationObjectFromJson(
        Map<String, dynamic> json) =>
    UniteTransformationObject(
      id: (json['id'] as num).toInt(),
      societeid: (json['societeid'] as num).toInt(),
      societename: json['societename'] as String,
      typetransformationid: (json['typetransformationid'] as num).toInt(),
      typetransformationname: json['typetransformationname'] as String,
    );

Map<String, dynamic> _$UniteTransformationObjectToJson(
        UniteTransformationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societeid': instance.societeid,
      'societename': instance.societename,
      'typetransformationid': instance.typetransformationid,
      'typetransformationname': instance.typetransformationname,
    };

UniteTransformationEtapeObject _$UniteTransformationEtapeObjectFromJson(
        Map<String, dynamic> json) =>
    UniteTransformationEtapeObject(
      id: (json['id'] as num).toInt(),
      unitetransformationid: (json['unitetransformationid'] as num).toInt(),
      unitetransformationname: json['unitetransformationname'] as String,
      etapeid: (json['etapeid'] as num).toInt(),
      etapename: json['etapename'] as String,
      etapenumero: (json['etapenumero'] as num).toInt(),
      is_actif: json['is_actif'] as bool,
    );

Map<String, dynamic> _$UniteTransformationEtapeObjectToJson(
        UniteTransformationEtapeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitetransformationid': instance.unitetransformationid,
      'unitetransformationname': instance.unitetransformationname,
      'etapeid': instance.etapeid,
      'etapename': instance.etapename,
      'etapenumero': instance.etapenumero,
      'is_actif': instance.is_actif,
    };

UsinageObject _$UsinageObjectFromJson(Map<String, dynamic> json) =>
    UsinageObject(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      heure_debut: DateTime.parse(json['heure_debut'] as String),
      heure_fin: DateTime.parse(json['heure_fin'] as String),
      nombre_personne: (json['nombre_personne'] as num).toDouble(),
      taux: (json['taux'] as num).toDouble(),
      unitetransformationid: (json['unitetransformationid'] as num).toInt(),
      unitetransformationname: json['unitetransformationname'] as String,
      varieteid: (json['varieteid'] as num).toInt(),
      varietename: json['varietename'] as String,
      observation: json['observation'] as String,
    );

Map<String, dynamic> _$UsinageObjectToJson(UsinageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'heure_debut': instance.heure_debut.toIso8601String(),
      'heure_fin': instance.heure_fin.toIso8601String(),
      'nombre_personne': instance.nombre_personne,
      'taux': instance.taux,
      'unitetransformationid': instance.unitetransformationid,
      'unitetransformationname': instance.unitetransformationname,
      'varieteid': instance.varieteid,
      'varietename': instance.varietename,
      'observation': instance.observation,
    };

UsinageProduitEntreeObject _$UsinageProduitEntreeObjectFromJson(
        Map<String, dynamic> json) =>
    UsinageProduitEntreeObject(
      id: (json['id'] as num).toInt(),
      quantite: (json['quantite'] as num).toDouble(),
      usinageid: (json['usinageid'] as num).toInt(),
      produitentreeid: (json['produitentreeid'] as num).toInt(),
      produitentreename: json['produitentreename'] as String,
    );

Map<String, dynamic> _$UsinageProduitEntreeObjectToJson(
        UsinageProduitEntreeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantite': instance.quantite,
      'usinageid': instance.usinageid,
      'produitentreeid': instance.produitentreeid,
      'produitentreename': instance.produitentreename,
    };

UsinageProduitSortieObject _$UsinageProduitSortieObjectFromJson(
        Map<String, dynamic> json) =>
    UsinageProduitSortieObject(
      id: (json['id'] as num).toInt(),
      quantite: (json['quantite'] as num).toDouble(),
      usinageid: (json['usinageid'] as num).toInt(),
      produitsortieid: (json['produitsortieid'] as num).toInt(),
      produitsortiename: json['produitsortiename'] as String,
    );

Map<String, dynamic> _$UsinageProduitSortieObjectToJson(
        UsinageProduitSortieObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantite': instance.quantite,
      'usinageid': instance.usinageid,
      'produitsortieid': instance.produitsortieid,
      'produitsortiename': instance.produitsortiename,
    };

EtapeObject _$EtapeObjectFromJson(Map<String, dynamic> json) => EtapeObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      typetransformationid: (json['typetransformationid'] as num).toInt(),
      typetransformationname: json['typetransformationname'] as String,
      produitopid: (json['produitopid'] as num).toInt(),
      produitname: json['produitname'] as String,
    );

Map<String, dynamic> _$EtapeObjectToJson(EtapeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typetransformationid': instance.typetransformationid,
      'typetransformationname': instance.typetransformationname,
      'produitopid': instance.produitopid,
      'produitname': instance.produitname,
    };

TypeTransformationObject _$TypeTransformationObjectFromJson(
        Map<String, dynamic> json) =>
    TypeTransformationObject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      produitopid: (json['produitopid'] as num).toInt(),
      produitname: json['produitname'] as String,
      filiereid: (json['filiereid'] as num).toInt(),
      filierename: json['filierename'] as String,
    );

Map<String, dynamic> _$TypeTransformationObjectToJson(
        TypeTransformationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'produitopid': instance.produitopid,
      'produitname': instance.produitname,
      'filiereid': instance.filiereid,
      'filierename': instance.filierename,
    };

ProduitEntreeObject _$ProduitEntreeObjectFromJson(Map<String, dynamic> json) =>
    ProduitEntreeObject(
      id: (json['id'] as num).toInt(),
      produitopid: (json['produitopid'] as num).toInt(),
      produitname: json['produitname'] as String,
      etapeid: (json['etapeid'] as num).toInt(),
      etapename: json['etapename'] as String,
    );

Map<String, dynamic> _$ProduitEntreeObjectToJson(
        ProduitEntreeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'produitopid': instance.produitopid,
      'produitname': instance.produitname,
      'etapeid': instance.etapeid,
      'etapename': instance.etapename,
    };

ProduitSortieObject _$ProduitSortieObjectFromJson(Map<String, dynamic> json) =>
    ProduitSortieObject(
      id: (json['id'] as num).toInt(),
      produitopid: (json['produitopid'] as num).toInt(),
      produitname: json['produitname'] as String,
      etapeid: (json['etapeid'] as num).toInt(),
      etapename: json['etapename'] as String,
    );

Map<String, dynamic> _$ProduitSortieObjectToJson(
        ProduitSortieObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'produitopid': instance.produitopid,
      'produitname': instance.produitname,
      'etapeid': instance.etapeid,
      'etapename': instance.etapename,
    };

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/presentation/providers/providers.dart';
import 'package:provider/provider.dart' as provider;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );

  initialize();

  // WidgetsFlutterBinding.ensureInitialized();
  // await ThemeProvider.instance.changeTheme(ThemeEnum.light);
  runApp(const MyApp());
}

void initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ThemeProvider.instance.changeTheme(ThemeEnum.light);
  var dir = await getApplicationDocumentsDirectory();
  String dossierPath = '${dir.path}/';
  Directory dossier = Directory(dossierPath);
  dossier.delete(recursive: true);
  // Vérifiez si le dossier existe
  if (dossier.existsSync()) {
    print('Félicitations Le dossier $dossierPath existe déja.');
    /*
    // Utilisez la méthode `listSync` pour obtenir la liste des éléments dans le dossier
    List<FileSystemEntity> elements = dossier.listSync();
    // Filtrer les éléments qui sont des dossiers
    List<Directory> sousDossiers = elements.whereType<Directory>().toList();
    // Afficher les noms des sous-dossiers
    print('AVANT : Sous-dossiers dans $dossierPath :');
    sousDossiers.forEach((sousDossier) async {
      print(sousDossier.path);

      List<FileSystemEntity> detailsElements = sousDossier.listSync();
      List<Directory> detailsSousDossiers =
          detailsElements.whereType<Directory>().toList();
      //print('Details sous-dossiers : $detailsSousDossiers');
      detailsSousDossiers.forEach((detailSousDossier) {
        print('details sous-dossiers :' + detailSousDossier.path);
      });

      // Liste des fichiers dans le répertoire de la base de données
      List<FileSystemEntity> files =
          await ObjectBox.listFilesInDatabaseDirectory("jeyligmxfr");

      print("Liste des fichiers dans le répertoire de la base de données :");
      for (var file in files) {
        print(file.path);
      }
    });
    */
  } else {
    print('Le dossier $dossierPath n\'existe pas.');
  }

  // await ObjectBox.create();
  /*********** 
  var dirAfter = await getApplicationDocumentsDirectory();
  String dossierPathAfter = '${dirAfter.path}/';
  Directory dossierAfter = Directory(dossierPathAfter);
  // Vérifiez si le dossier existe
  if (dossierAfter.existsSync()) {
    // Utilisez la méthode `listSync` pour obtenir la liste des éléments dans le dossier
    List<FileSystemEntity> elements = dossierAfter.listSync();

    // Filtrer les éléments qui sont des dossiers
    List<Directory> sousDossiers = elements.whereType<Directory>().toList();

    // Afficher les noms des sous-dossiers
    print('APRES : Sous-dossiers dans $dossierPathAfter :');
    sousDossiers.forEach((sousDossier) {
      print(sousDossier.path);
    });
  } else {
    print('Le dossier $dossierPathAfter n\'existe pas.');
  }
  
  ********* */
}

void dispose() async {
  /*
  var dir = await getApplicationDocumentsDirectory();
  print("dir ===??? $dir");
  final objBoxDirectory = Directory(
      // appDirectory.path + '/objectbox/' + ApiConstants.nameDB);
      '${dir.path}/${Constants.nameDB}/');
  final isExists = await objBoxDirectory.exists();
  print("DBObject ===??? $isExists");

  if (isExists == true) {
    print("DBObject ===??? DELETED");
    //objBoxDirectory.delete(recursive: true);
  }
  */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp();

    return provider.MultiProvider(
      providers: providers,
    );
  }
}

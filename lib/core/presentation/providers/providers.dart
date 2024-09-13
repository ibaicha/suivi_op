import 'package:flutter/cupertino.dart';
//import 'package:model_flutter/core/presentation/notifiers/core_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:suivi_op/features/application/stockage/pages/list_stockage_layout.dart';
import 'package:suivi_op/features/application/stockage/widgets/edit_stockages_widget.dart';

import '../../../features/application/annee/widgets/all_annees_widget/bloc/all_annees_bloc.dart';
import '../../../features/application/emballage/data/repository/emballage_repository.dart';
import '../../../features/application/emballage/widgets/all_emballages_widget/bloc/all_emballages_bloc.dart';
import '../../../features/application/exploitation/pages/add_exploitation_page.dart';
import '../../../features/application/exploitation/widgets/exploitation_complement_widget/edit_exploitation_widget.dart';
import '../../../features/application/exploitation/widgets/exploitations_widget/bloc/exploitation_bloc.dart';
import '../../../features/application/exploitation_charge_exploitation/widgets/ece_idExploitation/bloc/ece_by_exploitation_bloc.dart';
import '../../../features/application/exploitation_charge_exploitation/widgets/ece_idProduitIdTypeChargeIdExploitation/bloc/ece_id_produit_id_type_charge_id_exploitation_bloc.dart';
import '../../../features/application/local_data/presentation/pages/local_data_screen.dart';
import '../../../features/application/local_data/presentation/pages/login_local_data_screen.dart';
import '../../../features/application/producteur/widgets/producteurs_widget/bloc/producteur_bloc.dart';
import '../../../features/application/saison/widgets/all_saisons_widget/bloc/all_saisons_bloc.dart';
import '../../../features/application/stockage/pages/stockage_page.dart';
import '../../../features/application/stockage/widgets/list_stockages_widget.dart';
import '../../../features/application/type_charge_exploitation/widgets/type_charge_exploitations_idproduit/bloc/type_charge_exploitations_idproduit_bloc.dart';
import '../../../features/application/variete/widgets/all_variete_widget/bloc/all_varietes_bloc.dart';
import '../../data/service/services.dart';
import '../../data/repository/repositories.dart';

import '../../../features/auth/presentation/notifiers/auth_state.dart';
import '../../../features/auth/presentation/pages/DataPage.dart';
import '../../../features/auth/presentation/pages/dashboard_screen.dart';
import '../../../features/auth/presentation/pages/login_screen.dart';
import '../../../features/auth/presentation/pages/profile_screen.dart';
import '../../../features/auth/presentation/pages/webview.dart';
import '../../../features/auth/presentation/pages/welcome_screen.dart';
import '../../../features/auth/presentation/widgets/transition_route_observer.dart';
import 'theme_provider.dart';

List<SingleChildWidget> providers = [
  RepositoryProvider<ExploitationRepository>(
    create: (context) => ExploitationRepository(service: ExploitationService()),
  ),
  RepositoryProvider<ProducteurRepository>(
    create: (context) => ProducteurRepository(service: ProducteurService()),
  ),
  RepositoryProvider<VarieteRepository>(
    create: (context) => VarieteRepository(service: VarieteService()),
  ),
  RepositoryProvider<AnneeRepository>(
    create: (context) => AnneeRepository(service: AnneeService()),
  ),
  RepositoryProvider<EmballageRepository>(
    create: (context) => EmballageRepository(service: EmballageService()),
  ),
  RepositoryProvider<SaisonRepository>(
    create: (context) => SaisonRepository(service: SaisonService()),
  ),
  RepositoryProvider<TypeChargeExploitationRepository>(
    create: (context) => TypeChargeExploitationRepository(
        service: TypeChargeExploitationService()),
  ),
  RepositoryProvider<ExploitationChargeExploitationRepository>(
    create: (context) => ExploitationChargeExploitationRepository(
        service: ExploitationChargeExploitationService()),
  ),
  MultiBlocProvider(
    providers: [
      //-----------------BON -------------------
      BlocProvider<ExploitationBloc>(
        create: (context) =>
            ExploitationBloc(context.read<ExploitationRepository>()),
      ),
      BlocProvider<EceByExploitationBloc>(
        create: (context) => EceByExploitationBloc(
            context.read<ExploitationChargeExploitationRepository>()),
      ),
      BlocProvider<AllAnneesBloc>(
        create: (context) => AllAnneesBloc(context.read<AnneeRepository>()),
      ),
      BlocProvider<AllVarietesBloc>(
        create: (context) => AllVarietesBloc(context.read<VarieteRepository>()),
      ),
      BlocProvider<AllEmballagesBloc>(
        create: (context) =>
            AllEmballagesBloc(context.read<EmballageRepository>()),
      ),
      BlocProvider<AllSaisonsBloc>(
        create: (context) => AllSaisonsBloc(context.read<SaisonRepository>()),
      ),
      BlocProvider<ProducteurBloc>(
        create: (context) =>
            ProducteurBloc(context.read<ProducteurRepository>()),
      ),
      BlocProvider<Producteur_idOpBloc>(
        create: (context) =>
            Producteur_idOpBloc(context.read<ProducteurRepository>()),
      ),
      // ----------------- BON FIN ------------------

      BlocProvider<TypeChargeExploitationsIdproduitBloc>(
        create: (context) => TypeChargeExploitationsIdproduitBloc(
          typeChargeExploitationRepository:
              context.read<TypeChargeExploitationRepository>(),
        )..add(GenerateTypeChargeExploitationsIdProduitEvent(
            idProduit: 0,
          )),
      ),
      BlocProvider<EceIdProduitIdTypeChargeIdExploitationBloc>(
        create: (context) => EceIdProduitIdTypeChargeIdExploitationBloc(
          exploitationChargeExploitationRepository:
              context.read<ExploitationChargeExploitationRepository>(),
        )..add(GenerateEceIdProduitIdTypeChargeIdExploitationEvent(
            idProduit: 0, idTypeChargeExploitation: 0, idExploitation: 0)),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthState(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) => ThemeProvider.instance,
      ),
    ],
    child: MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('fr')],
      title: 'Login Demo',
      // theme: Provider.of<ThemeProvider>(context).currentThemeData,

      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.orange),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.orange),
        primaryColor: Colors.deepPurple,
      ),

/*
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final currentTheme = themeProvider.currentThemeData;
        final textSelectionTheme =
            TextSelectionThemeData(cursorColor: Colors.orange);
        final colorScheme =
            ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
                .copyWith(secondary: Colors.orange);

        // Fusionner les données du thème actuel avec les nouvelles propriétés
        final mergedTheme = currentTheme!.copyWith(
          textSelectionTheme: textSelectionTheme,
          colorScheme: colorScheme,
        );

        return Theme(
          data: mergedTheme,
          child: child ?? const SizedBox(),
        );
      },
*/
/*
      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.orange),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.orange),
      ),
*/
      /*
      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.orange),
        // fontFamily: 'SourceSansPro',
        // THEME //
       
        textTheme: TextTheme(
          headline3: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.orange,
          ),
          button: const TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: const TextStyle(fontFamily: 'Quicksand'),
          headline2: const TextStyle(fontFamily: 'Quicksand'),
          headline4: const TextStyle(fontFamily: 'Quicksand'),
          headline5: const TextStyle(fontFamily: 'NotoSans'),
          headline6: const TextStyle(fontFamily: 'NotoSans'),
          subtitle1: const TextStyle(fontFamily: 'NotoSans'),
          bodyText1: const TextStyle(fontFamily: 'NotoSans'),
          bodyText2: const TextStyle(fontFamily: 'NotoSans'),
          subtitle2: const TextStyle(fontFamily: 'NotoSans'),
          overline: const TextStyle(fontFamily: 'NotoSans'),
        ),
         
        
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.orange),
      ),
      */
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: WelcomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        LoginLocalDataScreen.routeName: (context) =>
            const LoginLocalDataScreen(),
        LocalDataScreen.routeName: (context) => const LocalDataScreen(),
        AddExploitationPage.routeName: (context) => const AddExploitationPage(),
        StockagePage.routeName: (context) => const StockagePage(),
        EditExploitationWidget.routeName: (context) =>
            const EditExploitationWidget(),
        WebViewApp.routeName: (context) => const WebViewApp(),
        DataPage.routeName: (context) => const DataPage(),
        //EditStockagesWidget.routeName: (context) => const EditStockagesWidget(),
        ListStockageLayout.routeName: (context) => const ListStockageLayout(),
      },
    ),
  ),
];

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:divisas/data/datasources/polygon_rest_datasource.dart';
import 'package:divisas/data/env/env.dart';
import 'package:divisas/device/conection_manager.dart';
import 'package:divisas/device/db_manager.dart';
import 'package:divisas/domain/bussiness_logic/currencydivisas/realtime_currency_cubit.dart';
import 'package:divisas/domain/bussiness_logic/grafic/polygon_cubit.dart';
import 'package:divisas/screens/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBmanager.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final Connectivity _connectivity = Connectivity();
  ConectionManager conectionManager = ConectionManager();

  @override
  void initState() {
    _connectivity.onConnectivityChanged
        .listen(conectionManager.updateConnectionStatus);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _connectivity.onConnectivityChanged
          .listen(conectionManager.updateConnectionStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataSource = PolygonRestDataSource(apiManager);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => RealtimeCurrencyCubit(dataSource, conectionManager)),
        BlocProvider(create: (_) => PolygonCubit(dataSource)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Polygon',
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}

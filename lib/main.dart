import 'package:divisas/data/datasources/polygon_rest_datasource.dart';
import 'package:divisas/data/env/env.dart';
import 'package:divisas/domain/bussiness_logic/currencydivisas/realtime_currency_cubit.dart';
import 'package:divisas/domain/bussiness_logic/grafic/polygon_cubit.dart';
import 'package:divisas/screens/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = PolygonRestDataSource(apiManager);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RealtimeCurrencyCubit(dataSource)),
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

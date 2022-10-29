import 'package:bloc_test/bloc_test.dart';
import 'package:divisas/data/datasources/polygon_test_mock.dart';
import 'package:divisas/data/env/env.dart';
import 'package:divisas/data/services/result.dart';
import 'package:divisas/device/conection_manager.dart';
import 'package:divisas/device/db_manager.dart';
import 'package:divisas/domain/bussiness_logic/currencydivisas/realtime_currency_cubit.dart';
import 'package:divisas/domain/bussiness_logic/grafic/polygon_cubit.dart';
import 'package:divisas/screens/utils/time_convert.dart';
import 'package:flutter_test/flutter_test.dart';

import 'template_result.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await DBmanager.init();

  group("Group Integrations Testing From Layer Logic/Bussiness to Data", () {
    blocTest<RealtimeCurrencyCubit, RealtimeCurrencyState>(
      'Integration Load realtime currency conversion USD/COP Success',
      build: () => RealtimeCurrencyCubit(
          PolygonTestMock(apiManagerMock1), ConectionManager()),
      act: (RealtimeCurrencyCubit cubit) => cubit.getRealTImeCurrency(),
      expect: () => [
        RealtimeCurrencyLoading(),
        const RealtimeCurrencyLoaded(
            currencyConversionModel: model, isConnected: false)
      ],
    );
    blocTest<PolygonCubit, PolygonState>(
      'Load aggregatesBar Success',
      build: () => PolygonCubit(PolygonTestMock(apiManagerMock2)),
      act: (PolygonCubit cubit) => cubit.aggregatesBarGet(4),
      expect: () => <PolygonState>[
        PolygonState(status: PolygonStateStatus.loading),
        PolygonState(
            aggregateBarEntity: model2,
            currentSelect: 4,
            status: PolygonStateStatus.loaded,
            connection: PolygonStateConnection.activate,
            type: PolygonStateType.oneday)
      ],
    );
  });
  group("Group United Testing Services", () {
    test("Load realtime currency conversion USD/COP Success", () async {
      final cubit = PolygonTestMock(apiManagerMock1);
      final Result<dynamic, BackendError> result = await cubit
          .realTimeCurrencyConversion(from: 'USD', to: 'COP', precision: '2');
      expect(result.isSuccess, isTrue);
    });

    test("Load aggregatesBar Success", () async {
      final cubit = PolygonTestMock(apiManagerMock1);
      final Result<dynamic, BackendError> result = await cubit.aggregatesBar(
          from: "2022/10/28",
          to: formater(DateTime.now()),
          range: 4 == 0 || 4 == 1 ? "week" : "hour");
      expect(result.isSuccess, isTrue);
    });
  });
}

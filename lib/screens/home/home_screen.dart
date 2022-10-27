import 'package:divisas/domain/bussiness_logic/currencydivisas/realtime_currency_cubit.dart';
import 'package:divisas/domain/models/currency_conversion_model.dart';
import 'package:divisas/screens/utils/responsive.dart';
import 'package:divisas/screens/widgets/card_currency.dart';
import 'package:divisas/screens/widgets/custom_app_bar.dart';
import 'package:divisas/screens/widgets/shimmer_card_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<RealtimeCurrencyCubit>().getRealTImeCurrency();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CustomAppBar(),
              ),
              SliverToBoxAdapter(
                child: Builder(builder: (context) {
                  final status = context.select(
                      (RealtimeCurrencyCubit cubit) => cubit.state.status);
                  switch (status) {
                    case RealtimeCurrencyStateStatus.loading:
                      return ShimmerCardCurrency(responsive: responsive);
                    case RealtimeCurrencyStateStatus.loaded:
                      final model = context.select(
                          (RealtimeCurrencyCubit cubit) =>
                              cubit.state.currencyConversionModel);
                      return CardCurrency(responsive: responsive, model: model);
                    default:
                      return ShimmerCardCurrency(responsive: responsive);
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

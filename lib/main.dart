import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:two_d/bloc/check_app_update/check_app_update_cubit.dart';
import 'package:two_d/bloc/football/bawdi/get_bawdi_match_cubit.dart';
import 'package:two_d/bloc/football/manug/get_maung_match_cubit.dart';
import 'package:two_d/bloc/football/soccer_bet/soccer_bet_cubit.dart';
import 'package:two_d/bloc/get_user/bloc/get_user_bloc.dart';
import 'package:two_d/bloc/refresh_token/bloc/refresh_token_bloc.dart';
import 'package:two_d/network/locator.dart';
import 'package:two_d/pages/splash_page/splash_page.dart';
import 'package:two_d/utils/theme_helper.dart';

import 'bloc/football/soccer_bet/body_soccer_bet_cubit.dart';

void main() {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => const MaterialClassicHeader(),
      footerBuilder: () => const ClassicFooter(
        height: 50,
        textStyle: TextStyle(color: Colors.black),
      ),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      shouldFooterFollowWhenNotFull: (state) {
        return false;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GetUserBloc>(
            create: (context) => getIt.call(),
          ),
          BlocProvider<CheckAppUpdateCubit>(
            create: (context) => getIt.call(),
          ),
          BlocProvider<GetBawdiMatchCubit>(
            create: (context) => getIt.call(),
          ),
          BlocProvider<GetMaungMatchCubit>(
            create: (context) => getIt.call(),
          ),
          BlocProvider<SoccerBetCubit>(
            create: (context) => getIt.call(),
          ),
          BlocProvider<BodySoccerBetCubit>(
            create: (context) => getIt.call(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeHelper.themes(),
          home: BlocProvider<RefreshTokenBloc>(
            create: (context) => getIt.call(),
            child: const SplashPage(),
          ),
        ),
      ),
    );
  }
}

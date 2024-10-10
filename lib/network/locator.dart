import 'package:get_it/get_it.dart';
import 'package:two_d/bloc/get_banks/bloc/get_banks_bloc.dart';
import 'package:two_d/bloc/get_carousel_image/bloc/get_carousel_image_bloc.dart';
import 'package:two_d/bloc/get_user/bloc/get_user_bloc.dart';
import 'package:two_d/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:two_d/bloc/refresh_token/bloc/refresh_token_bloc.dart';
import 'package:two_d/network/api_service.dart';
import 'package:two_d/network/repository/balance_transation_repo.dart';
import 'package:two_d/network/repository/banks_repo.dart';
import 'package:two_d/network/repository/betRepo.dart';
import 'package:two_d/network/repository/carousel_image_repo.dart';
import 'package:two_d/network/repository/change_password_repo.dart';
import 'package:two_d/network/repository/football_history_repo.dart';
import 'package:two_d/network/repository/get_user_repo.dart';
import 'package:two_d/network/repository/history_repo.dart';
import 'package:two_d/network/repository/login_repo.dart';
import 'package:two_d/network/repository/refresh_token_repo.dart';
import 'package:two_d/network/repository/singup_repo.dart';
import 'package:two_d/network/repository/three_d_result_repo.dart';
import 'package:two_d/network/repository/transaction_history_repo.dart';
import 'package:two_d/network/repository/twod_history_repo.dart';
import 'package:two_d/network/repository/win_number_repo.dart';
import 'package:two_d/pages/profile_page/change_password_page.dart';

import '../bloc/football/bawdi/get_bawdi_match_cubit.dart';
import '../bloc/football/manug/get_maung_match_cubit.dart';
import '../bloc/football/soccer_bet/body_soccer_bet_cubit.dart';
import '../bloc/football/soccer_bet/soccer_bet_cubit.dart';
import 'body_soccer_bet_repo.dart';
import 'repository/bawdi_repo.dart';
import 'repository/maung_repo.dart';
import 'repository/service_phone_repo.dart';
import 'repository/soccer_bet_repo.dart';

GetIt getIt = GetIt.I;
void locator() {
  ApiService apiService = ApiService();
  getIt.registerLazySingleton(() => apiService);

  LoginRepoImpl loginRepoImpl = LoginRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => loginRepoImpl);

  RefreshTokenRepoImpl refreshTokenRepoImpl =
      RefreshTokenRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => refreshTokenRepoImpl);

  GetUserRepoImpl getUserRepoImpl = GetUserRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => getUserRepoImpl);

  CarouselImageRepoImpl carouselImageRepoImpl =
      CarouselImageRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => carouselImageRepoImpl);

  BanksRepoImpl banksRepoImpl = BanksRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => banksRepoImpl);

  BalanceTransationRepoImpl balanceTransationRepoImpl =
      BalanceTransationRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => balanceTransationRepoImpl);

  RefreshTokenBloc refreshTokenBloc = RefreshTokenBloc(getIt.call());
  getIt.registerLazySingleton(() => refreshTokenBloc);

  TransactionHistoryRepoImpl transactionHistoryRepoImpl =
      TransactionHistoryRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => transactionHistoryRepoImpl);

  BetRepoImpl betRepoImpl = BetRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => betRepoImpl);

  GetHistoryRepoImpl getHistoryRepoImpl = GetHistoryRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => getHistoryRepoImpl);

  SingUpRepoImpl singUpRepoImpl = SingUpRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => singUpRepoImpl);

  WinNumRepoImpl winNumRepoImpl = WinNumRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => winNumRepoImpl);

  ChangePasswordRepoImpl changePasswordRepoImpl =
      ChangePasswordRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => changePasswordRepoImpl);

  TwoDHistoryRepoImpl twoDHistoryRepoImpl = TwoDHistoryRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => twoDHistoryRepoImpl);

  ThreeDResultRepoImpl threeDResultRepoImpl =
      ThreeDResultRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => threeDResultRepoImpl);

  ServicePhoneRepoImpl servicePhoneRepoImpl =
      ServicePhoneRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => servicePhoneRepoImpl);

  BawdiRepo bawdiRepo = BawdiRepo(getIt.call());
  getIt.registerLazySingleton(() => bawdiRepo);

  MaungRepo maungRepo = MaungRepo(getIt.call());
  getIt.registerLazySingleton(() => maungRepo);

  GetBawdiMatchCubit getBawdiMatchCubit = GetBawdiMatchCubit(getIt.call());
  getIt.registerLazySingleton(() => getBawdiMatchCubit);

  GetMaungMatchCubit getMaungMatchCubit = GetMaungMatchCubit(getIt.call());
  getIt.registerLazySingleton(() => getMaungMatchCubit);

  SoccerBetRepo soccerBetRepo = SoccerBetRepo(getIt.call());
  getIt.registerLazySingleton(() => soccerBetRepo);

  SoccerBetCubit soccerBetCubit = SoccerBetCubit(getIt.call());
  getIt.registerLazySingleton(() => soccerBetCubit);


  BodySoccerBetRepo bodySoccerBetRepo = BodySoccerBetRepo(getIt.call());
  getIt.registerLazySingleton(() => bodySoccerBetRepo);

  BodySoccerBetCubit bodySoccerBetCubit = BodySoccerBetCubit(getIt.call());
  getIt.registerLazySingleton(() => bodySoccerBetCubit);

  FootballGetHistoryRepoImpl getFootballHistoryRepoImpl = FootballGetHistoryRepoImpl(getIt.call());
  getIt.registerLazySingleton(() => getFootballHistoryRepoImpl);
}

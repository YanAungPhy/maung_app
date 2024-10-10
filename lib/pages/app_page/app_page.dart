import 'package:two_d/bloc/service_phone_bloc/bloc/service_phone_bloc.dart';
import 'package:two_d/pages/history_page/history_page.dart';
import 'package:two_d/pages/home_page/home_page.dart';
import 'package:two_d/pages/profile_page/profile_page.dart';
import 'package:two_d/pages/wallet_page/wallet_page.dart';
import 'package:two_d/utils/global_import.dart';
import '../../bloc/get_user/bloc/get_user_bloc.dart';
import '../../bloc/transaction_history/bloc/transacion_history_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List screens = [
      const HomePage(),
      MultiBlocProvider(
        providers: [
          BlocProvider<GetUserBloc>(
            create: (context) => GetUserBloc(getIt.call()),
          ),
          BlocProvider<TransacionHistoryBloc>(
            create: (context) => TransacionHistoryBloc(getIt.call()),
          ),
        ],
        child: WalletPage(),
      ),
      const HistoryPage(),
      MultiBlocProvider(
        providers: [
          BlocProvider<GetUserBloc>(
            create: (context) => GetUserBloc(getIt.call()),
          ),
          BlocProvider<ServicePhoneBloc>(
            create: (context) => ServicePhoneBloc(getIt.call()),
          ),
        ],
        child: const ProfilePage(),
      ),
    ];

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: screens[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          height: 65,
          selectedIndex: _selectedIndex,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColor.grey,
                ),
                selectedIcon: Icon(
                  Icons.home,
                  color: AppColor.greenBlack,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppColor.grey,
                ),
                selectedIcon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: AppColor.greenBlack,
                ),
                label: 'Wallet'),
            NavigationDestination(
                icon: Icon(
                  Icons.history_outlined,
                  color: AppColor.grey,
                ),
                selectedIcon: Icon(
                  Icons.history,
                  color: AppColor.greenBlack,
                ),
                label: 'History'),
            NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: AppColor.grey,
                ),
                selectedIcon: Icon(
                  Icons.person,
                  color: AppColor.greenBlack,
                ),
                label: 'Profile')
          ],
        ),
      ),
    );
  }
}

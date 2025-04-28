import 'package:two_d/pages/history_page/football_history.dart';
import 'package:two_d/pages/history_page/gain_football_history.dart';
import 'package:two_d/pages/history_page/pay_football_history.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/history/bloc/football/football_history_bloc.dart';

class MainFootBallHistory extends StatefulWidget {
  const MainFootBallHistory({super.key});

  @override
  State<MainFootBallHistory> createState() => _MainFootBallHistory();
}

class _MainFootBallHistory extends State<MainFootBallHistory>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.nearlywhite.withOpacity(.5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColor.grey,
              child: TabBar(
                labelColor: AppColor.red,
                unselectedLabelColor: AppColor.footballTabColor,
                indicatorColor: AppColor.blue,
                automaticIndicatorColorAdjustment: true,
                controller: _controller,
                tabs: const [
                  Tab(
                      icon: Text(
                        "Unfinished",
                        style: TextStyle(
                            fontSize: 16,
                            // color: AppColor.yellow,
                            fontWeight: FontWeight.w600),
                      )),
                  Tab(
                    icon: Text(
                      "Gain",
                      style: TextStyle(
                          fontSize: 16,
                          // color: AppColor.yellow,
                          fontWeight: FontWeight.w600),
                    )),
                  Tab(
                    icon: Text(
                      "Pay",
                      style: TextStyle(
                          fontSize: 16,
                          // color: AppColor.yellow,
                          fontWeight: FontWeight.w600),
                    )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  BlocProvider<FootballHistoryBloc>(
                    create: (context) => FootballHistoryBloc(getIt.call()),
                    child: const FootballHistoryPage(),
                  ),
                  BlocProvider<FootballHistoryBloc>(
                    create: (context) => FootballHistoryBloc(getIt.call()),
                    child: const GainFootballHistoryPage(),
                  ),
                  BlocProvider<FootballHistoryBloc>(
                    create: (context) => FootballHistoryBloc(getIt.call()),
                    child: const PayFootballHistoryPage(),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

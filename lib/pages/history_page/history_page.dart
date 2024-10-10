import 'package:two_d/bloc/history/bloc/history_bloc_bloc.dart';
import 'package:two_d/pages/history_page/3d_history.dart';
import 'package:two_d/pages/history_page/football_history.dart';
import 'package:two_d/pages/history_page/twod_history.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/history/bloc/football/football_history_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
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
      appBar: AppBar(
        backgroundColor: AppColor.greenBlack,
        leading: const Icon(Icons.history),
        title: const Text("မှတ်တမ်းများ"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColor.greenDark2,
              child: TabBar(
                labelColor: AppColor.yellow,
                unselectedLabelColor: AppColor.unSelectedYellow,
                indicatorColor: AppColor.greenSecondry,
                automaticIndicatorColorAdjustment: true,
                controller: _controller,
                tabs: const [
                  Tab(
                      icon: Text(
                        "2D",
                        style: TextStyle(
                            fontSize: 22,
                            // color: AppColor.yellow,
                            fontWeight: FontWeight.w600),
                      ),
                      text: "History"),
                  Tab(
                    icon: Text(
                      "3D",
                      style: TextStyle(
                          fontSize: 22,
                          // color: AppColor.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                    text: "History",
                  ),
                  Tab(
                    icon: Text(
                      "Football",
                      style: TextStyle(
                          fontSize: 22,
                          // color: AppColor.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                    text: "History",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  BlocProvider<HistoryBlocBloc>(
                    create: (context) => HistoryBlocBloc(getIt.call()),
                    child: const TwoDHistoryPage(),
                  ),
                  BlocProvider<HistoryBlocBloc>(
                    create: (context) => HistoryBlocBloc(getIt.call()),
                    child: const ThreeDHistoryPage(),
                  ),
                  BlocProvider<FootballHistoryBloc>(
                    create: (context) => FootballHistoryBloc(getIt.call()),
                    child: const FootballHistoryPage(),
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

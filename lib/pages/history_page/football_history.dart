import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:two_d/bloc/history/bloc/history_bloc_bloc.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/history/bloc/football/football_history_bloc.dart';
import '../../models/football_history_model.dart';
class FootballHistoryPage extends StatefulWidget {
  const FootballHistoryPage({super.key});

  @override
  State<FootballHistoryPage> createState() => _FootballHistoryPageState();
}

class _FootballHistoryPageState extends State<FootballHistoryPage> {
  List<FootballHistoryModel> historyModelList = [];
  final twoDrefreshController = RefreshController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    twoDrefreshController.dispose();
    super.dispose();
  }

  void getData() {
    BlocProvider.of<FootballHistoryBloc>(context)
        .add(FetchFootballHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<FootballHistoryBloc, FootballHistoryBlocState>(
      listener: (context, state) {
        if (state is FootballHistoryBlocSuccess) {
          if (state.isFirst) {
            twoDrefreshController.refreshCompleted();
            twoDrefreshController.resetNoData();
          } else {
            twoDrefreshController.loadComplete();
          }
        }
        if (state is HistoryBlocNoMore) {
          twoDrefreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state is FootballHistoryBlocSuccess) {
          if (state.historyModelList.isNotEmpty) {
            if (state.isFirst) {
              historyModelList = state.historyModelList;
              print("TestingHistoryModelList:   ${historyModelList.length} First");
            } else {
              historyModelList.addAll(state.historyModelList);
            }
            print("TestingHistoryModelList:   ${size} Second");
            return listVbuilder(size);
          } else {
            return const ErrorPage(error: "မှတ်တမ်းမရှိပါ");
          }
        } else if (state is HistoryBlocMore) {
          return listVbuilder(size);
        } else if (state is FootballHistoryBlocFail) {
          return ErrorPage(error: state.error);
        } else if (state is HistoryBlocNoMore) {
          return listVbuilder(size);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget listVbuilder(Size size) {
    return SmartRefresher(
      controller: twoDrefreshController,
      enablePullDown: true,
      enablePullUp: historyModelList.length > 9,
      onRefresh: () {
        BlocProvider.of<FootballHistoryBloc>(context)
            .add( FetchFootballHistoryEvent());
      },
      onLoading: () {
        BlocProvider.of<FootballHistoryBloc>(context)
            .add(const FootballTapHistoryMoreEvent(gameType: "3D"));
      },
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return listItemWidget(historyModelList[index], size);
          },
          itemCount: historyModelList.length),
    );
  }

  Widget listItemWidget(FootballHistoryModel historyModelDetail, Size size) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: AppColor.greenBlack.withOpacity(.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Date: ",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250)),
                  ),
                  // Text(historyModelDetail.list.get.toString(),
                  //   style: const TextStyle(
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w600,
                  //       color: Color.fromARGB(255, 235, 121, 250)),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.3,
                    alignment: Alignment.center,
                    child: const Text(
                      "Amount",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.nearlywhite),
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    alignment: Alignment.center,
                    child: const Text(
                      'text',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.nearlywhite),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}

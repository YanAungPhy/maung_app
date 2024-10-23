import 'package:easy_localization/easy_localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:two_d/bloc/history/bloc/history_bloc_bloc.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/pages/history_page/football_history_detail.dart';
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
            } else {
              historyModelList.addAll(state.historyModelList);
            }
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
            return listItemWidget(historyModelList[index], size,context);
          },
          itemCount: historyModelList.length),
    );
  }

  Widget listItemWidget(FootballHistoryModel historyModelDetail, Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: InkWell(
        onTap: () {
          // Navigate to the desired page when the item is clicked
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FootballHistoryDetailPage(historyId: 26), // Pass the model to the next page
            ),
          );
        },
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Date: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                    Text(
                      DateFormat.yMEd().add_jms().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            historyModelDetail.createdDateInMilliSeconds!),
                      ),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Maung Body: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                    Text(
                      historyModelDetail.gameType.toString(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Amount: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                    Text(
                      historyModelDetail.amount.toString(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ပွဲအခြေအနေ: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 235, 121, 250),
                      ),
                    ),
                    Text(
                      historyModelDetail.status.toString(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250),




                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

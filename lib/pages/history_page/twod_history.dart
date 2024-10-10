import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:two_d/bloc/history/bloc/history_bloc_bloc.dart';
import 'package:two_d/models/history_model.dart';
import 'package:two_d/utils/global_import.dart';

import '../error_page/error_page.dart';

class TwoDHistoryPage extends StatefulWidget {
  const TwoDHistoryPage({super.key});

  @override
  State<TwoDHistoryPage> createState() => _TwoDHistoryPageState();
}

class _TwoDHistoryPageState extends State<TwoDHistoryPage> {
  List<HistoryModel> historyModelList = [];
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
    BlocProvider.of<HistoryBlocBloc>(context)
        .add(const TapHistoryEvent(gameType: "2D"));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HistoryBlocBloc, HistoryBlocState>(
      listener: (context, state) {
        if (state is HistoryBlocSuccess) {
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
        if (state is HistoryBlocSuccess) {
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
        } else if (state is HistoryBlocFail) {
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
        BlocProvider.of<HistoryBlocBloc>(context)
            .add(const TapHistoryEvent(gameType: "2D"));
      },
      onLoading: () {
        BlocProvider.of<HistoryBlocBloc>(context)
            .add(const TapHistoryMoreEvent(gameType: "2D"));
      },
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return listItemWidget(historyModelList[index], size);
          },
          itemCount: historyModelList.length),
    );
  }

  Widget listItemWidget(HistoryModel historyModel, Size size) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: AppColor.greenBlack.withOpacity(.7),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Date : ",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250)),
                  ),
                  Text(
                    DateFormat.yMEd().add_jms().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              historyModel.createdDateInMilliSeconds!),
                        ),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 235, 121, 250)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.3,
                    alignment: Alignment.center,
                    child: const Text(
                      "ဂဏန်း",
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
                      "ပမာဏ",
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
                      "အခြေနေ",
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
        Container(
          padding: const EdgeInsets.only(bottom: 25, top: 15),
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * 0.3,
                      alignment: Alignment.center,
                      child: Text(
                        historyModel.betDetails![index].digit!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: size.width * 0.3,
                      alignment: Alignment.center,
                      child: Text(
                        historyModel.betDetails![index].amount!
                            .split(".")
                            .first,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: size.width * 0.3,
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: historyModel.status == "Unfinish"
                              ? AppColor.blue
                              : historyModel.betDetails![index].isWin!
                                  ? AppColor.win
                                  : AppColor.red,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(6, 6),
                              blurRadius: 4,
                              color: AppColor.unSelectedGrey,
                            ),
                          ],
                        ),
                        child: historyModel.status == "Unfinish"
                            ? const Text(
                                "ပွဲမပြီးသေးပါ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.nearlywhite),
                              )
                            : historyModel.betDetails![index].isWin!
                                ? const Text(
                                    "နိုင်သည်",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.nearlywhite),
                                  )
                                : const Text(
                                    "ရှုံးသည်",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.nearlywhite),
                                  ),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: historyModel.betDetails!.length),
        )
      ],
    );
  }
}

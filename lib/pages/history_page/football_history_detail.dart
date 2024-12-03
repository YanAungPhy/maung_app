import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/history/football_detail_bloc/football_detail_history_bloc.dart';
import '../../utils/global_import.dart';

class FootballHistoryDetailPage extends StatelessWidget {
  final int historyId;

  const FootballHistoryDetailPage({Key? key, required this.historyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FootballDetailHistoryBloc(getIt.call())..add(TapFootballHistoryDetailEvent(historyId: historyId)),
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColor.nearlywhite.withOpacity(.5),
          appBar: AppBar(
            backgroundColor: AppColor.greenBlack,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            title: const Text("မှတ်တမ်းများ"),
          ),
          body: Padding(
            padding:  EdgeInsets.all(16.0),
            child: BlocBuilder<FootballDetailHistoryBloc, FootballDetailHistoryBlocState>(
              builder: (context, state) {
                if (state is FootballDetailHistoryBlocLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FootballDetailHistoryBlocSuccess) {
                  final betDetailList = state.historyModelList;

                  return ListView.builder(
                    itemCount: betDetailList.length,
                    itemBuilder: (context, index) {
                      final betDetail = betDetailList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 6.0,
                        color: AppColor.greenDark3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 105,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6.0),
                                          color: betDetail.betTeam.nameInMM == betDetail.game.homeTeam.nameInMM
                                              ? AppColor.greenDark2 // Color when the values are equal
                                              : AppColor.greenPrimary, // Different color when the values are not equal
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center, // Centers the content horizontally
                                          children: [
                                            Text(
                                              "${betDetail.game.homeTeam.nameInMM}",
                                              style: TextStyle(color: Colors.white, fontSize: 14),
                                              overflow: TextOverflow.ellipsis, // Prevents overflow
                                            ),
                                            SizedBox(width: 4),
                                            Visibility(
                                              visible:betDetail.betUnder, // Controls visibility based on betUnder
                                              child: Icon(
                                                Icons.arrow_circle_up,
                                                color: Colors.white,
                                                size: 20, // Adjust size as needed
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ],
                                  ),

                                  // Date Container
                                  Container(
                                    width: 105,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: AppColor.greenPrimary,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      DateFormat('dd-MM-yyyy').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                          betDetail.game.endDateInMilliSeconds, // Changed to milliseconds
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12, // Adjusted font size for better readability
                                        color: AppColor.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  Stack(
                                    children: [
                                      Container(
                                        width: 105,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6.0),
                                          color: betDetail.betTeam.nameInMM == betDetail.game.awayTeam.nameInMM
                                              ? AppColor.greenDark2
                                              : AppColor.greenPrimary,
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${betDetail.game.awayTeam.nameInMM}",
                                              style: TextStyle(color: Colors.white, fontSize: 14),
                                              overflow: TextOverflow.ellipsis, // Prevents overflow
                                            ),
                                            SizedBox(width: 4),
                                            Visibility(
                                              visible:betDetail.betUnder, // Controls visibility based on betUnder
                                              child: Icon(
                                                Icons.arrow_circle_down,
                                                color: Colors.red,
                                                size: 20, // Adjust size as needed
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 105,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: AppColor.greenPrimary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${betDetail.game.homeBet}",
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 105,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: AppColor.greenPrimary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${betDetail.game.gp}",
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 105,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: AppColor.greenPrimary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${betDetail.game.awayBet}",
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Second Container
                            ],
                          ),
                        ),
                      );

                    },
                  );
                } else if (state is FootballDetailHistoryBlocFail) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return const Center(child: Text('Unknown state'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}


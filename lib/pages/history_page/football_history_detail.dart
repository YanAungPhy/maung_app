import 'package:flutter/cupertino.dart';

import '../../bloc/history/football_detail_bloc/football_detail_history_bloc.dart';
import '../../utils/global_import.dart';

class FootballHistoryDetailPage extends StatelessWidget {
  final int historyId; // ID is passed instead of the whole model

  const FootballHistoryDetailPage({Key? key, required this.historyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FootballDetailHistoryBloc(getIt.call())..add(TapFootballHistoryDetailEvent(historyId: historyId)),
      child: Scaffold(
        backgroundColor: AppColor.nearlywhite.withOpacity(.5),
        appBar: AppBar(
          backgroundColor: AppColor.greenBlack,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context); // This will navigate back to the previous screen
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

                    /*return Card(
                      margin:  EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding:  const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bet ID: ${betDetail.id}", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Game ID: ${betDetail.gameId}"),
                            Text("League: ${betDetail.game.homeTeam.nameInEng}"),
                             Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(child: Text("Porto")),
                                    Text("11-10-2024"),
                                    Text("Braga"),
                                  ],

                                )
                              ],

                            )
                          ],
                        ),
                      ),
                    );*/

                    return(
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: AppColor.greenPrimary,
                                  ),
                                  child: const SizedBox(
                                    child: Text("Porto",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                                  ),
                                ),

                                Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: AppColor.greenPrimary,
                                  ),
                                  child: const SizedBox(
                                    child: Text("11-10-2024",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                                  ),
                                ),

                                Container(
                                  width: 120,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: AppColor.greenPrimary,
                                  ),
                                  child: const SizedBox(
                                    child: Text("Braga",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                                  ),
                                ),
                              ],

                            )
                          ],

                        )
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
    );
  }
}


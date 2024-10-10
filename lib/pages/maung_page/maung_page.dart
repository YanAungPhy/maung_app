import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_d/bloc/football/manug/get_maung_match_cubit.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/utils/app_colors.dart';
import 'package:two_d/widgets/football_widget.dart';

import '../../models/soccer_bet_model.dart';
import '../bet_page/maung_bet.dart';

class MaungPage extends StatefulWidget {
  const MaungPage({Key? key}) : super(key: key);

  @override
  State<MaungPage> createState() => _MaungPageState();
}

class _MaungPageState extends State<MaungPage> {
  Map<int, Map<SoccerModel, SoccerBetDetailModel>> chooseMap = {};
  List<String> gpList = []; // List to store league group names

  @override
  void initState() {
    BlocProvider.of<GetMaungMatchCubit>(context).getMaungMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Maung"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<GetMaungMatchCubit, GetMaungMatchState>(
                  builder: (context, state) {
                    if (state is GetMaungMatchSuccess) {
                      return ListView.separated(
                        separatorBuilder: (ctx, index) =>
                            const SizedBox(height: 10),
                        itemCount: state.maungList.length,
                        itemBuilder: (ctx, index) {
                          final currentGpName =
                              state.maungList[index].leagueGroupName;
                          final isFirstOccurrence =
                              !gpList.contains(currentGpName);
                          if (isFirstOccurrence) {
                            gpList.add(currentGpName);
                          }
                          return FootballWidget(
                            showGpName: isFirstOccurrence,
                            onRemove: () {
                              if (chooseMap
                                  .containsKey(state.maungList[index].id)) {
                                chooseMap.remove(state.maungList[index].id);
                                setState(() {});
                              }
                            },
                            onChoose:
                                (Map<SoccerModel, SoccerBetDetailModel> val) {
                              chooseMap.containsKey(val.keys.first.id)
                                  ? chooseMap.remove(val.keys.first.id)
                                  : chooseMap[val.keys.first.id] = val;

                              setState(() {});
                            },
                            model: state.maungList[index],
                          );
                        },
                      );
                    } else if (state is GetMaungMatchFail) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Remove"),
                      onPressed: () {
                        setState(() {
                          chooseMap.clear();
                        });
                        BlocProvider.of<GetMaungMatchCubit>(context)
                            .getMaungMatch();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Total (${chooseMap.length})"),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Bet"),
                      onPressed: () {
                        print(chooseMap.length);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MaungBet(
                            chooseMap: chooseMap,
                          ),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

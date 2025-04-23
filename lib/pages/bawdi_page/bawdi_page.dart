import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_d/bloc/football/bawdi/get_bawdi_match_cubit.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/pages/bet_page/bawdi_bet.dart';

import '../../models/BodySoccerBetModel.dart';
import '../../widgets/body_football_widget.dart';

class BawDiPage extends StatefulWidget {
  const BawDiPage({super.key});

  @override
  State<BawDiPage> createState() => _BawDiPageState();
}

class _BawDiPageState extends State<BawDiPage> {
  Map<int, Map<SoccerModel, BodySoccerBetDetailModel>> chooseMap = {};
  List<String> gpList = []; // List to store league group names

  @override
  void initState() {
    BlocProvider.of<GetBawdiMatchCubit>(context).getBawdiMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("BawDi"),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<GetBawdiMatchCubit, GetBawdiMatchState>(
                      builder: (context, state) {
                    if (state is GetBawdiMatchSuccess) {
                      return ListView.separated(
                          separatorBuilder: (ctx, index) =>
                              const SizedBox(height: 20),
                          itemCount: state.bawdiList.length,
                          itemBuilder: (ctx, index) {
                            final currentGpName =
                                state.bawdiList[index].leagueGroupName;
                            final isFirstOccurrence =
                                !gpList.contains(currentGpName);
                            if (isFirstOccurrence) {
                              gpList.add(currentGpName);
                            }
                            return BodyFootballWidget(
                                showGpName: isFirstOccurrence,
                                onRemove: () {
                                  if (chooseMap
                                      .containsKey(state.bawdiList[index].id)) {
                                    chooseMap.remove(state.bawdiList[index].id);
                                    setState(() {});
                                  }
                                },
                                onChoose:
                                    (Map<SoccerModel, BodySoccerBetDetailModel>
                                        val) {
                                  chooseMap.containsKey(val.keys.first.id)
                                      ? chooseMap.remove(val.keys.first.id)
                                      : chooseMap[val.keys.first.id] = val;

                                  setState(() {});
                                },
                                model: state.bawdiList[index]);
                          });
                    } else if (state is GetBawdiMatchFail) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
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
                          gpList.clear();
                          chooseMap.clear();
                        });
                        BlocProvider.of<GetBawdiMatchCubit>(context)
                            .getBawdiMatch();
                      },
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      child: Text("Total (${chooseMap.length})"),
                      onPressed: () {},
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      child: const Text("Bet"),
                            onPressed: () async {
                              if (chooseMap.length > 1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Please select only one team.")),
                                );
                              } else {
                                final result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => BawdiBet(chooseMap: chooseMap),
                                  ),
                                );

                                if (result == true) {
                                  setState(() {
                                    chooseMap.clear();
                                  });
                                }
                              }
                            }


                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

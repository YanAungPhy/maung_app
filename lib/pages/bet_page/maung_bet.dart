import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_d/bloc/football/soccer_bet/soccer_bet_cubit.dart';
import 'package:two_d/models/soccer_bet_model.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/widgets/football_view_card.dart';
import 'package:two_d/widgets/football_widget.dart';
import 'package:two_d/widgets/show_loading.dart';

import '../../bloc/football/manug/get_maung_match_cubit.dart';

class MaungBet extends StatefulWidget {
  final Map<int, Map<SoccerModel, SoccerBetDetailModel>> chooseMap;
  const MaungBet({super.key, required this.chooseMap});

  @override
  State<MaungBet> createState() => _MaungBetState();
}

class _MaungBetState extends State<MaungBet> {
  final TextEditingController amountController = TextEditingController();

  List<SoccerModel> chosenList = [];
  List<SoccerBetDetailModel> betDetailList = [];

  @override
  void initState() {
    loadData();

    super.initState();
  }

  void loadData() {
    Map<SoccerModel, SoccerBetDetailModel> chooseValues = {};
    print("length");
    print(widget.chooseMap.values.length);
    for (Map<SoccerModel, SoccerBetDetailModel> val
    in widget.chooseMap.values) {
      chooseValues[val.keys.first] = val.values.first;
    }
    chosenList = chooseValues.keys.toList();
    betDetailList = chooseValues.values.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bet now"),
      ),
      body: BlocListener<SoccerBetCubit, SoccerBetState>(
        listener: (context, state) {
          if (state is SoccerBetLoading) {
            showLoading(context);
          } else if (state is SoccerBetFail) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is SoccerBetSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Success")));
            BlocProvider.of<GetMaungMatchCubit>(context).getMaungMatch();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter amount"),
                    controller: amountController,
                    onChanged: (String text) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text(
                      "Minimun Bet (500 Kyats)",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("You choose"),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (ctx, index) =>
                      const SizedBox(height: 20),
                      itemCount: chosenList.length,
                      itemBuilder: (ctx, index) {
                        return FootballViewCard(
                            detailModel: betDetailList[index],
                            model: chosenList[index]);
                      }),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                child: const Text("Bet Now"),
                onPressed: amountController.text.isEmpty ||
                    (int.tryParse(amountController.text) ?? 0) < 500
                    ? null
                    : () {
                  BlocProvider.of<SoccerBetCubit>(context).bet(
                      SoccerBetModel(
                          gameType: "Maung",
                          amount: int.parse(amountController.text),
                          soccerBetDetails: betDetailList));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

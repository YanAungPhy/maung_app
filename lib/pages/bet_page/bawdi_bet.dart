import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_d/bloc/football/bawdi/get_bawdi_match_cubit.dart';
import 'package:two_d/bloc/football/manug/get_maung_match_cubit.dart';
import 'package:two_d/models/soccer_model.dart';

import '../../bloc/football/soccer_bet/body_soccer_bet_cubit.dart';
import '../../models/BodySoccerBetModel.dart';
import '../../widgets/body_football_view_card.dart';
import '../../widgets/show_loading.dart';

class BawdiBet extends StatefulWidget {
  final Map<int, Map<SoccerModel, BodySoccerBetDetailModel>> chooseMap;

  const BawdiBet({super.key, required this.chooseMap});

  @override
  State<BawdiBet> createState() => _BawdiBetState();
}

class _BawdiBetState extends State<BawdiBet> {
  final TextEditingController amountController = TextEditingController();

  List<SoccerModel> chosenList = [];
  List<BodySoccerBetDetailModel> betDetailList = [];

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    Map<SoccerModel, BodySoccerBetDetailModel> chooseValues = {};
    int betAmount =
        int.tryParse(amountController.text) ?? 0; // Get value from controller

    for (Map<SoccerModel, BodySoccerBetDetailModel> val
    in widget.chooseMap.values) {
      SoccerModel soccerModel = val.keys.first;
      BodySoccerBetDetailModel detailModel = val.values.first.copyWith(
        betAmount: betAmount,
      );

      chooseValues[soccerModel] = detailModel;
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
      body: BlocListener<BodySoccerBetCubit, BodySoccerBetState>(
        listener: (context, state) {
          if (state is BodySoccerBetLoading) {
            showLoading(context);
          } else if (state is BodySoccerBetFail) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              duration: const Duration(seconds: 1),
            ));
          } else if (state is BodySoccerBetSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Success")));
            BlocProvider.of<GetBawdiMatchCubit>(context).getBawdiMatch();
            //BlocProvider.of<GetMaungMatchCubit>(context).getMaungMatch();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
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
                      return BodyFootballViewCard(
                        detailModel: betDetailList[index],
                        model: chosenList[index],
                      );
                    },
                  ),
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
                  int betAmount =
                      int.tryParse(amountController.text) ?? 0;
                  betDetailList = betDetailList.map((detail) {
                    return detail.copyWith(betAmount: betAmount);
                  }).toList();

                  BlocProvider.of<BodySoccerBetCubit>(context).bet(
                    BodySoccerBetModel(
                      gameType: "Body",
                      soccerBetDetails: betDetailList,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

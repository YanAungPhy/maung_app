import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/models/soccer_bet_model.dart';
import 'package:two_d/utils/app_colors.dart';

import '../models/BodySoccerBetModel.dart';

class BodyFootballViewCard extends StatefulWidget {
  final BodySoccerBetDetailModel detailModel;
  final SoccerModel model;
  const BodyFootballViewCard({
    required this.detailModel,
    required this.model,
    super.key,
  });

  @override
  State<BodyFootballViewCard> createState() => _FootballViewCardState();
}

class _FootballViewCardState extends State<BodyFootballViewCard> {
  bool isResultTap = true;
  String? isTeamOne;

  @override
  void initState() {
    //isTeamOne = !widget.detailModel.betUnder; //yap
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    // onTap: !isResultTap
                    //     ? null

                    onTap: () {
                      setState(() {
                        isTeamOne = "true";
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: isTeamOne == "true"
                                  ? AppColor.greenDark2
                                  : AppColor.greenPrimary,
                              borderRadius: BorderRadius.circular(6)),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.model.homeTeam.nameInMM,
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        !isResultTap
                            ? Container()
                            : const Positioned(
                            top: 1,
                            bottom: 1,
                            right: 5,
                            child: Icon(
                              Icons.arrow_circle_up,
                              color: AppColor.white,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.greenPrimary,
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text(
                        DateFormat('dd-MM-yyyy').format(
                          DateTime.fromMicrosecondsSinceEpoch(
                            widget.model.startDateInMilliSeconds * 1000,
                          ),
                        ),
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    // onTap: !isResultTap
                    //     ? null
                    //     :
                    onTap: () {
                      setState(() {
                        isTeamOne = "false";
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: isTeamOne == "false"
                                  ? AppColor.greenDark2
                                  : AppColor.greenPrimary,
                              borderRadius: BorderRadius.circular(6)),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.model.awayTeam.nameInMM,
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        !isResultTap
                            ? Container()
                            : const Positioned(
                            top: 1,
                            bottom: 1,
                            right: 5,
                            child: Icon(
                              Icons.arrow_circle_down,
                              color: Colors.red,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.greenPrimary,
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.model.homeBet,
                      style: TextStyle(
                          color: AppColor.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isResultTap = !isResultTap;
                        isTeamOne = "null";
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isResultTap
                              ? AppColor.greenDark2
                              : AppColor.greenPrimary,
                          borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.model.gp,
                        style: TextStyle(
                            color: AppColor.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.greenPrimary,
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.model.awayBet,
                      style: TextStyle(
                          color: AppColor.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:two_d/models/soccer_model.dart';
import 'package:two_d/utils/app_colors.dart';

import '../models/BodySoccerBetModel.dart';

class BodyFootballWidget extends StatefulWidget {
  final Function(Map<SoccerModel, BodySoccerBetDetailModel> chooseMap) onChoose;
  final VoidCallback onRemove;
  final SoccerModel model;
  final bool showGpName;
  const BodyFootballWidget({
    required this.onChoose,
    required this.onRemove,
    required this.model,
    required this.showGpName,
    super.key,
  });

  @override
  State<BodyFootballWidget> createState() => _FootballWidgetState();
}

class _FootballWidgetState extends State<BodyFootballWidget> {
  bool isResultTap = false;
  bool? isTeamOne;
  bool isChooseGp = false;
  String? betUnderValue = "null";

  @override
  Widget build(BuildContext context) {
    // if (!widget.model.betOpen || !widget.model.gameOpen) {
    //   return Container();
    // }

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // widget.showGpName
          //     ? SizedBox(
          //   height: 50,
          //   child: Text(
          //     widget.model.leagueGroupName,
          //     style: TextStyle(color: Colors.white),
          //   ),
          // )
          //     : Container(),
          SizedBox(
            height: 20,
            child: Text(
              widget.model.leagueGroupName,
              style: TextStyle(color: Colors.white),
            ),
          ),

          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    // onTap: !isResultTap
                    //     ? null
                    //     : () {

                    onTap: () {
                      setState(() {
                        isTeamOne = true;
                      });

                      if (isChooseGp == true) {
                        betUnderValue = "false";
                      } else {
                        betUnderValue = "null";
                      }

                      widget.onRemove();

                      widget.onChoose({
                        widget.model: BodySoccerBetDetailModel(
                          betTeamId: widget.model.homeTeamId,
                          gameId: widget.model.id,
                          betUnder: betUnderValue,
                          betAmount: 0,
                        )
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: isTeamOne == true
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
                            widget.model.endDateInMilliSeconds * 1000,
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
                        isTeamOne = false;
                      });

                      if (isChooseGp == true) {
                        betUnderValue = "true";
                      } else {
                        betUnderValue = "null";
                      }
                      widget.onRemove();

                      widget.onChoose({
                        widget.model: BodySoccerBetDetailModel(
                          betTeamId: widget.model.awayTeamId,
                          gameId: widget.model.id,
                          betUnder: betUnderValue,
                          betAmount: 2000,
                        )
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: isTeamOne == false
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
                        isTeamOne = null;
                        isChooseGp = !isChooseGp!;
                      });

                      widget.onRemove();
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

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:two_d/bloc/get_user/bloc/get_user_bloc.dart';
import 'package:two_d/models/trans_history_model.dart';
import 'package:two_d/network/repository/get_user_repo.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/pages/wallet_page/color_helper.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/get_banks/bloc/get_banks_bloc.dart';
import '../../bloc/transaction_history/bloc/transacion_history_bloc.dart';
import '../cash_in_page/cash_in_page.dart';
import '../cash_out_page/cash_out_page.dart';

class WalletPage extends StatefulWidget {
  WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<TransHistoryModel> transHistoryModelList = [];
  final refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    BlocProvider.of<GetUserBloc>(context).add(TapGetUserEvent());
    BlocProvider.of<TransacionHistoryBloc>(context)
        .add(TapTransactionHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("ပိုက်ဆံအိတ်"),
        leading: const Icon(Icons.account_balance_wallet_rounded),
        backgroundColor: AppColor.greenBlack,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            balanceWidget(),
            cashWidget(size, context),
            Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: AppColor.greenDark, boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: Offset(0, 5))
              ]),
              child: const Center(
                child: Text(
                  "ငွေ သွင်း / ထုတ် မှတ်တမ်း",
                  style: TextStyle(
                      color: AppColor.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
            historyWidget(),
          ],
        ),
      ),
    );
  }

  Widget historyWidget() {
    return BlocConsumer<TransacionHistoryBloc, TransacionHistoryState>(
        listener: (context, state) {
      if (state is TransacionHistorySuccess) {
        if (state.isFirst) {
          refreshController.refreshCompleted();
          refreshController.resetNoData();
        } else {
          refreshController.loadComplete();
        }
      }
      if (state is TransacionHistoryNoMore) {
        refreshController.loadNoData();
      }
    }, builder: (context, state) {
      if (state is TransacionHistorySuccess) {
        if (state.transHistoryModelList.isNotEmpty) {
          if (state.isFirst) {
            transHistoryModelList = state.transHistoryModelList;
          } else {
            transHistoryModelList.addAll(state.transHistoryModelList);
          }
          return listVbuilder();
        } else {
          return Expanded(
          child: Container(
            color: AppColor.white.withOpacity(.5),
            child: const ErrorPage(error: "မှတ်တမ်းမရှိပါ"),
          ),
        );
        }
      } else if (state is TransacionHistoryFail) {
        return Expanded(
          child: Container(
            color: AppColor.white.withOpacity(.5),
            child: ErrorPage(error: state.error),
          ),
        );
      } else if (state is TransacionHistoryNoMore) {
        return listVbuilder();
      } else {
        return Expanded(
          child: Container(
            color: AppColor.white.withOpacity(.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
    });
  }

  Widget listVbuilder() {
    return Expanded(
      child: Container(
        color: AppColor.white.withOpacity(.5),
        child: SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: transHistoryModelList.length > 9,
          onRefresh: () {
            BlocProvider.of<TransacionHistoryBloc>(context)
                .add(TapTransactionHistoryEvent());
          },
          onLoading: () {
            BlocProvider.of<TransacionHistoryBloc>(context)
                .add(TapTransactionHistoryMoreEvent());
          },
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          color: AppColor.greenDark, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          transHistoryModelList[index].id.toString(),
                          style: const TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: 18),
                        ),
                      )),
                  title: transHistoryModelList[index].type == "Out"
                      ? const Text(
                          "Cash Out",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: 18),
                        )
                      : Text(
                          transHistoryModelList[index].transactionId!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: 18),
                        ),
                  subtitle:
                      Text(transHistoryModelList[index].paymentMethodName!),
                  trailing: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: ColorHelper.getColor(
                          status: transHistoryModelList[index].status!),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(6, 6),
                          blurRadius: 4,
                          color: AppColor.unSelectedGrey,
                        ),
                      ],
                    ),
                    child: Text(
                      ColorHelper.getText(
                          status: transHistoryModelList[index].status!),
                      style: const TextStyle(
                        color: AppColor.nearlywhite,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
              itemCount: transHistoryModelList.length),
        ),
      ),
    );
  }

  Widget cashWidget(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            context.go(BlocProvider<GetBanksBloc>(
              create: (context) => GetBanksBloc(getIt.call()),
              child: const CashInPage(),
            ));
          },
          child: Container(
            width: size.width * 0.35,
            height: 90,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/icons/cashin_color.png",
                    height: 40,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(13),
                        bottomStart: Radius.circular(13),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "ငွေဖြည့်",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.go(BlocProvider<GetBanksBloc>(
              create: (context) => GetBanksBloc(getIt.call()),
              child: const CashOutPage(),
            ));
          },
          child: Container(
            width: size.width * 0.35,
            height: 90,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/icons/cashout_color.png",
                    height: 40,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(13),
                        bottomStart: Radius.circular(13),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "ငွေထုတ်",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget balanceWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(.3),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.teal, width: 2),
            ),
            child: BlocBuilder<GetUserBloc, GetUserState>(
              builder: (context, state) {
                if (state is GetUserSuccess) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "လက်ကျန်ငွေ  :   ",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          children: [
                            TextSpan(
                              text: state.userModel.balance!.round().toString(),
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            const TextSpan(
                              text: "  ကျပ်",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<GetUserBloc>(context)
                              .add(TapGetUserEvent());
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.tealAccent,
                        ),
                      ),
                    ],
                  );
                } else if (state is GetUserFail) {
                  return Center(
                    child: Text(
                      state.error,
                      style: const TextStyle(color: AppColor.white),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

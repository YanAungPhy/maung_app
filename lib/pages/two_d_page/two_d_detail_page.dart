import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:two_d/bloc/bet_bloc/bloc/bet_bloc.dart';
import 'package:two_d/pages/app_page/app_page.dart';
import 'package:two_d/utils/global_import.dart';
import '../../models/bet_body_model.dart';

class TwoDDetail extends StatefulWidget {
  final List<BetBodyDetailsModel> betDetailModelList;
  final String balance;
  const TwoDDetail(
      {super.key, required this.betDetailModelList, required this.balance});

  @override
  State<TwoDDetail> createState() => _TwoDDetailState();
}

class _TwoDDetailState extends State<TwoDDetail> {
  List<TextEditingController> controller = [];
  List<bool> isEnable = [];
  final formKey = GlobalKey<FormState>();
  List<BetBodyDetailsModel> betDetailModelList = [];
  @override
  void initState() {
    betDetailModelList = widget.betDetailModelList;
    betDetailModelList.sort((a, b) => a.digit.compareTo(b.digit));

    for (int i = 0; i < betDetailModelList.length; i++) {
      controller.add(TextEditingController(text: betDetailModelList[i].amount));
    }

    super.initState();
  }

  String getTotalCharge() {
    int total = 0;
    for (int i = 0; i < betDetailModelList.length; i++) {
      int amount = int.parse(betDetailModelList[i].amount);
      total = total + amount;
    }
    return total.toString();
  }

  bool isBalanceEnough() {
    double balance = double.parse(widget.balance);
    double totalAmount = double.parse(getTotalCharge());
    if (totalAmount > balance) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.greenBlack,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: const Icon(Icons.close)),
        title: const Text(
          "စာရင်း",
        ),
        actions: [
          Row(
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.amber.shade700,
                size: 25,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.balance,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "ကျပ်",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 0,
          ),
          child: Column(
            children: [
              addNew(context),
              title(size),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: betDetailModelList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      isEnable.add(false);
                      return listChild(size, index);
                    },
                  ),
                ),
              ),
              bottomBar(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget addNew(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              if (betDetailModelList.isEmpty) {
                Navigator.pop(context);
                return;
              }
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    TextEditingController addNewController =
                        TextEditingController();

                    TextEditingController valueController =
                        TextEditingController();
                    final fKey = GlobalKey<FormState>();
                    return AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${betDetailModelList[0].digit.length == 2 ? '2D' : '3D'} ဂဏန်းအသစ်ထည့်ပါ",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      content: Form(
                        key: fKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "ဂဏန်းထည့်ပါ",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  )),
                              keyboardType: TextInputType.number,
                              controller: addNewController,
                              validator: (val) {
                                if (betDetailModelList[0].digit.length == 2 &&
                                    val!.length != 2) {
                                  return "၂ လုံးထည့်ရမည်";
                                }
                                if (betDetailModelList[0].digit.length == 3 &&
                                    val!.length != 3) {
                                  return "၃ လုံးထည့်ရမည်";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "ထိုးကြေးထည့်ပါ",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  )),
                              keyboardType: TextInputType.number,
                              controller: valueController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "ထိုးကြေးထည့်ပါ";
                                }
                                if (int.parse(val) < 100) {
                                  return "100 အနည်းဆုံးထိုးပါ";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            if (!fKey.currentState!.validate()) {
                              return;
                            }
                            Navigator.of(context).pop(
                              BetBodyDetailsModel(
                                  digit: addNewController.text,
                                  amount: valueController.text),
                            );
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  }).then((value) {
                if (value != null) {
                  BetBodyDetailsModel aa = value as BetBodyDetailsModel;
                  betDetailModelList.add(aa);
                  controller!.add(TextEditingController(text: aa.amount));
                  betDetailModelList.sort((a, b) => a.digit.compareTo(b.digit));
                  setState(() {});
                }
              });
            },
            label: const Text("အသစ်ထည့်ရန်"),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColor.unSelectedGrey.withOpacity(.3),
              offset: const Offset(-1, 0),
              spreadRadius: 1,
              blurRadius: 4)
        ],
        color: AppColor.nearlywhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          isBalanceEnough()
              ? Container()
              : SizedBox(
                  height: 25,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColor.red,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        ScaleAnimatedText('လက်ကျန်ငွေမလုံလောက်ပါ'),
                      ],
                    ),
                  ),
                ),
          Text.rich(
            TextSpan(
              text: "စုစုပေါင်းထိုးငွေ   -   ",
              children: [
                TextSpan(
                  text: getTotalCharge(),
                  style: TextStyle(
                    color: isBalanceEnough()
                        ? AppColor.greenPrimary
                        : AppColor.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(text: "   ကျပ်"),
              ],
              style: const TextStyle(
                color: AppColor.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.left(const AppPage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.red, elevation: 5),
                child: const Text("မထိုးတေ့ာပါ"),
              ),
              ElevatedButton(
                onPressed: !isBalanceEnough() || betDetailModelList.isEmpty
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return BlocProvider<BetBloc>(
                              create: (context) => BetBloc(getIt.call())
                                ..add(TapBetEvent(
                                    betBody: BetBody(
                                        gameType:
                                            betDetailModelList[0].digit.length <
                                                    3
                                                ? "2D"
                                                : "3D",
                                        betDetails: betDetailModelList))),
                              child: BlocBuilder<BetBloc, BetState>(
                                builder: (context, state) {
                                  String message =
                                      betDetailModelList[0].digit.length < 3
                                          ? "2D ထိုးခြင်းအောင်မြင်ပါသည်"
                                          : "3D ထိုးခြင်းအောင်မြင်ပါသည်";
                                  if (state is BetSuccess) {
                                    return AlertDialog(
                                      title: const Center(
                                        child: Text(
                                          "အောင်မြင်ပါသည်",
                                          style: TextStyle(
                                            color: AppColor.greenPrimary,
                                          ),
                                        ),
                                      ),
                                      content: Text(
                                        message,
                                        style: const TextStyle(
                                          color: AppColor.greenPrimary,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            context.go(const AppPage());
                                          },
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                                color: AppColor.greenDark),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (state is BetFail) {
                                    String error = state.error ==
                                            "Balance not sufficient."
                                        ? "လက်ကျန်ငွေမလုံလောက်ပါ"
                                        : state.error.startsWith("Digit:")
                                            ? "${state.error.split("'s").first.split(" ").last} သည် ကန့်သတ်ပမာဏထက်ကျော်လွန်နေပါသည်"
                                            : state.error;
                                    return AlertDialog(
                                      title: const Center(
                                        child: Text(
                                          "မအောင်မြင်ပါ",
                                          style: TextStyle(
                                            color: AppColor.red,
                                          ),
                                        ),
                                      ),
                                      content: Text(
                                        error,
                                        style: const TextStyle(
                                          color: AppColor.red,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            context.back();
                                          },
                                          child: const Text(
                                            "OK",
                                            style:
                                                TextStyle(color: AppColor.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const AlertDialog(
                                      title: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.greenPrimary, elevation: 5),
                child: const Text("ထိုးမယ်"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listChild(Size size, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width * 0.3,
          child: Text(
            betDetailModelList[index].digit,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: size.width * 0.3,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "amount cannot be empty";
              }
              if (int.parse(value) < 100) {
                return "၁၀၀ အနည်းဆုံးထိုးပါ";
              }
              return null;
            },
            controller: controller![index],
            onChanged: (val) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  betDetailModelList[index].amount = controller![index].text;
                });
              }
              null;
            },
            onEditingComplete: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  betDetailModelList[index].amount = controller![index].text;
                  isEnable[index] = false;
                });
              }
              null;
            },
            decoration: InputDecoration(
              enabled: isEnable[index],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: AppColor.greenPrimary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: AppColor.blue,
                  width: 1.0,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isEnable[index]) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          betDetailModelList[index].amount =
                              controller![index].text;
                          isEnable[index] = false;
                        });
                      }
                      null;
                    } else {
                      isEnable[index] = true;
                    }
                  });
                },
                child: Icon(
                  Icons.edit,
                  size: 20,
                  color:
                      isEnable[index] ? AppColor.blue : AppColor.unSelectedGrey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    betDetailModelList.removeAt(index);
                    controller!.removeAt(index);
                  });
                },
                child: const Icon(
                  Icons.delete,
                  size: 20,
                  color: AppColor.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget title(Size size) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Container(
              width: size.width * 0.33,
              alignment: Alignment.center,
              child: const Text(
                "နံပါတ်များ",
                maxLines: 1,
                style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          FittedBox(
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.3,
              child: const Text(
                "ထိုးကြေး",
                maxLines: 1,
                style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          FittedBox(
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.3,
              child: const Text(
                "လုပ်ဆောင်ချက်များ",
                maxLines: 1,
                style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:two_d/pages/two_d_page/two_d_detail_page.dart';
import 'package:two_d/utils/global_import.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:two_d/utils/util.dart';
import '../../models/bet_body_model.dart';

class TwoDPage extends StatefulWidget {
  final String balance;
  const TwoDPage({super.key, required this.balance});

  @override
  State<TwoDPage> createState() => _TwoDPageState();
}

class _TwoDPageState extends State<TwoDPage> {
  late List<String> numList;
  List<BetBodyDetailsModel> betDetailList = [];
  int selectedWidget = 0;
  late List<String> shortNumList;
  Iterable<String>? pathee;
  Iterable<String>? htiteSee;
  Iterable<String>? noutPate;
  Iterable<String>? brake;
  Iterable<String>? oddFirst;
  Iterable<String>? oddLast;
  Iterable<String>? evenFirst;
  Iterable<String>? evenLast;
  Iterable<String>? power;
  Iterable<String>? powerR;
  Iterable<String>? natKet;
  Iterable<String>? natKetR;
  Iterable<String>? aPuu;
  Iterable<String>? evenEven;
  Iterable<String>? oddOdd;
  Iterable<String>? evenOdd;
  Iterable<String>? oddEven;
  String? dropdownvalue;
  List<String> items = ["00-19", "20-39", "40-59", "60-79", "80-99"];

  final formKey = GlobalKey<FormState>();
  TextEditingController amountTextController = TextEditingController();
  String? amount;
  final ScrollController _scrollController = ScrollController();
  bool isReverse = false;

  @override
  void initState() {
    numList = [for (var i = 0; i < 100; i++) i.toString().padLeft(2, "0")];
    shortNumList = [for (var i = 0; i < 10; i++) i.toString()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> centerWidget = [
      numbersWidget(),
      specialWidget(),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              selectedNumberWidget(size),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.unSelectedGrey.withOpacity(.5),
                          offset: const Offset(-2, -2),
                          spreadRadius: 1,
                          blurRadius: 8)
                    ],
                    color: AppColor.nearlywhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: centerWidget[selectedWidget],
                ),
              ),
              bottomBarWidget(size)
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBarWidget(Size size) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColor.unSelectedGrey.withOpacity(.8),
              offset: const Offset(-2, -2),
              spreadRadius: 1,
              blurRadius: 8)
        ],
        color: AppColor.nearlywhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: size.width * 0.5,
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
                  onEditingComplete: () {
                    if (formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        amount = amountTextController.text;
                      });
                    }
                    null;
                  },
                  onChanged: (value) {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        amount = amountTextController.text;
                      });
                    }
                    null;
                  },
                  autofocus: true,
                  controller: amountTextController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("ထိုးကြေးထည့်ပါ"),
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController _textEditingController =
                            TextEditingController();
                        return AlertDialog(
                          title: Text('ဒီမှာကူးထည့်ပါ'),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: TextField(
                              controller: _textEditingController,
                              maxLines: 10, // Maximum of 10 lines
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: Text('မလုပ်တော့ပါ'),
                            ),
                            TextButton(
                              onPressed: () {
                                List<BetBodyDetailsModel> betList = [];
                                List<String> inputs =
                                    _textEditingController.text.split("\n");
                                for (String input in inputs) {
                                  betList.addAll(
                                      List.from(Util.parseInput(input)));
                                  setState(() {});
                                }

                                context
                                    .go(TwoDDetail(
                                  betDetailModelList: betList,
                                  balance: widget.balance,
                                ))
                                    .then((value) {
                                  setState(() {});
                                }); // Close dialog
                              },
                              child: Text('ထိုးမယ်'),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.paste),
                label: const Text("ကူးထည့်ရန်"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.onetwothree),
                onPressed: () {
                  setState(() {
                    selectedWidget = 0;
                  });
                },
                label: const Text("နံပါတ်များ"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.star),
                onPressed: () {
                  setState(() {
                    selectedWidget = 1;
                  });
                },
                label: const Text("Special"),
              ),
              TextButton(
                onPressed: () {
                  if (betDetailList.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text.rich(
                          TextSpan(
                            text: "Fail!   :   ",
                            style: TextStyle(
                                color: Colors.red,
                                letterSpacing: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                            children: <InlineSpan>[
                              TextSpan(
                                text: "အနည်းဆုံးဂဏန်းတစ်ခုရွေးပါ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    if (formKey.currentState!.validate()) {
                      context
                          .go(TwoDDetail(
                        betDetailModelList: betDetailList,
                        balance: widget.balance,
                      ))
                          .then((value) {
                        setState(() {});
                      });
                    }
                    null;
                  }
                },
                child: const Text("ထိုးမယ်"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectedNumberWidget(Size size) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: size.height * 0.3,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            childAspectRatio: 3 / 1.4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemCount: betDetailList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.nearlywhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: AppColor.unSelectedGrey,
                    offset: Offset(2, 4),
                    spreadRadius: 1,
                    blurRadius: 2)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  betDetailList[index].digit,
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColor.greenBlack,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      betDetailList.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                    color: AppColor.unSelectedGrey,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget specialWidget() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ပါတ်သီး",
              style: TextStyle(
                color: AppColor.unSelectedGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            easyGrid(label: "ပါတ်"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "ထိပ်စီး",
              style: TextStyle(
                color: AppColor.unSelectedGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            easyGrid(label: "ထိပ်"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "နောက်ပိတ်",
              style: TextStyle(
                color: AppColor.unSelectedGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            easyGrid(label: "ပိတ်"),
            const Text(
              "ဘရိတ်",
              style: TextStyle(
                color: AppColor.unSelectedGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            easyGrid(label: "ဘရိတ်"),
            collectionWidget(),
          ],
        ),
      ),
    );
  }

  GridView easyGrid({required String label}) {
    return GridView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: shortNumList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 65,
          childAspectRatio: 3 / 2.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (formKey.currentState!.validate()) {
              switch (label) {
                case "ပါတ်":
                  pathee = numList.where(
                      (element) => element.contains(shortNumList[index]));

                  pathee?.forEach((element) {
                    if (betDetailList
                            .firstWhereOrNull((val) => val.digit == element) !=
                        null) {
                      null;
                    } else {
                      setState(() {
                        betDetailList.add(
                          BetBodyDetailsModel(amount: amount!, digit: element),
                        );
                      });
                    }
                  });
                  break;
                case "ထိပ်":
                  htiteSee = numList.where(
                      (element) => element.startsWith(shortNumList[index]));

                  htiteSee?.forEach((element) {
                    if (betDetailList
                            .firstWhereOrNull((val) => val.digit == element) !=
                        null) {
                      null;
                    } else {
                      setState(() {
                        betDetailList.add(
                          BetBodyDetailsModel(amount: amount!, digit: element),
                        );
                      });
                    }
                  });
                  break;
                case "ပိတ်":
                  noutPate = numList.where(
                      (element) => element.endsWith(shortNumList[index]));

                  noutPate?.forEach((element) {
                    if (betDetailList
                            .firstWhereOrNull((val) => val.digit == element) !=
                        null) {
                      null;
                    } else {
                      setState(() {
                        betDetailList.add(
                          BetBodyDetailsModel(amount: amount!, digit: element),
                        );
                      });
                    }
                  });
                  break;
                case "ဘရိတ်":
                  if (index == 0) {
                    brake = ["00"];
                  } else {
                    brake = numList.where((element) {
                      int a = int.parse(element.split("").first);
                      int b = int.parse(element.split("").last);
                      if (a + b == index || a + b == index + 10) {
                        return true;
                      } else {
                        return false;
                      }
                    });
                  }

                  brake?.forEach((element) {
                    if (betDetailList
                            .firstWhereOrNull((val) => val.digit == element) !=
                        null) {
                      null;
                    } else {
                      setState(() {
                        betDetailList.add(
                          BetBodyDetailsModel(amount: amount!, digit: element),
                        );
                      });
                    }
                  });

                  break;
                default:
                  break;
              }
            }
            null;
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.greenPrimary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: AppColor.unSelectedGrey,
                    offset: Offset(2, 4),
                    spreadRadius: 1,
                    blurRadius: 8)
              ],
            ),
            child: FittedBox(
              child: Text(
                "${shortNumList[index]} $label",
                maxLines: 1,
                style: const TextStyle(
                  color: AppColor.nearlywhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget collectionWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "စုစည်းမှု",
          style: TextStyle(
            color: AppColor.unSelectedGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    evenFirst = numList.where(
                        (element) => int.parse(element.split('').first).isEven);

                    evenFirst?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "ရှေစုံ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    evenFirst = numList.where(
                        (element) => int.parse(element.split('').last).isEven);

                    evenFirst?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "နောက်စုံ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    evenFirst = numList.where(
                        (element) => int.parse(element.split('').first).isOdd);

                    evenFirst?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "ရှေမ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    evenFirst = numList.where(
                        (element) => int.parse(element.split('').last).isOdd);

                    evenFirst?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "နောက်မ"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    aPuu = numList.where((element) =>
                        int.parse(element.split('').first) ==
                        int.parse(element.split('').last));
                    aPuu?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "အပူး"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    evenEven = numList.where((element) =>
                        int.parse(element.split('').first).isEven &&
                        int.parse(element.split('').last).isEven);
                    evenEven?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "စုံစုံ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    oddOdd = numList.where((element) =>
                        int.parse(element.split('').first).isOdd &&
                        int.parse(element.split('').last).isOdd);
                    oddOdd?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "မမ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    evenOdd = numList.where((element) =>
                        int.parse(element.split('').first).isEven &&
                        int.parse(element.split('').last).isOdd);
                    evenOdd?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "စုံမ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    oddEven = numList.where((element) =>
                        int.parse(element.split('').first).isOdd &&
                        int.parse(element.split('').last).isEven);
                    oddEven?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "မစုံ"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    power = numList.where((element) {
                      int a = int.parse(element.split('').first);
                      int b = int.parse(element.split('').last);
                      if (a + 5 == b) {
                        return true;
                      } else {
                        return false;
                      }
                    });

                    power?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "ပါ၀ါ"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    powerR = numList.where((element) {
                      int a = int.parse(element.split('').first);
                      int b = int.parse(element.split('').last);
                      if (b + 5 == a) {
                        return true;
                      } else {
                        return false;
                      }
                    });

                    powerR?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "ပါ၀ါ R"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    natKet = ['07', '18', '24', '35', '69'];
                    natKet?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "နတ်ခတ်"),
            buttonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    natKetR = ['70', '81', '42', '53', '96'];
                    natKetR?.forEach((element) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    });
                  }
                  null;
                },
                text: "နတ်ခတ် R"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }

  Widget buttonWidget({required Function onPressed, required String text}) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.greenPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: AppColor.unSelectedGrey,
                offset: Offset(2, 4),
                spreadRadius: 1,
                blurRadius: 8)
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.nearlywhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget numbersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 35,
          margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: dropdownvalue,
                hint: const Text(
                  "အလွယ်ရွေးရန်",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? val) {
                  if (formKey.currentState!.validate()) {
                    List<String> easySelect = [];
                    switch (val) {
                      case "00-19":
                        for (int i = 0; i < 20; i++) {
                          easySelect.add(numList[i]);
                        }
                        break;
                      case "20-39":
                        for (int i = 20; i < 40; i++) {
                          easySelect.add(numList[i]);
                        }
                        break;
                      case "40-59":
                        for (int i = 40; i < 60; i++) {
                          easySelect.add(numList[i]);
                        }
                        break;
                      case "60-79":
                        for (int i = 60; i < 80; i++) {
                          easySelect.add(numList[i]);
                        }
                        break;
                      case "80-99":
                        for (int i = 80; i < 100; i++) {
                          easySelect.add(numList[i]);
                        }
                        break;
                      default:
                        break;
                    }
                    for (String element in easySelect) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == element) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          betDetailList.add(
                            BetBodyDetailsModel(
                                amount: amount!, digit: element),
                          );
                        });
                      }
                    }
                    setState(() {
                      dropdownvalue = val;
                    });
                  }
                  null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: isReverse,
                    onChanged: (val) {
                      setState(() {
                        isReverse = val!;
                      });
                    },
                  ),
                  const Text(
                    'R',
                    style: TextStyle(
                      color: AppColor.greenPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 65,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: numList.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (betDetailList.firstWhereOrNull(
                              (val) => val.digit == numList[index]) !=
                          null) {
                        null;
                      } else {
                        setState(() {
                          if (isReverse &&
                              numList[index].split('').first !=
                                  numList[index].split('').last) {
                            betDetailList.add(
                              BetBodyDetailsModel(
                                  amount: amount!, digit: numList[index]),
                            );
                            betDetailList.add(
                              BetBodyDetailsModel(
                                  amount: amount!,
                                  digit: numList[index]
                                      .split('')
                                      .reversed
                                      .join('')),
                            );
                          } else {
                            betDetailList.add(
                              BetBodyDetailsModel(
                                  amount: amount!, digit: numList[index]),
                            );
                          }
                        });
                      }
                    }
                    null;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: betDetailList.firstWhereOrNull(
                                  (val) => val.digit == numList[index]) !=
                              null
                          ? AppColor.unSelectedGrey
                          : AppColor.greenPrimary,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                            color: AppColor.unSelectedGrey,
                            offset: Offset(2, 4),
                            spreadRadius: 1,
                            blurRadius: 8)
                      ],
                    ),
                    child: Text(
                      numList[index],
                      style: const TextStyle(
                          color: AppColor.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

// Iterable Expample
// main(){
//   Iterable<int> evenNumbers;
//   List evenNumList;
//
//   const List<int> myList = [1, 2, 3, 4, 5, 6, 7, 8];
//   evenNumbers = myList.where((element) => element.isEven);
//
//   Iterable to List
//   evenNumList = evenNumbers.toList();
//   print(evenNumList);
//
// }
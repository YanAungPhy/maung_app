import 'package:two_d/pages/two_d_page/two_d_detail_page.dart';
import 'package:two_d/utils/global_import.dart';
import 'package:collection/collection.dart';
import '../../models/bet_body_model.dart';

class ThreeDPage extends StatefulWidget {
  final String balance;
  const ThreeDPage({super.key, required this.balance});

  @override
  State<ThreeDPage> createState() => _ThreeDPageState();
}

class _ThreeDPageState extends State<ThreeDPage> {
  List<String> numList = [
    for (var i = 0; i < 1000; i++) i.toString().padLeft(3, "0")
  ];
  List<BetBodyDetailsModel> betDetailList = [];
  int selectedWidget = 0;
  String dropdownvalue = '0-999';

  List<String> items = [
    '0-999',
    '0-100',
    '100-200',
    '200-300',
    '300-400',
    '400-500',
    '500-600',
    '600-700',
    '700-800',
    '800-900',
    '900-999',
  ];
  final formKey = GlobalKey<FormState>();
  TextEditingController amountTextController = TextEditingController();
  String? amount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              selectedNumberWidget(size),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "အလွယ်ရှာရန် >>",
                    style:
                        TextStyle(color: AppColor.unSelectedGrey, fontSize: 13),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      switch (newValue) {
                        case "0-999":
                          numList = [
                            for (var i = 0; i < 1000; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "0-100":
                          numList = [
                            for (var i = 0; i <= 100; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "100-200":
                          numList = [
                            for (var i = 100; i <= 200; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "200-300":
                          numList = [
                            for (var i = 200; i <= 300; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "300-400":
                          numList = [
                            for (var i = 300; i <= 400; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "400-500":
                          numList = [
                            for (var i = 400; i <= 500; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "500-600":
                          numList = [
                            for (var i = 500; i <= 600; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "600-700":
                          numList = [
                            for (var i = 600; i <= 700; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "700-800":
                          numList = [
                            for (var i = 700; i <= 800; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "800-900":
                          numList = [
                            for (var i = 800; i <= 900; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        case "900-999":
                          numList = [
                            for (var i = 900; i < 1000; i++)
                              i.toString().padLeft(3, "0")
                          ];
                          break;
                        default:
                          numList = [
                            for (var i = 0; i < 1000; i++)
                              i.toString().padLeft(3, "0")
                          ];
                      }
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 5, left: 5, right: 5),
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
                  child: numbersWidget(),
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
      padding: const EdgeInsets.all(10),
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
      child: Row(
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
          TextButton(
            onPressed: () {
              if (betDetailList.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text.rich(
                      TextSpan(
                        text: "Fail !   :   ",
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

  Widget numbersWidget() {
    return GridView.builder(
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
                    betDetailList.add(
                      BetBodyDetailsModel(
                          amount: amount!, digit: numList[index]),
                    );
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
        });
  }
}

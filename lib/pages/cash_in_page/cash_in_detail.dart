import 'package:flutter/services.dart';
import 'package:two_d/bloc/balance_transation/bloc/balance_transation_bloc.dart';
import 'package:two_d/models/bank_model.dart';
import 'package:two_d/utils/global_import.dart';

class CahInDetail extends StatelessWidget {
  final BankModel bankModel;
  const CahInDetail({super.key, required this.bankModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController lastDigitController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(bankModel.name!),
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.greenBlack,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: const Icon(Icons.close)),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ဖုန်းနံပါတ်များ",
                  style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              banksAccs(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ဖော်ပြချက်",
                  style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: AppColor.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          bankModel.description!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ငွေဖြည့်နည်း",
                  style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: AppColor.grey),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("၁ : ငွေလွှဲမည့်ဖုန်းနံပါတ်ကိုကူးယူပါ"),
                    Text("၂ : ${bankModel.name} မှ ငွေလွှဲပါ"),
                    const Text(
                        "၃ : ငွေလွှဲပြီးရလာသော လုပ်ငန်းစဥ်အမှတ် နောက်ဆုံး ၆ လုံးကို အောက်တွင်ဖြည့်ပါ"),
                    const Text("၄ : ငွေဖြည့်မည် ကို နှိပ်ပါ")
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "လုပ်ငန်းစဥ်အမှတ် နောက်ဆုံး ၆ လုံးကို ဖြည့်ပါ",
                  style: TextStyle(
                    color: AppColor.unSelectedGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "လုပ်ငန်းစဥ်အမှတ် နောက်ဆုံး ၆ လုံးကို ဖြည့်ပါ";
                    }
                    if (value.length != 6) {
                      return "လုပ်ငန်းစဥ်အမှတ် နောက်ဆုံး ၆ လုံးကို ဖြည့်ပါ";
                    }
                    return null;
                  },
                  controller: lastDigitController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.payment,
                    ),
                    iconColor: AppColor.unSelectedGrey,
                    focusColor: AppColor.greenPrimary,
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white,
                    label: const FittedBox(
                        child: Text("လုပ်ငန်းစဥ်အမှတ် နောက်ဆုံး ၆ လုံး")),
                    floatingLabelStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.teal),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: AppColor.greenPrimary, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: AppColor.unSelectedGrey, width: 2.0),
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus!.unfocus();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider<BalanceTransationBloc>(
                              create: (context) =>
                                  BalanceTransationBloc(getIt.call()),
                              child: BlocBuilder<BalanceTransationBloc,
                                  BalanceTransationState>(
                                builder: (context, state) {
                                  if (state is BalanceTransationInitial) {
                                    BlocProvider.of<BalanceTransationBloc>(
                                            context)
                                        .add(TapBalanceTransationEvent(
                                            transationDetail: {
                                          "type": "In",
                                          "paymentMethodId": bankModel.id,
                                          "transactionId":
                                              lastDigitController.text
                                        }));
                                    return const AlertDialog(
                                      title: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  } else if (state
                                      is BalanceTransationSuccess) {
                                    return AlertDialog(
                                      title: const Text(
                                        "အောင်မြင်ပါသည်",
                                        style: TextStyle(
                                            color: AppColor.greenPrimary),
                                      ),
                                      content: const Text(
                                        "ငွေသွင်းခြင်း လုပ်ငန်းစဥ်မှာ အချိန် ၁၅ မိနစ်ခန့် ကြာနိုင်ပါသည် ",
                                        style: TextStyle(
                                            color: AppColor.unSelectedGrey),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              lastDigitController.clear();
                                              context.back();
                                            },
                                            child: const Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: AppColor.greenPrimary),
                                            ))
                                      ],
                                    );
                                  } else if (state is BalanceTransationFail) {
                                    return AlertDialog(
                                      title: const Text(
                                        "FAILED",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      content: Text(
                                        state.error,
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              lastDigitController.clear();
                                              context.back();
                                            },
                                            child: const Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: AppColor.greenPrimary),
                                            ))
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
                          });
                    }
                    null;
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      fixedSize: const Size(150, 30)),
                  child: const Text("ငွေဖြည့်မည်"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container banksAccs() {
    return Container(
      decoration: const BoxDecoration(color: AppColor.grey),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bankModel.phoneNoList![index],
                    style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: .8,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: bankModel.phoneNoList![index]),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Copied number"),
                      ));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 25,
                      color: AppColor.unSelectedGrey,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: bankModel.phoneNoList!.length),
    );
  }
}

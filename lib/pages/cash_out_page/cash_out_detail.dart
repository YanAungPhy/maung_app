import 'package:flutter/services.dart';
import 'package:two_d/bloc/balance_transation/bloc/balance_transation_bloc.dart';
import 'package:two_d/models/bank_model.dart';
import 'package:two_d/utils/global_import.dart';

class CashoutDetail extends StatelessWidget {
  final BankModel bankModel;
  const CashoutDetail({super.key, required this.bankModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
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
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ထုတ်ယူလိုသော ပမာဏ ကို ဖြည့်ပါ",
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
                      return "အလွတ်မဖြစ်ရ";
                    }
                    if (int.parse(value) < 1000) {
                      return "အနည်းဆုံး ၁၀၀၀ ထုတ်ပါ";
                    }
                    return null;
                  },
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.money,
                    ),
                    iconColor: AppColor.unSelectedGrey,
                    focusColor: AppColor.greenPrimary,
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white,
                    label: const Text("ထုတ်ယူလိုသော ပမာဏ"),
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "လက်ခံမည့် ဖုန်းနံပါတ် ကို ဖြည့်ပါ",
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
                      return "ဖုန်းနံပါတ် အလွတ်မဖြစ်ရ";
                    }
                    return null;
                  },
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    iconColor: AppColor.unSelectedGrey,
                    focusColor: AppColor.greenPrimary,
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white,
                    label: const Text("ဖုန်းနံပါတ် ထည့်ပါ"),
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
                                          "type": "Out",
                                          "paymentMethodId": bankModel.id,
                                          "outBalance": amountController.text,
                                          "transactionId": "",
                                          "phoneNo": phoneController.text
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
                                        "ငွေထုတ်ခြင်း လုပ်ငန်းစဥ်မှာ အချိန် ၁၅ မိနစ်ခန့် ကြာနိုင်ပါသည် ",
                                        style: TextStyle(
                                            color: AppColor.unSelectedGrey),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              amountController.clear();
                                              phoneController.clear();
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
                                              amountController.clear();
                                              phoneController.clear();
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
                  child: const Text("ငွေထုတ်မည်"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:two_d/bloc/get_banks/bloc/get_banks_bloc.dart';
import 'package:two_d/models/bank_model.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/utils/global_import.dart';

import 'cash_in_detail.dart';

class CashInPage extends StatelessWidget {
  const CashInPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetBanksBloc>(context).add(TapGetBanksEvent());
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("ငွေသွင်း"),
          backgroundColor: AppColor.greenBlack,
        ),
        body: BlocBuilder<GetBanksBloc, GetBanksState>(
          builder: (context, state) {
            if (state is GetBanksSuccess) {
              List<BankModel> bankModelList = state.banksmodelList;
              return ListView.separated(
                  itemCount: bankModelList.length,
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.blueGrey,
                        height: 0,
                        thickness: 2,
                      ),
                  itemBuilder: (context, index) {
                    return bankWidget(bankModelList[index], context);
                  });
            } else if (state is GetBanksFail) {
              return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColor.white.withOpacity(.5),
                  child: ErrorPage(error: state.error));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget bankWidget(BankModel bankModel, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.greenSecondry,
        border: Border(
          left: BorderSide(color: AppColor.greenBlack, width: 15),
        ),
      ),
      child: ListTile(
        onTap: () {
          context.go(
            CahInDetail(
              bankModel: bankModel,
            ),
          );
        },
        isThreeLine: true,
        leading: CachedNetworkImage(
          width: 50,
          imageUrl: bankModel.imageLink!,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
        title: Text(bankModel.name!),
        subtitle: Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bankModel.phoneNoList!.length,
            itemBuilder: (context, index) {
              return Text(bankModel.phoneNoList![index]);
            },
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          size: 35,
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/pages/history_page/football_history_detail.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/history/bloc/football/football_history_bloc.dart';
import '../../models/football_history_model.dart';
class FootballHistoryPage extends StatefulWidget {
  const FootballHistoryPage({super.key});

  @override
  State<FootballHistoryPage> createState() => _FootballHistoryPageState();
}

class _FootballHistoryPageState extends State<FootballHistoryPage> {
  List<FootballHistoryModel> historyModelList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    BlocProvider.of<FootballHistoryBloc>(context)
        .add(FootballTapHistoryMoreEvent( gameType: "Unfinish"));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<FootballHistoryBloc, FootballHistoryBlocState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FootballHistoryBlocSuccess) {
          historyModelList = state.historyModelList;
          if (historyModelList.isNotEmpty) {
            return listVbuilder(size);
          } else {
            return const ErrorPage(error: "မှတ်တမ်းမရှိပါ");
          }
        } else if (state is FootballHistoryBlocFail) {
          return ErrorPage(error: state.error);
        } else {
         // return const Center(child: CircularProgressIndicator());
          return const ErrorPage(error: "မှတ်တမ်းမရှိပါ");
        }
      },
    );
  }

  Widget listVbuilder(Size size) {
    return ListView.builder(
      itemCount: historyModelList.length,
      itemBuilder: (context, index) {
        return listItemWidget(historyModelList[index], size, context);
      },
    );
  }

  Widget listItemWidget(FootballHistoryModel historyModelDetail, Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FootballHistoryDetailPage(
                historyId: historyModelDetail.id ?? 0,
              ),
            ),
          );
        },
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.3),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoRow("Date: ", DateFormat.yMEd().add_jms().format(
                  DateTime.fromMillisecondsSinceEpoch(
                      historyModelDetail.createdDateInMilliSeconds!),
                )),
                const SizedBox(height: 10),
                infoRow("Maung Body: ", historyModelDetail.gameType.toString()),
                const SizedBox(height: 10),
                infoRow("Amount: ", historyModelDetail.amount.toString()),
                const SizedBox(height: 10),
                infoRow("ပွဲအခြေအနေ: ", historyModelDetail.status.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 121, 250),
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 235, 121, 250),
          ),
        ),
      ],
    );
  }
}


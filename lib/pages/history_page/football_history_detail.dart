import 'package:easy_localization/easy_localization.dart';
import 'package:two_d/models/football_history_model.dart';

import '../../utils/global_import.dart';

class FootballHistoryDetailPage extends StatelessWidget {
  final FootballHistoryModel historyModelDetail;

  FootballHistoryDetailPage({required this.historyModelDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date: ${DateFormat.yMEd().add_jms().format(DateTime.fromMillisecondsSinceEpoch(historyModelDetail.createdDateInMilliSeconds!))}"),
            const SizedBox(height: 10),
            Text("Maung Body: ${historyModelDetail.id}"),
            const SizedBox(height: 10),
            Text("Amount: ${historyModelDetail.amount}"),
            const SizedBox(height: 10),
            Text("Status: ${historyModelDetail.status}"),
            Text("Status: ${historyModelDetail.token}"),
          ],
        ),
      ),
    );
  }
}

import '../../bloc/history/football_detail_bloc/football_detail_history_bloc.dart';
import '../../utils/global_import.dart';

class FootballHistoryDetailPage extends StatelessWidget {
  final int historyId;  // ID is passed instead of the whole model

  const FootballHistoryDetailPage({Key? key, required this.historyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FootballDetailHistoryBloc(getIt.call())..add(TapFootballHistoryDetailEvent(historyId: historyId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FootballDetailHistoryBloc, FootballDetailHistoryBlocState>(
            builder: (context, state) {
              if (state is FootballDetailHistoryBlocLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FootballDetailHistoryBlocSuccess) {
                //final historyModelDetail = state.footballHistory;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text("Maung Id:  ${historyId}"),
                    // const SizedBox(height: 10),
                    // Text("Amount: ${historyModelDetail.amount}"),
                    // const SizedBox(height: 10),
                    // Text("Status: ${historyModelDetail.status}"),
                    // Text("Token: ${historyModelDetail.token}"),
                  ],
                );
              } else if (state is FootballDetailHistoryBlocFail) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('Unknown state'));
              }
            },
          ),
        ),
      ),
    );
  }
}

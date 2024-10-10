import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'singup_bloc_event.dart';
part 'singup_bloc_state.dart';

class SingupBlocBloc extends Bloc<SingupBlocEvent, SingupBlocState> {
  SingupBlocBloc() : super(SingupBlocInitial()) {
    on<SingupBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

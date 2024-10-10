part of 'singup_bloc_bloc.dart';

abstract class SingupBlocState extends Equatable {
  const SingupBlocState();
  
  @override
  List<Object> get props => [];
}

class SingupBlocInitial extends SingupBlocState {}

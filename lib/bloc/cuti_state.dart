part of 'cuti_bloc.dart';

abstract class CutiState extends Equatable {
  const CutiState({this.cutis = const <CutiModel>[]});

  final List<CutiModel> cutis;

  @override
  List<Object> get props => [cutis];
}

class CutiInitial extends CutiState {}

class CutiLoading extends CutiState {}

class CutiAddLoading extends CutiState {
  const CutiAddLoading(this.cutis) : super(cutis: cutis);

  final List<CutiModel> cutis;

  @override
  List<Object> get props => [cutis];
}

class CutiIsEmpty extends CutiState {}

class CutiIsLoaded extends CutiState {
  const CutiIsLoaded({required this.cutis}) : super(cutis: cutis);

  final List<CutiModel> cutis;

  @override
  List<Object> get props => [cutis];
}

class CutiSuccess extends CutiState {}

class CutiFailure extends CutiState {
  const CutiFailure({
    required this.message,
    this.cutis = const <CutiModel>[],
  }) : super(cutis: cutis);

  final String message;
  final List<CutiModel> cutis;

  @override
  List<Object> get props => [message];
}

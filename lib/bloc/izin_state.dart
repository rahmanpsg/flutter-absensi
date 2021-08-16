part of 'izin_bloc.dart';

abstract class IzinState extends Equatable {
  const IzinState({this.izins = const <IzinModel>[]});

  final List<IzinModel> izins;

  @override
  List<Object> get props => [izins];
}

class IzinInitial extends IzinState {}

class IzinLoading extends IzinState {}

class IzinAddLoading extends IzinState {
  const IzinAddLoading(this.izins) : super(izins: izins);

  final List<IzinModel> izins;

  @override
  List<Object> get props => [izins];
}

class IzinIsEmpty extends IzinState {}

class IzinIsLoaded extends IzinState {
  const IzinIsLoaded({required this.izins}) : super(izins: izins);

  final List<IzinModel> izins;

  @override
  List<Object> get props => [izins];
}

class IzinSuccess extends IzinState {}

class IzinFailure extends IzinState {
  const IzinFailure({
    required this.message,
    this.izins = const <IzinModel>[],
  }) : super(izins: izins);

  final String message;
  final List<IzinModel> izins;

  @override
  List<Object> get props => [message];
}

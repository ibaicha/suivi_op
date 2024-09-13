part of 'all_varietes_bloc.dart';

abstract class AllVarietesEvent extends Equatable {
  const AllVarietesEvent();
}

class LoadAllVarietesEvent extends AllVarietesEvent {
  const LoadAllVarietesEvent();

  @override
  List<Object?> get props => [];
}

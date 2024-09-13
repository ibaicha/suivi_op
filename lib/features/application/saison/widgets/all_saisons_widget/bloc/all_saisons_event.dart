part of 'all_saisons_bloc.dart';

abstract class AllSaisonsEvent extends Equatable {
  const AllSaisonsEvent();
}

class LoadAllSaisonsEvent extends AllSaisonsEvent {
  const LoadAllSaisonsEvent();

  @override
  List<Object?> get props => [];
}

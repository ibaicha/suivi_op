part of 'all_annees_bloc.dart';

abstract class AllAnneesEvent extends Equatable {
  const AllAnneesEvent();
}

class LoadAllAnneesEvent extends AllAnneesEvent {
  const LoadAllAnneesEvent();

  @override
  List<Object?> get props => [];
}

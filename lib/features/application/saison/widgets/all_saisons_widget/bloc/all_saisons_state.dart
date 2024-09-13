part of 'all_saisons_bloc.dart';

abstract class AllSaisonsState extends Equatable {
  const AllSaisonsState();

  @override
  List<Object> get props => [];
}

class AllSaisonsInitialState extends AllSaisonsState {}

class AllSaisonsLoadingState extends AllSaisonsState {}

class AllSaisonsLoadedState extends AllSaisonsState {
  final List<MxSaisonObject> apiResult;

  const AllSaisonsLoadedState({
    required this.apiResult,
  });
}

class AllSaisonsErrorState extends AllSaisonsState {}

part of 'all_varietes_bloc.dart';

abstract class AllVarietesState extends Equatable {
  const AllVarietesState();

  @override
  List<Object> get props => [];
}

class AllVarietesInitialState extends AllVarietesState {}

class AllVarietesLoadingState extends AllVarietesState {}

class AllVarietesLoadedState extends AllVarietesState {
  final List<MxVarieteObject> apiResult;

  const AllVarietesLoadedState({
    required this.apiResult,
  });
}

class AllVarietesErrorState extends AllVarietesState {}
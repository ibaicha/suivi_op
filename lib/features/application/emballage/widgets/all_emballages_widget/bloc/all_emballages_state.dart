part of 'all_emballages_bloc.dart';

abstract class AllEmballagesState extends Equatable {
  const AllEmballagesState();

  @override
  List<Object> get props => [];
}

class AllEmballagesInitialState extends AllEmballagesState {}

class AllEmballagesLoadingState extends AllEmballagesState {}

class AllEmballagesLoadedState extends AllEmballagesState {
  final List<EmballageObject> apiResult;

  const AllEmballagesLoadedState({
    required this.apiResult,
  });
}

class AllEmballagesErrorState extends AllEmballagesState {}

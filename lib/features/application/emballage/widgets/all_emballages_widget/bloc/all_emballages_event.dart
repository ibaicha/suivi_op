part of 'all_emballages_bloc.dart';

abstract class AllEmballagesEvent extends Equatable {
  const AllEmballagesEvent();
}

class LoadAllEmballagesEvent extends AllEmballagesEvent {
  const LoadAllEmballagesEvent();

  @override
  List<Object?> get props => [];
}

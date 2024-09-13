import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/repository/repositories.dart';
import '../../../data/repository/emballage_repository.dart';
 
part 'all_emballages_event.dart';
part 'all_emballages_state.dart';

class AllEmballagesBloc extends Bloc<AllEmballagesEvent, AllEmballagesState> {
  final EmballageRepository emballageRepository;

  AllEmballagesBloc(
    this.emballageRepository,
  ) : super(AllEmballagesInitialState()) {
    on<LoadAllEmballagesEvent>(_AllEmballagesEvent);
  }

  void _AllEmballagesEvent(
    LoadAllEmballagesEvent event,
    Emitter<AllEmballagesState> emitter,
  ) async {
    if (event is LoadAllEmballagesEvent) {
      emitter(AllEmballagesLoadingState());
      // await Future.delayed(const Duration(milliseconds: 500));
      List<EmballageObject>? apiResult = await emballageRepository.getEmballagesBox();
      if (apiResult == null) {
        emitter(AllEmballagesErrorState());
      } else {
        emitter(AllEmballagesLoadedState(apiResult: apiResult));
      }
    }
  }
}

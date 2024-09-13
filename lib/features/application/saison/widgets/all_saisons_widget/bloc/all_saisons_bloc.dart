import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/repository/repositories.dart';
 
part 'all_saisons_event.dart';
part 'all_saisons_state.dart';

class AllSaisonsBloc extends Bloc<AllSaisonsEvent, AllSaisonsState> {
  final SaisonRepository saisonRepository;

  AllSaisonsBloc(
    this.saisonRepository,
  ) : super(AllSaisonsInitialState()) {
    on<LoadAllSaisonsEvent>(_AllSaisonsEvent);
  }

  void _AllSaisonsEvent(
    LoadAllSaisonsEvent event,
    Emitter<AllSaisonsState> emitter,
  ) async {
    if (event is LoadAllSaisonsEvent) {
      emitter(AllSaisonsLoadingState());
      // await Future.delayed(const Duration(milliseconds: 500));
      List<MxSaisonObject>? apiResult = await saisonRepository.getSaisonsBox();
      if (apiResult == null) {
        emitter(AllSaisonsErrorState());
      } else {
        emitter(AllSaisonsLoadedState(apiResult: apiResult));
      }
    }
  }
}

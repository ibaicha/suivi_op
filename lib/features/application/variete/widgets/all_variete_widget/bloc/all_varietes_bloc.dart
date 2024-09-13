import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/repository/repositories.dart';
 
part 'all_varietes_event.dart';
part 'all_varietes_state.dart';

class AllVarietesBloc extends Bloc<AllVarietesEvent, AllVarietesState> {
  final VarieteRepository varieteRepository;

  AllVarietesBloc(
    this.varieteRepository,
  ) : super(AllVarietesInitialState()) {
    on<LoadAllVarietesEvent>(_AllVarietesEvent);
  }

  void _AllVarietesEvent(
    LoadAllVarietesEvent event,
    Emitter<AllVarietesState> emitter,
  ) async {
    if (event is LoadAllVarietesEvent) {
      emitter(AllVarietesLoadingState());
      // await Future.delayed(const Duration(milliseconds: 500));
      List<MxVarieteObject>? apiResult = await varieteRepository.getVarietesBox();
      if (apiResult == null) {
        emitter(AllVarietesErrorState());
      } else {
        emitter(AllVarietesLoadedState(apiResult: apiResult));
      }
    }
  }
}

import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/service/services.dart';

class VarieteRepository {
  const VarieteRepository({
    required this.service,
  });
  final VarieteService service;

  Future<List<MxVarieteObject>> getVarietesBox() async => service.getAllVarietes();
}

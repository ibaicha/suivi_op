
import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/service/services.dart';

class AnneeRepository {
  const AnneeRepository({
    required this.service,
  });
  final AnneeService service;

  Future<List<MxAnneeObject>> getAnneesBox() async =>
      service.getAllAnnees();
}

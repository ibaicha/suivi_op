import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/service/services.dart';

class EmballageRepository {
  const EmballageRepository({
    required this.service,
  });
  final EmballageService service;

  Future<List<EmballageObject>> getEmballagesBox() async =>
      service.getAllEmballages();
}

import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../../core/data/service/services.dart';

class SaisonRepository {
  const SaisonRepository({
    required this.service,
  });
  final SaisonService service;

  Future<List<MxSaisonObject>> getSaisonsBox() async => service.getAllSaisons();
}

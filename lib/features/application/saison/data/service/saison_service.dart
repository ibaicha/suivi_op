import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../objectbox.g.dart';

class SaisonService {
  Future<List<MxSaisonObject>> getAllSaisons() async {
    final saisonBox = ObjectBox.mxsaisonsBox;
    List<MxSaisonObject> mesSaisons = [];

    Query<MxSaisonObject> query = saisonBox!.query().build();
    mesSaisons = query.find();
    query.close();
    return mesSaisons;
  }
}

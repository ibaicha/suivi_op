
import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../objectbox.g.dart';

class EmballageService {
  Future<List<EmballageObject>> getAllEmballages() async {
    final emballageBox = ObjectBox.emballagesBox;
    List<EmballageObject> mesEmballages = [];

    Query<EmballageObject> query = emballageBox!.query().build();
    mesEmballages = query.find();
    query.close();
    return mesEmballages;
  }
}

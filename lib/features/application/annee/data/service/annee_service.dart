
import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../objectbox.g.dart';

class AnneeService {
  Future<List<MxAnneeObject>> getAllAnnees() async {
    final mxanneeBox = ObjectBox.mxanneesBox;
    List<MxAnneeObject> mesAnnees = [];

    Query<MxAnneeObject> query = mxanneeBox!.query().build();
    mesAnnees = query.find();
    query.close();
    return mesAnnees;
  }
}

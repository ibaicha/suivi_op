import 'package:suivi_op/core/data/model/ObjectBox/objectBoxModels.dart';
import 'package:suivi_op/core/data/service/ObjectBoxHelper.dart';
import 'package:suivi_op/objectbox.g.dart';




class VarieteService {
  Future<List<MxVarieteObject>> getAllVarietes() async {
    final varieteBox = ObjectBox.mxvarietesBox;
    List<MxVarieteObject> mesVarietes = [];

    Query<MxVarieteObject> query = varieteBox!.query().build();
    mesVarietes = query.find();
    query.close();
    return mesVarietes;
  }
}

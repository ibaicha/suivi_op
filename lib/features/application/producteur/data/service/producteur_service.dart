import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/ObjectBoxHelper.dart';
import '../../../../../objectbox.g.dart';

class ProducteurService {
  Future<List<ProducteurObject>> getAllProducteurs() async {
    final ProducteurBox = ObjectBox.producteurBox;
    List<ProducteurObject> mesProducteurs = [];

    Query<ProducteurObject> query = ProducteurBox!.query().build();
    mesProducteurs = query.find();
    query.close();
    return mesProducteurs;
  }

    Future<List<MxProducteurObject>> getMxAllProducteurs() async {
    final mxproducteursBox = ObjectBox.mxproducteursBox;
    List<MxProducteurObject> mesProducteurs = [];

    Query<MxProducteurObject> query = mxproducteursBox!.query().build();
    mesProducteurs = query.find();
    query.close();
    return mesProducteurs;
  }


  Future<List<ProducteurObject>> getAllProducteursIdOp(int idOp) async {
    final ProducteurBox = ObjectBox.producteurBox;
    List<ProducteurObject> mesProducteurs = [];

    Query<ProducteurObject> query =
        ProducteurBox!.query(ProducteurObject_.opid.equals(idOp)).build();
    mesProducteurs = query.find();
    query.close();
    return mesProducteurs;
  }

    Future<List<MxProducteurObject>> getMxAllProducteursIdOp(int idOp) async {
    final mxproducteursBox = ObjectBox.mxproducteursBox;
    List<MxProducteurObject> mesProducteurs = [];

    Query<MxProducteurObject> query =
        mxproducteursBox!.query(MxProducteurObject_.mxOpObject.equals(idOp)).build();
    mesProducteurs = query.find();
    query.close();
    return mesProducteurs;
  }
}

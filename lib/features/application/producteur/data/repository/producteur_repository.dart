import '../../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../../core/data/service/services.dart';

class ProducteurRepository {
  const ProducteurRepository({
    required this.service,
  });
  final ProducteurService service;

  Future<List<ProducteurObject>> getProducteursBox() async =>
      service.getAllProducteurs();

  Future<List<ProducteurObject>> getProducteursIdOpBox(int idOp) async =>
      service.getAllProducteursIdOp(idOp);



  Future<List<MxProducteurObject>> getMxProducteursBox() async =>
      service.getMxAllProducteurs();

  Future<List<MxProducteurObject>> getMxProducteursIdOpBox(int idOp) async =>
      service.getMxAllProducteursIdOp(idOp);
}

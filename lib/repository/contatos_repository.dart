import 'package:dio_node_js/model/contato_model.dart';
import 'package:dio_node_js/utils/custom_dio.dart';

class ContatosRepository {
  Future<List<ContatoModel>> findAll() {
    var _dio = CustomDio.withAuthentication().instance;
    return _dio.get('http://localhost:3000/contatos').then((res) {
      return res.data.map<ContatoModel>((c) => ContatoModel.fromMap(c)).toList()
          as List<ContatoModel>;
    });
  }

  Future<List<ContatoModel>> findFilter(String nome) {
    var _dio = CustomDio.withAuthentication().instance;
    return _dio
        .get('http://localhost:3000/contatos/filtrar?nome=$nome')
        .then((res) {
      return res.data.map<ContatoModel>((c) => ContatoModel.fromMap(c)).toList()
          as List<ContatoModel>;
    });
  }
}

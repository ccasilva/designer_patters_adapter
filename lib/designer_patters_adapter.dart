import 'package:designer_patters_adapter/endereco_model.dart';
import 'package:designer_patters_adapter/xml2_json_adapter.dart';
import 'package:designer_patters_adapter/xml2_json_transform.dart';
import 'package:dio/dio.dart';

Future<void> run() async {
  var enderecoModel = await Dio()
      .get('http://viacep.com.br/ws/01001000/json/')
      .then((res) => EnderecoModel.fromJson(res.data));

  print(enderecoModel);
  print('########################################################');
  print('XML');

  var res = await Dio()
      .get('http://viacep.com.br/ws/01001000/xml/')
      .then((res) => Xml2JsonAdapter.adapter(res.data))
      .then((res) => EnderecoModel.fromJson(res['xmlcep']));

  print(res);
  print(res.runtimeType);
  print('########################################################');
  print('XML Por Transform');

  var dio = Dio();
  dio.transformer = xml2JsonTransform();
  var res2 = await dio
      .get('http://viacep.com.br/ws/01001000/xml/')
      .then((res) => EnderecoModel.fromJson(res.data['xmlcep']));

  print(res2);
  print(res.runtimeType);
}

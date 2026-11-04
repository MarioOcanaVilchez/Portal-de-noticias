

import 'package:http/http.dart' as http;
import 'package:portal_noticias/Utils/Utils.dart';

import 'package:portal_noticias/models/noticias_model.dart';

const String URL_BASE = 'https://gnews.io/api/v4/top-headlines?lang=es&max=10&country=es&apikey=';
//category=general&from=2026-10-25T00:00:00Z&to=2026-10-28T23:59:59Z&

Future<List<Article>> getNoticias(String tipo) async{
  
  var response = await http.get(Uri.parse('${URL_BASE}&category=${tipo}&from=${getFechaAnterior(3)}&to=${DateTime.now()}'));
  if (response.statusCode != 200){
    print('Error http ${response.body}');
    throw Error();
  }
  return noticasResponseFromJson(response.body).articles;
}

Future<List<Article>> getNoticiasTexto(String texto) async{
  
  var response = await http.get(Uri.parse('${URL_BASE}&q="${texto}"'));
  if (response.statusCode != 200){
    print('Error http ${response.body}');
    throw Error();
  }
  return noticasResponseFromJson(response.body).articles;
}

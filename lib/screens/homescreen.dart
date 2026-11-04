import 'package:flutter/material.dart';
import 'package:portal_noticias/models/noticias_model.dart';
import 'package:portal_noticias/service/noticias_service.dart';

class HomeScreen extends StatefulWidget {
  new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tipo = 2;
  String textoBuscador = '';
  Map<int,List<Article>> noticias = {
    0: [],
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
    7: []
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Portal noticias'),centerTitle: true,),
    body: Center(child: Column(children: [
      SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Row(children: [
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(1);
          }, child: Text('Globales')),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(2);
          }, child: Text('España')),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(3);
          }, child: Text('Sucesos')),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(4);
          }, child: Text('Deportes')),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(5);
          }, child: Text('Economia')),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(6);
          }, child: Text('Tecnología')),
          SizedBox(width: 20,),
          ElevatedButton(onPressed: () async{
            cambiaTipo(7);
          }, child: Text('Entretenimiento')),
          SizedBox(width: 20,),
        ],),
      ),
      SizedBox(height: 20,),
      Row(children: [
        SizedBox(width: 20,),
        Container(
          child: TextField(
            onChanged: (value) => textoBuscador = value,
          decoration: InputDecoration(
            labelText: 'Buscador',
            hintText: 'Buscar...',
            border: OutlineInputBorder()
          ),
                ),width: 250,
        ),IconButton(onPressed: () async {
          tipo = 0;
          noticias[tipo] = [];
          setState(() {
            
          });
          noticias[tipo] = await getNoticiasTexto(textoBuscador);
          print(noticias[tipo]);
          setState(() {
            
          });
        
      }, icon: Icon(Icons.arrow_right_alt),)
      ],mainAxisAlignment: MainAxisAlignment.start,),
      noticias[tipo]!.isEmpty ? Column(children: [SizedBox(height: 275,),CircularProgressIndicator()],mainAxisAlignment: MainAxisAlignment.center,) :
      Expanded(
        child: SingleChildScrollView( child: Column(children: 
          pintaNoticias(noticias[tipo]!)
        ,),scrollDirection: Axis.vertical,
        ),
      )
      //Aqui pintamos las noticias
    ],),),);
  }

  String getTipo(int tipo){
    switch (tipo){
      case 1: 
      return 'world';
      case 2: 
      return 'nation';
      case 3: 
      return 'general';
      case 4:
      return 'sports';
      case 5:
      return 'business';
      case 6:
      return 'technology';
      default:
      return 'entertainment';
    }
  }

  List<Widget> pintaNoticias(List<Article> noticias){
    List<Widget> filas = [];
    if (noticias.isNotEmpty){
    for (var noticia in noticias) {
      filas.add(Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 20),
        child: Container(
          child: Column(children: [
            Image.network(noticia.image,width: 300,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('${noticia.title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('${noticia.description}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('${noticia.content.contains('[') ? noticia.content.substring(0,noticia.content.lastIndexOf('[')) : noticia.content}',style: TextStyle(fontSize: 12),maxLines: 6,),
            ),
            SizedBox(height: 5,),
            Row(children: [
              Text('${noticia.publishedAt.day}-${noticia.publishedAt.month} ${noticia.publishedAt.hour}:${noticia.publishedAt.minute}:${noticia.publishedAt.second}'),
              Text('${noticia.source.name}')
            ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
            ,SizedBox(height: 25,)
          ],),
        width: 300,),
      ));
    }
    } else {
      filas.add(Text('No hay noticias de esta categoria'));
      
    }
    return filas;
  }
  @override
  void initState() {
    cargaNoticias();
  }
  Future<void> cargaNoticias() async{
    if (noticias[tipo]!.isEmpty) noticias[tipo] = await getNoticias(getTipo(tipo));
    setState(() {
      
    });
  }
  void cambiaTipo(int tipoNuevo){
            tipo = tipoNuevo;
            print(noticias[tipo]);
            setState(() {
              
            });
            if (noticias[tipo]!.isEmpty){
              cargaNoticias();
            }
  }
}
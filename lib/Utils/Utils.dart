
import 'package:http/http.dart';

DateTime getFechaAnterior(int dias){
  DateTime fecha = DateTime.now();
  try{
    return DateTime(fecha.year,fecha.month,fecha.day - dias);
  }catch(Error){

  }
  try{
    return DateTime(fecha.year,fecha.month - 1,getDiasMes(fecha.month - 1) - (dias - fecha.day));
  }catch(Error){

  }
  return DateTime(fecha.year - 1,12,31 - (dias - fecha.day));
}
int getDiasMes(int mes){
  if (mes == 2) return 28;
  if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) return 31;
  return 30;
}
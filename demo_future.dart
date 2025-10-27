// ignore_for_file: avoid_print
import 'dart:async';

Future<String> tenHocSinh() async{
  return "Nguyen Van A";
}

void main() async{
  String name = await tenHocSinh();
  print(name);
  print("tuoi: 16");
}
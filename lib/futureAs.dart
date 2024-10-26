
import 'dart:developer';

Future<String> firstAsync() async {
  await Future.delayed(Duration(seconds: 2));
  return "firstdelay";
}

Future<String> secondAsync() async {
  await Future.delayed(Duration(seconds: 2));
  return "seconddelay";
}

Future<String> thirdAsync() async {
  await Future.delayed(Duration(seconds: 2));
  return "thirddelay";
}

void main(List<String> args) async {
  var f = await firstAsync();
  print(f);
  var s = await secondAsync();
  print(s);
  var th = await thirdAsync();
  print(th);
}

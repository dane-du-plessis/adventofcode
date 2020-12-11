import 'dart:collection';
import 'dart:io';

main() async {
  File myFile = new File('day1.text');
  List<String> list = await myFile.readAsLines();
  print(list);
  var numbers = <int>{};
  numbers.addAll(list.map((e) => int.parse(e)));
  print(numbers);

  for (int i in numbers) {
    if (numbers.contains(2020 - i)) {
      print('and the number is: $i * ${2020 - i} = ${i * (2020 - i)}');
    }
  }
}

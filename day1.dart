import 'dart:io';

main() async {
  File myFile = new File('day1.text');
  List<String> list = await myFile.readAsLines();
  print(list);
  Set<int> numbers = <int>{};
  numbers.addAll(list.map((e) => int.parse(e)));
  print(numbers);
  // findPair(numbers, 2020);
  findTriple(numbers);
}

void findTriple(Set<int> numbers) async {
  for (int i in numbers) {
    int target = 2020 - i;
    // numbers.remove(i);
    List success = await findPair(numbers, target);
    if (success.length == 2) {
      print(
          'found it: $i, ${success[0]}, ${success[1]}, sum =${i + success[0] + success[1]}, product = ${i * success[0] * success[1]}');
      return;
    }
    // numbers.add(i);
  }
}

List<int> findPair(Set<int> numbers, int target) {
  for (int i in numbers) {
    if (numbers.contains(target - i)) {
      print('and the number is: $i * ${target - i} = ${i * (target - i)}');
      return [target - i, i];
    }
  }
  return [];
}

import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String task1 = 'this is task 1';
  print(task1);
}

Future task2() async {
  Duration foursecond = Duration(seconds: 4);
  String result=' ';
  await Future.delayed(foursecond, () {
    result = 'this is task 2';
    print('this is task 2');
  });
  return result;
}

void task3(String task2Data) {
  String task3 = 'this is task3';
  print('task3 completed with $task2Data');
}

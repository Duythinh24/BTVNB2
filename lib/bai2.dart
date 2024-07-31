import 'dart:collection';

void main() {
  String tc1 = "{}()";
  String tc2 = "{(})";
  String tc3 = "{()})";
  print(checkString(tc1));
  print(checkString(tc2));
  print(checkString(tc3));
}

bool checkString(String str) {
  Queue<String> queue = Queue<String>();
  Map<String, String> data = {')': '(', '}': '{', ']': '['};
  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    //ktra tồn tại
    if (data.containsValue(char)) {
      queue.addLast(char);
    } else if (data.containsKey(char)) {
      if (queue.isEmpty || data[char] != queue.removeLast()) {
        return false;
      }
    }
  }
  return queue.isEmpty;
}

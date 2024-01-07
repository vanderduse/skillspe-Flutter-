import 'dart:math';

class ListUtils {
  static List<T> getRandomValues<T>(List<T> originalList, int count) {
    List<T> tempList =
        List.from(originalList); // Create a copy of the original list
    tempList.shuffle();
    return tempList.take(count).toList();
  }
}

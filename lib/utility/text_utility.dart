class TextUtility {
  static String toSentenceCase(String input) {
    if (input == null || input.isEmpty) {
      return '';
    }

    // Split the input string into words
    List<String> words = input.split(' ');

    // Capitalize the first letter of each word
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }

    // Join the words back together to form the sentence
    return words.join(' ');
  }
}

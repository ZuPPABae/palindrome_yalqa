bool isPalindrome(String text) {
  final cleanText = text.replaceAll(' ', '').toLowerCase();
  return cleanText == cleanText.split('').reversed.join('');
}
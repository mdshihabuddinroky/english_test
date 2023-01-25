String encryptDecrypt(String text, int key) {
  List<int> bytes = text.codeUnits;
  List<int> result = [];
  for (int i = 0; i < bytes.length; i++) {
    result.add(bytes[i] ^ key);
  }
  return String.fromCharCodes(result);
}
